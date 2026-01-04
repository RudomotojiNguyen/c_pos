import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:c_pos/data/models/models.dart';

part 'coupon_api.g.dart';

@RestApi()
abstract class CouponApi {
  factory CouponApi(Dio dio, {String baseUrl}) = _CouponApi;

  /// kiểm tra mã giảm giá
  /// params: couponCode, storeId, listProduct, customerId
  @POST('coupon/check-coupon')
  Future<BaseResponse> checkCoupon(@Body() Map<String, dynamic> params);

  /// search coupon giảm giá
  @POST('coupon-program-detail/search')
  Future<BaseResponse> searchCoupon({
    @Body() required Map<String, dynamic> params,
    @Query('storeIds') int? storeId,
    @Query('code') String? code,
    @Query('applyChanel') required int applyChanel,
    @Query('page') required int page,
    @Query('size') required int size,
    @Query('customerId') int? customerId,
  });
}
