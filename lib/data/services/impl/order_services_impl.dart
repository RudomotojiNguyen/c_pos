part of '../order_services.dart';

class OrderServicesImpl implements OrderServices {
  final OrderApi orderApi;

  OrderServicesImpl({required this.orderApi});

  @override
  Future<PaginatedResponse<OrderModel>> getOrders({
    required int page,
    required int size,
    int? createdBy,
    List<int>? searchStores,
    List<int>? searchStatuses,
    String? searchPhone,
    String? searchFromDay,
    String? searchToDay,
    String? tabName,
    String? orderId,
  }) async {
    final res = await orderApi.getOrders(
      page: page,
      size: size,
      createdBy: createdBy,
      searchStores: searchStores,
      searchStatuses: searchStatuses,
      searchPhone: searchPhone,
      searchFromDay: searchFromDay,
      searchToDay: searchToDay,
      tabName: tabName,
      orderId: orderId,
    );

    return PaginatedResponse.fromJson(
      res.data,
      (json) => OrderModel.fromJson(json),
      itemsKey: 'dataset',
    );
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
  Future<List<BaseEnumModel>> getOrderSource() async {
    final res = await orderApi.getOrderSources();
    final data = PaginatedResponse.fromJson(
      res.data,
      (json) => BaseEnumModel.fromJson(json),
      itemsKey: 'list_order_source',
    );
    return data.items;
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
