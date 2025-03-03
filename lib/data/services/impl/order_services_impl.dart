part of '../order_services.dart';

class OrderServicesImpl implements OrderServices {
  final OrderApi orderApi;

  OrderServicesImpl({required this.orderApi});

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
    List<OrderModel> data = [];

    final res = await orderApi.getOrders(
      page: page,
      size: size,
      param: param,
      orderType: orderType,
      status: status,
      storeId: storeId,
      timeId: timeId,
      type: type,
    );
    (res.data ?? []).forEach((item) {
      data.add(OrderModel.fromJson(item));
    });

    return data;
  }

  @override
  Future<OrderModel> getOrderDetail(String orderId) {
    return orderApi.getOrderDetail(orderId: orderId).then(
          (value) => OrderModel.fromJson(value.data),
        );
  }

  @override
  Future<ConfigEnumModel> getOrderEnum({String? type}) {
    return orderApi.getOrderEnum(type: type).then(
          (value) => ConfigEnumModel.fromJson(value.data),
        );
  }

  @override
  Future<List<BaseEnumModel>> getOrderSource() {
    return orderApi.getOrderSources().then(
      (value) {
        return value.getListData.map<BaseEnumModel>((item) {
          return BaseEnumModel.fromJson(item);
        }).toList();
      },
    );
  }

  @override
  Future<BaseResponse> createOrder(Map<String, dynamic> params) async {
    return await orderApi.createOrder(params);
  }

  @override
  Future<BaseResponse> updateOrder(Map<String, dynamic> params) async {
    return await orderApi.updateOrder(params);
  }
}
