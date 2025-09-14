part of '../bill_services.dart';

class BillServicesImpl implements BillServices {
  final BillApi billApi;

  BillServicesImpl({required this.billApi});

  @override
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
  }) async {
    final res = await billApi.getBills(
      page: page,
      size: size,
      type: SearchType.billId.getValue,
      storeIds: storeIds,
      billNumber: billNumber,
      orderId: orderId,
      customerPhoneSearch: customerPhoneSearch,
      productSearch: productSearch,
      imeiSearch: imeiSearch,
      searchCoupon: searchCoupon,
      employeeId: employeeId,
    );
    return PaginatedResponse.fromJson(
      res.data,
      (json) => BillModel.fromJson(json),
      itemsKey: 'dataset',
    );
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
