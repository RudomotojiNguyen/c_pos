import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../models/response/base_response.dart';

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

  /// lấy thông tin giảm giá
  ///
  @GET('discount-programs/by-product/{id}/{storeId}')
  Future<BaseResponse> getProductDiscount({
    @Path() required String id,
    @Path() required int storeId,
  });
}
