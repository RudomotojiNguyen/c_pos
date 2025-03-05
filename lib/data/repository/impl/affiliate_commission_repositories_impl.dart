part of '../affiliate_commission_repositories.dart';

class AffiliateCommissionRepositoriesImpl
    implements AffiliateCommissionRepositories {
  final AffiliateCommissionServices affiliateCommissionServices;

  AffiliateCommissionRepositoriesImpl({
    required this.affiliateCommissionServices,
  });

  @override
  Future<RewardReportModel> getCommissionDetail(
      {required String fromDate, required String toDate}) {
    return affiliateCommissionServices.getCommissionDetail(
        fromDate: fromDate, toDate: toDate);
  }

  @override
  Future<CommissionDetailModel> getCommissionDetailByCate(
      {required String fromDate,
      required String toDate,
      required int roleId,
      required List<int> ids}) {
    return affiliateCommissionServices.getCommissionDetailByCate(
        fromDate: fromDate, toDate: toDate, roleId: roleId, ids: ids);
  }
}
