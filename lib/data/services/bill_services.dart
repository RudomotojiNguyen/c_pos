import '../datasources/remote/api_remote.dart';
import '../models/bill_model.dart';
import '../models/response/base_response.dart';

part 'impl/bill_services_impl.dart';

abstract class BillServices {
  Future<List<BillModel>> getBills({
    required int page,
    required int size,
    required int storeId,
    int? type,
    int? searchType,
    String? search,
  });

  Future<BaseResponse> createBill(Map<String, dynamic> data);

  Future<BillModel> getBillDetail({
    required String billId,
  });

  Future<BaseResponse> updateBill(Map<String, dynamic> data);
}
