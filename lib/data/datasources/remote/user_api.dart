import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/retrofit.dart';

import '../../models/response/base_response.dart';

part 'user_api.g.dart';

@RestApi()
abstract class UserApi {
  factory UserApi(Dio dio, {String baseUrl}) = _UserApi;

  /// đăng ký token nhận thông báoZ
  /// params: {token:String}
  @POST('user/register-firebase')
  Future<BaseResponse> registerTokenDevice(@Body() Map<String, dynamic> params);

  /// đổi mật khẩu
  /// params: {
  ///       password: String,
  ///       newPassword: String,
  ///     }
  @PATCH('change-password')
  Future<BaseResponse> changePass(@Body() Map<String, dynamic> params);

  /// đổi mật khẩu lần đầu đăng nhập
  /// params: {
  ///       username: String,
  ///       password: String,
  ///     }
  @POST('reset-password')
  Future<BaseResponse> resetPassword(@Body() Map<String, dynamic> params);
}
