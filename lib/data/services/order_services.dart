import '../datasources/remote/order_api.dart';
import '../models/base_enum_model.dart';
import '../models/config_enum_model.dart';
import '../models/order_model.dart';
import '../models/response/base_response.dart';

part 'impl/order_services_impl.dart';

abstract class OrderServices {
  Future<List<OrderModel>> getOrders({
    String? param,
    int? orderType,
    int? status,
    int? storeId,
    int? timeId,
    int? type,
    required int page,
    required int size,
  });

  Future<OrderModel> getOrderDetail(String orderId);

  Future<ConfigEnumModel> getOrderEnum({String? type});

  Future<List<BaseEnumModel>> getOrderSource();

  Future<BaseResponse> createOrder(Map<String, dynamic> params);

  Future<BaseResponse> updateOrder(Map<String, dynamic> params);
}
