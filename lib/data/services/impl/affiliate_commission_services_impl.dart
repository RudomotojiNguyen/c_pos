part of '../affiliate_commission_services.dart';

class AffiliateCommissionServicesImpl implements AffiliateCommissionServices {
  final CommissionApi commissionApi;

  AffiliateCommissionServicesImpl({required this.commissionApi});

  @override
  Future<RewardReportModel> getCommissionDetail(
      {required String fromDate, required String toDate}) {
    return commissionApi
        .getCommissionDetail(fromDate: fromDate, toDate: toDate)
        .then(
      (value) {
        return RewardReportModel.fromJson(value.data);
      },
    );
  }

  @override
  Future<CommissionDetailModel> getCommissionDetailByCate(
      {required String fromDate,
      required String toDate,
      required int roleId,
      required List<int> ids}) async {
    final res = await commissionApi.getCommissionDetailByCate(
        fromDate: fromDate,
        toDate: toDate,
        roleId: roleId,
        ids: ids.toString().replaceAll(" ", ""));
    return CommissionDetailModel.fromJson(res.data);
  }

  @override
  Future<List<RewardProductCheckModel>> checkCommission({
    required String productId,
    required String storeId,
    required String month,
    required String year,
  }) async {
    final res = await commissionApi.checkCommission(
        productId: productId, storeId: storeId, month: month, year: year);

    List<RewardProductCheckModel> data = [];

    if (res.data.isNotEmpty) {
      for (var e in res.data) {
        data.add(RewardProductCheckModel.fromJson(e));
      }
    }

    return data;
  }
}
