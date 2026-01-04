import 'package:c_pos/common/constants/app_constants.dart';
import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../../data/datasources/local_data/local_storage.dart';
import '../../../presentation/journey/screen/login/bloc/auth_bloc.dart';
import '../../../presentation/mixins/logger_helper.dart';
import '../../../presentation/mixins/mixins.dart';
import '../../../presentation/widgets/widgets.dart';
import '../../di/injection/injection.dart';
import '../../utils/navigator_service.dart';

typedef TokenPair = ({String accessToken, String refreshToken});

/// Lớp ngoại lệ được tạo ra khi cần thu hồi token.
/// Kế thừa từ `DioException` để sử dụng trong các trường hợp lỗi liên quan đến request.
class RevokeTokenException extends DioException {
  RevokeTokenException({required super.requestOptions});
}

/// Interceptor để quản lý các thao tác liên quan đến token và gọi API.
/// Bao gồm kiểm tra, làm mới token, và xử lý lỗi API.
class NetworkInterceptor extends InterceptorsWrapper with DialogHelper {
  final LocalStorage storage; // Quản lý lưu trữ token
  final LoggerHelper loggerHelper = LoggerHelper(); // Ghi log cho ứng dụng
  final String deviceType;
  final String version;
  final String environment;
  final String baseWriteUrl;
  final String baseReadUrl;

  /// Xóa dữ liệu token cũ trước khi lưu token mới.
  final bool shouldClearBeforeReset;

  /// Khách hàng Dio để gửi yêu cầu làm mới token.
  late final Dio refreshClient;

  /// Khách hàng Dio để thực hiện retry các yêu cầu thất bại (401).
  late final Dio retryClient;

  NetworkInterceptor({
    required this.storage,
    this.shouldClearBeforeReset = true,
    required this.deviceType,
    required this.version,
    required this.environment,
    required this.baseWriteUrl,
    required this.baseReadUrl,
  });

  /// Lấy access token từ local storage.
  Future<String?> get _accessToken => storage.getAccessToken();

  /// Lấy refresh token từ local storage.
  Future<String?> get _refreshToken => storage.getRefreshToken();

  /// Lấy cặp token (access và refresh) từ storage.
  /// Nếu không có, trả về null.
  Future<TokenPair?> _getTokenPair() async {
    final accessToken = await _accessToken;
    final refreshToken = await _refreshToken;

    if (accessToken != null || refreshToken != null) {
      return (accessToken: accessToken ?? '', refreshToken: refreshToken ?? '');
    }
    return null;
  }

  /// Cập nhật cặp token (access và refresh) vào local storage.
  Future<void> _saveTokenPair(TokenPair tokenPair) async {
    await Future.wait([
      storage.setAccessToken(token: tokenPair.accessToken),
      // storage.setRefreshToken(token: tokenPair.refreshToken),
    ]);
  }

  /// Xóa cặp token (access và refresh) khỏi local storage.
  Future<void> _clearTokenPair() async {
    await Future.wait([
      storage.deleteAccessToken(),
      // storage.deleteRefreshToken(),
    ]);
  }

  /// Tạo headers cho các yêu cầu API.
  /// Gồm Authorization dựa trên access token.
  Future<Map<String, dynamic>> _buildHeaders() async {
    final tokenPair = await _getTokenPair();

    return {
      'Authorization': 'Bearer ${tokenPair!.accessToken}',
    };
  }

  /// Kiểm tra xem token có cần được làm mới không (status code 401).
  @visibleForTesting
  @pragma('vm:prefer-inline')
  bool shouldRefresh<R>(Response<R>? response) => response?.statusCode == 401;

  /// Kiểm tra token còn hợp lệ hay không dựa trên thời gian hết hạn (exp trong JWT).
  Future<bool> get _isAccessTokenValid async {
    final tokenPair = await _getTokenPair();

    if (tokenPair == null) {
      return false;
    }

    final decodedJwt = JWT.decode(tokenPair.accessToken);
    final expirationTimeEpoch = decodedJwt.payload['exp'];
    final expirationDateTime =
        DateTime.fromMillisecondsSinceEpoch(expirationTimeEpoch * 1000);

    const marginOfErrorInMilliseconds = 1000; // 1 giây
    const addedMarginTime = Duration(milliseconds: marginOfErrorInMilliseconds);

    return DateTime.now().add(addedMarginTime).isBefore(expirationDateTime);
  }

  /// Làm mới token bằng cách gửi refresh token đến endpoint server.
  /// Nếu thành công, lưu token mới vào storage.
  Future<TokenPair?> _refresh({
    required RequestOptions options,
    TokenPair? tokenPair,
  }) async {
    if (tokenPair == null) {
      throw RevokeTokenException(requestOptions: options);
    }

    try {
      // Cấu hình lại đối tượng 'refreshClient' với header mới chứa 'refresh-Token'
      refreshClient.options = refreshClient.options.copyWith();

      /// lưu ý:
      /// bình thường service đã khỏi tạo nhưng để an toàn hơn
      /// ở bước này nên xử dụng cách này sẽ an toàn hơn
      // Gửi một POST request tới 'auth/refresh-token' sử dụng 'refreshToken' đã được lưu trong storage
      final response = await refreshClient.post('auth/refresh-token', data: {
        "refreshToken": tokenPair.refreshToken,
      });

      // Phân tích cú pháp dữ liệu trả về từ POST request để tạo ra một 'TokenPair' mới
      final TokenPair newTokenPair = (
        accessToken: response.data['accessToken'],
        refreshToken: response.data['refreshToken'],
      );

      // Kiểm tra nếu 'shouldClearBeforeReset' là `true`, ta sẽ xóa 'TokenPair' cũ
      if (shouldClearBeforeReset) {
        await _clearTokenPair();
      }

      // Lưu 'TokenPair' mới này
      await _saveTokenPair(newTokenPair);

      // Trả về 'TokenPair' mới
      return newTokenPair;
    } catch (_) {
      // Nếu có bất kỳ lỗi nào trong khối 'try', 'TokenPair' hiện tại sẽ được xóa
      await _clearTokenPair();

      // Sau đó, ném ra một ngoại lệ 'RevokeTokenException' với 'requestOptions' là 'options'
      throw RevokeTokenException(requestOptions: options);
    }
  }

  /// Thực hiện lại một request thất bại bằng cách tạo request mới với thông tin đã lưu.
  Future<Response<R>> _retry<R>(
    RequestOptions requestOptions,
  ) async {
    return retryClient.request<R>(
      requestOptions.path,
      cancelToken: requestOptions.cancelToken,
      data: requestOptions.data is FormData
          ? (requestOptions.data as FormData).clone()
          : requestOptions.data,
      onReceiveProgress: requestOptions.onReceiveProgress,
      onSendProgress: requestOptions.onSendProgress,
      queryParameters: requestOptions.queryParameters,
      options: Options(
        method: requestOptions.method,
        headers: requestOptions.headers..addAll(await _buildHeaders()),
      ),
    );
  }

  /// Xử lý yêu cầu trước khi gửi.
  /// Thêm các headers cần thiết, kiểm tra token, và cập nhật base URL.
  @override
  Future<void> onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    try {
      final tokenPair = await _getTokenPair();

      if (tokenPair == null) {
        return handler.next(options);
      }

      final isAccessTokenValid = await _isAccessTokenValid;

      if (isAccessTokenValid) {
        final companyId = getIt.get<AuthBloc>().state.getUserCompanyId;

        options.headers.addAll(await _buildHeaders());
        options.headers['device-type'] = deviceType;
        options.headers['version'] = version;
        options.headers['environment'] = environment;
        options.headers['company-id'] = companyId;

        if (options.method == 'post'.toUpperCase()) {
          options.baseUrl = baseWriteUrl;
        } else {
          options.baseUrl = baseReadUrl;
        }

        return handler.next(options);
      } else {
        final newTokenPair = await _refresh(
          options: options,
          tokenPair: tokenPair,
        );

        if (newTokenPair == null) {
          return handler.reject(
            RevokeTokenException(requestOptions: options),
            true,
          );
        }

        options.headers.addAll(await _buildHeaders());
        return handler.next(options);
      }
    } catch (e) {
      return handler.reject(
        RevokeTokenException(requestOptions: options),
        true,
      );
    }
  }

  /// Xử lý lỗi khi request gặp vấn đề.
  /// Kiểm tra lỗi 401, làm mới token và thực hiện lại request.
  @override
  Future<void> onError(
      DioException err, ErrorInterceptorHandler handler) async {
    loggerHelper.logError(message: 'onError response', obj: err.response);

    if (err is RevokeTokenException) {
      return handler.reject(err);
    }

    if (!shouldRefresh(err.response)) {
      return handler.next(err);
    }

    final isAccessValid = await _isAccessTokenValid;
    final tokenPair = await _getTokenPair();

    if (tokenPair == null) {
      return handler.reject(err);
    }

    try {
      if (isAccessValid) {
        final previousRequest = await _retry(err.requestOptions);
        return handler.resolve(previousRequest);
      } else {
        await _refresh(options: err.requestOptions, tokenPair: tokenPair);
        final previousRequest = await _retry(err.requestOptions);
        return handler.resolve(previousRequest);
      }
    } catch (_) {
      return handler.reject(err);
    }
  }

  /// Xử lý response trả về từ server.
  /// Hiển thị lỗi hoặc xử lý các mã status code đặc biệt.
  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    switch (response.statusCode) {
      case 401:
        XToast.showNegativeMessage(
            message:
                response.data['message'] ?? 'Tài khoản không còn hiệu lực');
        getIt.get<AuthBloc>().add(LogoutEvent());
        break;
      // case 500:
      //   XToast.showNegativeMessage(
      //       message: response.data['message'] ?? 'Lỗi hệ thống');
      // throw DioException(
      //   requestOptions: response.requestOptions,
      //   type: DioExceptionType.unknown,
      //   response: response,
      // );
      case 900:
        showWidgetDialog(
          key: GlobalAppKey.updateDialogKey,
          NavigatorService.instance.context!,
          barrierDismissible: false,
          content: Container(),
        );
        break;
      default:
        break;
    }
    super.onResponse(response, handler);
  }
}
