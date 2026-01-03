import '../datasources/remote/api_remote.dart';
import '../models/accountant_model.dart';
import '../models/enum_model.dart';
import '../models/installment_accounting_model.dart';

part 'impl/payment_services_impl.dart';

abstract class PaymentServices {
  /// lấy phương thức thanh toán
  Future<List<EnumModel>> getPaymentMethods();

  /// lấy tài khoản tiền mặt thanh toán
  Future<List<AccountantModel>> getAccountantsByStore({
    int? type,
    int? storeId,
  });

  /// lấy tài khoản thanh toán
  Future<List<AccountantModel>> getAccountants({
    required int type,
    required int storeId,
  });

  /// lấy tài khoản trả góp
  Future<List<InstallmentAccountingModel>> getInstallmentAccounts({
    int? page,
    int? pageSize,
  });
}
