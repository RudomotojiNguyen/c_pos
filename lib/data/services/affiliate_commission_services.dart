import '../datasources/remote/api_remote.dart';
import '../models/commission_detail_model.dart';
import '../models/reward_product_check_model.dart';
import '../models/reward_report_model.dart';

part 'impl/affiliate_commission_services_impl.dart';

abstract class AffiliateCommissionServices {
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

  Future<List<RewardProductCheckModel>> checkCommission({
    required String productId,
    required String storeId,
    required String month,
    required String year,
  });
}
