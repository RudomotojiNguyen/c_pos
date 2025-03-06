part of '../bill_services.dart';

class BillServicesImpl implements BillServices {
  final BillApi billApi;

  BillServicesImpl({required this.billApi});

  @override
  Future<List<BillModel>> getBills({
    required int page,
    required int size,
    required int storeId,
    int? type,
    int? searchType,
    String? search,
  }) async {
    List<BillModel> data = [];
    final res = await billApi.getBills(
      page: page,
      size: size,
      type: type,
      storeId: storeId,
      searchType: searchType,
      search: search,
    );
    (res.data ?? []).forEach((item) {
      data.add(BillModel.fromJson(item));
    });
    return data;
  }

  @override
  Future<BaseResponse> createBill(Map<String, dynamic> data) async {
    final response = await billApi.createBill(data);
    return response;
  }

  @override
  Future<BillModel> getBillDetail({required String billId}) async {
    return billApi.getBillDetail(billId).then(
          (value) => BillModel.fromJson(value.data),
        );
  }

  @override
  Future<BaseResponse> updateBill(Map<String, dynamic> data) async {
    return billApi.updateBill(data);
  }
}
