import '../datasources/remote/voucher_api.dart';
import '../models/voucher_model.dart';

part 'impl/voucher_services_impl.dart';

abstract class VoucherServices {
  Future<List<VoucherModel>> getVoucherUsable({
    required int productId,
    required double productAmount,
    int? storeId,
    String? customerPhone,
  });
}
