import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/retrofit.dart';

import '../../models/response/base_response.dart';

part 'order_api.g.dart';

@RestApi()
abstract class OrderApi {
  factory OrderApi(Dio dio, {String baseUrl}) = _OrderApi;

  /// lấy chi danh sách đơn hàng
  ///
  @GET('orders/mobile')
  Future<BaseResponse> getOrders({
    @Query('param') String? param,
    @Query('orderType') int? orderType,
    @Query('status') int? status,
    @Query('storeId') int? storeId,
    @Query('timeId') int? timeId,
    @Query('page') required int page,
    @Query('size') required int size,
    @Query('type') int? type,
  });

  /// lấy đơn hàng theo khách hàng
  ///
  @GET('orders')
  Future<BaseResponse> getOrdersByCustomer({
    @Query('customerId') required int customerId,
    @Query('page') required int page,
    @Query('pageSize') required int pageSize,
  });

  /// lấy chi tiết đơn hàng
  ///
  @GET('orders/{orderId}')
  Future<BaseResponse> getOrderDetail({
    @Path() required String orderId,
  });

  /// kiểm tra xem khách hàng có đơn hàng nào không
  ///
  @GET('customer/mobile/{customerId}/check-orders')
  Future<BaseResponse> checkUserExistOrder({
    @Path() required String customerId,
  });

  /// lấy nguồn đơn hàng
  ///
  @GET('v1/order-sources')
  // @GET('orderSources/getAll')
  Future<BaseResponse> getOrderSources({
    @Query('status') int status = 1,
  });

  /// lấy nguồn các enum: status, cancelStatus, orderType
  ///
  @GET('orders/enum')
  Future<BaseResponse> getOrderEnum({
    @Query('type') String? type,
  });

  /// tạo đơn hàng
  ///
  @POST('orders/v2')
  Future<BaseResponse> createOrder(@Body() Map<String, dynamic> data);

  /// cập nhật đơn hàng
  ///
  @PUT('orders/v2')
  Future<BaseResponse> updateOrder(
    @Body() Map<String, dynamic> data,
  );

  /// cập nhật trạng thái đơn hàng
  ///
  @PUT('orders/v2')
  Future<BaseResponse> updateOrderStatus({
    @Body() required Map<String, dynamic> data,
    @Query('orderId') required int orderId,
  });
}
