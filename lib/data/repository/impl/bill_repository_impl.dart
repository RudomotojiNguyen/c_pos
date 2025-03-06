part of '../bill_repository.dart';

class BillRepositoryImpl implements BillRepository {
  final BillServices billServices;

  BillRepositoryImpl({required this.billServices});

  @override
  Future<List<BillModel>> getBills({
    required int page,
    required int size,
    required int storeId,
    int? type,
    int? searchType,
    String? search,
  }) async {
    return billServices.getBills(
      page: page,
      size: size,
      type: type,
      storeId: storeId,
      searchType: searchType,
      search: search,
    );
  }

  @override
  Future<BaseResponse> createBill(Map<String, dynamic> data) {
    return billServices.createBill(data);
  }

  @override
  Future<BillModel> getBillDetail({
    required String billId,
  }) async {
    return billServices.getBillDetail(billId: billId);
  }

  @override
  Future<BaseResponse> updateBill(Map<String, dynamic> data) {
    return billServices.updateBill(data);
  }
}
