import '../models/commission_detail_model.dart';
import '../models/reward_report_model.dart';
import '../services/affiliate_commission_services.dart';

part 'impl/affiliate_commission_repositories_impl.dart';

abstract class AffiliateCommissionRepositories {
  Future<RewardReportModel> getCommissionDetail({
    required String fromDate,
    required String toDate,
  });

  Future<CommissionDetailModel> getCommissionDetailByCate({
    required String fromDate,
    required String toDate,
    required int roleId,
    required List<int> ids,
  });
}
