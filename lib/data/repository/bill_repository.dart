import '../models/bill_model.dart';
import '../models/response/base_response.dart';
import '../services/bill_services.dart';

part 'impl/bill_repository_impl.dart';

abstract class BillRepository {
  Future<List<BillModel>> getBills({
    required int page,
    required int size,
    required int storeId,
    int? type,
    int? searchType,
    String? search,
  });

  Future<BaseResponse> createBill(Map<String, dynamic> data);

  Future<BaseResponse> updateBill(Map<String, dynamic> data);

  Future<BillModel> getBillDetail({
    required String billId,
  });
}
