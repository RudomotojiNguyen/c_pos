part of '../order_repository.dart';

class OrderRepositoryImpl implements OrderRepository {
  final OrderServices orderServices;

  OrderRepositoryImpl({required this.orderServices});

  @override
  Future<PaginatedResponse<OrderModel>> getOrders({
    required int page,
    required int size,
    int? createdBy,
    List<StoreModel>? searchStores,
    List<int>? searchStatuses,
    String? searchPhone,
    String? searchFromDay,
    String? searchToDay,
    String? tabName,
    String? orderId,
  }) async {
    return orderServices.getOrders(
      page: page,
      size: size,
      createdBy: createdBy,
      searchStores: searchStores?.map((e) => e.id!).toList(),
      searchStatuses: searchStatuses,
      searchPhone: searchPhone,
      searchFromDay: searchFromDay,
      searchToDay: searchToDay,
      tabName: tabName,
      orderId: orderId,
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
