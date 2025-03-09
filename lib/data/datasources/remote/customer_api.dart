import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/retrofit.dart';

import '../../models/response/base_response.dart';

part 'customer_api.g.dart';

@RestApi()
abstract class CustomerApi {
  factory CustomerApi(Dio dio, {String baseUrl}) = _CustomerApi;

  /// lấy otp để thêm sdt vào khách cũ
  /// params: {phoneNumber}
  @POST('customerOTP/generate-otp')
  Future<BaseResponse> getOtpByPhone(@Body() Map<String, dynamic> params);

  /// kiểm tra otp
  /// params: {customerId, otpCode}
  @POST('customerOTP/check-generate-otp')
  Future<BaseResponse> checkOtpIsGenerated(@Body() Map<String, dynamic> params);

  /// lấy mã otp để tiêu điểm
  /// params: {customerId, pointUse, phoneNumber}
  @POST('customer/mobile/otp')
  Future<BaseResponse> getCustomerOTPToChangePoint(
      @Body() Map<String, dynamic> params);

  /// kiểm tra mã otp để tiêu điểm
  /// params: {customerId, pointUse, otpCode}
  @POST('customerOTP/checkOTP')
  Future<BaseResponse> checkOTPUsePoint(@Body() Map<String, dynamic> params);

  /// cập nhật thông tin khách hàng
  /// params:
  @PUT('customer/mobile')
  Future<BaseResponse> saveCustomerInfo(@Body() Map<String, dynamic> params);

  /// lấy danh sách khách hàng
  ///
  @GET('customer/mobile')
  Future<BaseResponse> getCustomers({
    @Query('page') required int page,
    @Query('size') required int size,
    @Query('param') String? param,
  });

  /// lấy thông tin khách hàng
  ///
  @GET('customer/mobile/{customerId}')
  Future<BaseResponse> getCustomerInfoById(@Path() int customerId);

  /// lấy lịch sử thông tin khách hàng
  ///
  @GET('customer/mobile/{customerId}/histories')
  Future<BaseResponse> getCustomerHistories(@Path() int customerId);

  /// lấy thông tin thống kê KH (có level KH)
  ///
  @GET('customer/statistical-bill/')
  Future<BaseResponse> checkStatisticalBillByPhone({
    @Query('customerPhone') required String customerPhone,
  });
}
