part of '../order_repository.dart';

class OrderRepositoryImpl implements OrderRepository {
  final OrderServices orderServices;

  OrderRepositoryImpl({required this.orderServices});

  @override
  Future<List<OrderModel>> getOrders({
    String? param,
    int? orderType,
    int? status,
    int? storeId,
    int? timeId,
    int? type,
    required int page,
    required int size,
  }) async {
    return orderServices.getOrders(
      page: page,
      size: size,
      param: param,
      orderType: orderType,
      status: status,
      storeId: storeId,
      timeId: timeId,
      type: type,
    );
  }

  @override
  Future<OrderModel> getOrderDetail(String orderId) {
    return orderServices.getOrderDetail(orderId);
  }

  @override
  Future<ConfigEnumModel> getOrderEnum({String? type}) {
    return orderServices.getOrderEnum(type: type);
  }

  @override
  Future<List<BaseEnumModel>> getOrderSource() {
    return orderServices.getOrderSource();
  }

  @override
  Future<BaseResponse> createOrder(Map<String, dynamic> params) {
    return orderServices.createOrder(params);
  }

  @override
  Future<BaseResponse> updateOrder(Map<String, dynamic> params) {
    return orderServices.updateOrder(params);
  }
}
