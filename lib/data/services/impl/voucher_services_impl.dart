part of '../voucher_services.dart';

class VoucherServicesImpl implements VoucherServices {
  final VoucherApi voucherApi;

  VoucherServicesImpl({required this.voucherApi});

  @override
  Future<List<VoucherModel>> getVoucherUsable(
      {required String productId,
      required double productAmount,
      int? storeId,
      String? customerPhone}) async {
    final res = await voucherApi.getVoucherUsable(
      productId: productId,
      productAmount: productAmount,
      storeId: storeId,
      customerPhone: customerPhone,
    );

    List<VoucherModel> data = [];
    for (var item in res.data) {
      data.add(VoucherModel.fromJson(item));
    }
    return data;
  }
}
