import 'package:c_pos/data/models/store_model.dart';

import '../models/base_enum_model.dart';
import '../models/config_enum_model.dart';
import '../models/order_model.dart';
import '../models/response/base_response.dart';
import '../models/response/paginated_response.dart';
import '../services/order_services.dart';

part 'impl/order_repository_impl.dart';

abstract class OrderRepository {
  Future<PaginatedResponse<OrderModel>> getOrders({
    int? createdBy,
    List<StoreModel>? searchStores,
    List<int>? searchStatuses,
    String? searchPhone,
    String? searchFromDay,
    String? searchToDay,
    String? tabName,
    required int page,
    required int size,
    String? orderId,
  });

  Future<OrderModel> getOrderDetail(String orderId);

  Future<ConfigEnumModel> getOrderEnum({String? type});

  Future<List<BaseEnumModel>> getOrderSource();

  Future<BaseResponse> createOrder(Map<String, dynamic> params);

  Future<BaseResponse> updateOrder(Map<String, dynamic> params);
}
