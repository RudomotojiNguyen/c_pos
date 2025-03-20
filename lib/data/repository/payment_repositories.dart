import '../../common/enum/enum.dart';
import '../models/accountant_model.dart';
import '../models/enum_model.dart';
import '../models/installment_accounting_model.dart';
import '../services/payment_services.dart';

part 'impl/payment_repositories_impl.dart';

abstract class PaymentRepositories {
  /// lấy phương thức thanh toán
  Future<List<EnumModel>> getPaymentMethods();

  /// lấy tài khoản thanh toán tiền mặt
  Future<List<AccountantModel>> getAccountantsByCash({
    required int storeId,
  });

  /// lấy tài khoản thanh toán chuyển khoản
  Future<List<AccountantModel>> getAccountantsByTransfer({
    required int storeId,
    required int moduleType,
  });

  /// lấy tài khoản thanh toán cà thẻ
  Future<List<AccountantModel>> getAccountantsByCredit({
    required int storeId,
    required int moduleType,
  });

  /// lấy tài khoản trả góp
  Future<List<InstallmentAccountingModel>> getInstallmentAccounts({
    int? page,
    int? pageSize,
  });
}
