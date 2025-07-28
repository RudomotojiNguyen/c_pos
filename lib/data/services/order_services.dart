import '../datasources/remote/api_remote.dart';
import '../models/base_enum_model.dart';
import '../models/config_enum_model.dart';
import '../models/order_model.dart';
import '../models/response/base_response.dart';
import '../models/response/paginated_response.dart';
import '../models/store_model.dart';

part 'impl/order_services_impl.dart';

abstract class OrderServices {
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
  });

  Future<OrderModel> getOrderDetail(String orderId);

  Future<ConfigEnumModel> getOrderEnum({String? type});

  Future<List<BaseEnumModel>> getOrderSource();

  Future<BaseResponse> createOrder(Map<String, dynamic> params);

  Future<BaseResponse> updateOrder(Map<String, dynamic> params);
}
