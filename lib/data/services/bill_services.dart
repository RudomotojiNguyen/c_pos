import '../../common/enum/enum.dart';
import '../datasources/remote/api_remote.dart';
import '../models/bill_model.dart';
import '../models/response/base_response.dart';
import '../models/response/paginated_response.dart';

part 'impl/bill_services_impl.dart';

abstract class BillServices {
  Future<PaginatedResponse<BillModel>> getBills({
    required int page,
    required int size,
    List<int>? storeIds,
    String? billNumber,
    String? orderId,
    String? customerPhoneSearch,
    String? productSearch,
    String? imeiSearch,
    String? searchCoupon,
    int? employeeId,
  });

  Future<BaseResponse> createBill(Map<String, dynamic> data);

  Future<BillModel> getBillDetail({
    required String billId,
  });

  Future<BaseResponse> updateBill(Map<String, dynamic> data);
}
