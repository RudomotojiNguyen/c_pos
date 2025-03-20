part of '../payment_repositories.dart';

class PaymentRepositoriesImpl implements PaymentRepositories {
  final PaymentServices paymentServices;

  PaymentRepositoriesImpl({required this.paymentServices});

  @override
  Future<List<AccountantModel>> getAccountantsByCash({required int storeId}) {
    return paymentServices.getAccountantsByStore(
        type: PaymentType.cash.getValue, storeId: storeId);
  }

  @override
  Future<List<AccountantModel>> getAccountantsByCredit({
    required int storeId,
    required int moduleType,
  }) {
    return paymentServices.getAccountants(
        type: PaymentType.credit.getValue,
        storeId: storeId,
        moduleType: moduleType);
  }

  @override
  Future<List<AccountantModel>> getAccountantsByTransfer({
    required int storeId,
    required int moduleType,
  }) {
    return paymentServices.getAccountants(
        type: PaymentType.transfer.getValue,
        storeId: storeId,
        moduleType: moduleType);
  }

  @override
  Future<List<InstallmentAccountingModel>> getInstallmentAccounts({
    int? page,
    int? pageSize,
  }) {
    return paymentServices.getInstallmentAccounts(
        page: page, pageSize: pageSize);
  }

  @override
  Future<List<EnumModel>> getPaymentMethods() {
    return paymentServices.getPaymentMethods();
  }
}
