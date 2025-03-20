import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/retrofit.dart';

import '../../models/response/base_response.dart';

part 'payment_api.g.dart';

@RestApi()
abstract class PaymentApi {
  factory PaymentApi(Dio dio, {String baseUrl}) = _PaymentApi;

  /// lấy phương thức thanh toán
  ///
  @GET('payments/enum')
  Future<BaseResponse> getPaymentMethods();

  /// lấy tài khoản thanh toán
  ///
  @GET('accountants/getByType')
  Future<BaseResponse> getAccountants({
    @Query('type') required int type,
    @Query('storeId') required int storeId,
    @Query('moduleType') required int moduleType,
  });

  /// lấy tài khoản tiền mặt thanh toán
  ///
  @GET('accountants/getByStore')
  Future<BaseResponse> getAccountantsByStore({
    @Query('type') int? type,
    @Query('storeId') int? storeId,
  });

  /// lấy tài khoản trả góp
  ///
  @GET('installments')
  Future<BaseResponse> getInstallmentAccounts({
    @Query('page') int? page,
    @Query('pageSize') int? pageSize,
  });

  /// lấy mã qr thanh toán
  /// params: {
  ///       referenceNumber: params?.referenceNumber,
  ///       type: params?.type,
  ///       paymentInfo: {
  ///         id: params?.paymentInfo.id,
  ///         paymentName: params?.paymentInfo.paymentName,
  ///         paymentRefId: params?.paymentInfo.paymentRefId,
  ///         paymentRefCode: params?.paymentInfo.paymentRefCode,
  ///         paymentAmount: params?.paymentInfo.paymentAmount,
  ///         paymentType: params?.paymentInfo.paymentType,
  ///       },
  ///     },
  ///   }
  ///
  @POST('qr-code')
  Future<dynamic> getDataTransfer(@Body() Map<String, dynamic> params);
}
