part of '../payment_services.dart';

class PaymentServicesImpl implements PaymentServices {
  final PaymentApi paymentApi;

  PaymentServicesImpl({required this.paymentApi});

  @override
  Future<List<AccountantModel>> getAccountants(
      {required int type, required int storeId, required int moduleType}) {
    return paymentApi
        .getAccountants(type: type, storeId: storeId, moduleType: moduleType)
        .then(
      (value) {
        List<AccountantModel> data = [];

        for (var accountant in value.data) {
          data.add(AccountantModel.fromJson(accountant));
        }

        return data;
      },
    );
  }

  @override
  Future<List<AccountantModel>> getAccountantsByStore({
    int? type,
    int? storeId,
  }) {
    return paymentApi.getAccountantsByStore(type: type, storeId: storeId).then(
      (value) {
        List<AccountantModel> data = [];

        for (var accountant in value.data) {
          data.add(AccountantModel.fromJson(accountant));
        }

        return data;
      },
    );
  }

  @override
  Future<List<InstallmentAccountingModel>> getInstallmentAccounts({
    int? page,
    int? pageSize,
  }) {
    return paymentApi
        .getInstallmentAccounts(page: page, pageSize: pageSize)
        .then(
      (value) {
        List<InstallmentAccountingModel> data = [];

        for (var accountant in value.data['result']) {
          data.add(InstallmentAccountingModel.fromJson(accountant));
        }

        return data;
      },
    );
  }

  @override
  Future<List<EnumModel>> getPaymentMethods() {
    return paymentApi.getPaymentMethods().then(
      (value) {
        List<EnumModel> data = [];

        for (var accountant in value.data) {
          data.add(EnumModel.fromJson(accountant));
        }

        return data;
      },
    );
  }
}
