part of '../customer_services.dart';

class CustomerServicesImpl implements CustomerServices {
  final CustomerApi customerApi;

  CustomerServicesImpl({required this.customerApi});

  @override
  Future<List<CustomerModel>> getCustomers(
      {required int page, required int size, String? phoneNumber}) {
    return customerApi
        .getCustomers(page: page, size: size, param: phoneNumber)
        .then(
      (value) {
        List<CustomerModel> data = [];

        for (var customer in value.data) {
          data.add(CustomerModel.fromJson(customer));
        }

        return data;
      },
    );
  }

  @override
  Future<bool> checkOTPUseDMem(Map<String, dynamic> params) {
    return customerApi.checkOtpIsGenerated(params).then((value) {
      return value.data as bool;
    });
  }

  @override
  Future<double> checkOTPUsePoint(Map<String, dynamic> params) {
    return customerApi.checkOTPUsePoint(params).then((value) {
      return Utils.toDouble(value.data);
    });
  }

  @override
  Future<(String, double)> getCustomerOTPToChangePoint(
      Map<String, dynamic> params) {
    return customerApi.getCustomerOTPToChangePoint(params).then((value) {
      String otp = value.data['otp'] as String;
      double moneyUsePoint = Utils.toDouble(value.data['moneyUsePoint']);
      return (otp, moneyUsePoint);
    });
  }

  @override
  Future<(String, CustomerModel?)> getCustomerOTPToUseDMem(
      Map<String, dynamic> params) {
    return customerApi.getOtpByPhone(params).then((value) {
      String otp = value.data['otp'] ?? '';
      CustomerModel? customer = value.data.containsKey('customer')
          ? CustomerModel.fromJson(value.data['customer'])
          : null;

      return (otp, customer);
    });
  }

  @override
  Future<CustomerModel> getCustomerInfoById({required int customerId}) {
    return customerApi
        .getCustomerInfoById(customerId)
        .then((value) => CustomerModel.fromJson(value.data));
  }
}
