part of '../customer_repository.dart';

class CustomerRepositoryImpl implements CustomerRepository {
  final CustomerServices customerServices;

  CustomerRepositoryImpl({required this.customerServices});

  @override
  Future<List<CustomerModel>> getCustomers(
      {required int page, required int size, String? phoneNumber}) {
    return customerServices.getCustomers(
        page: page, size: size, phoneNumber: phoneNumber);
  }

  @override
  Future<bool> checkOTPUseDMem(
      {required int customerId, required String otpCode}) {
    return customerServices.checkOTPUseDMem({
      "customerId": customerId,
      "otpCode": otpCode,
    });
  }

  @override
  Future<double> checkOTPUsePoint(
      {required int customerId,
      required String otpCode,
      required int pointUse}) {
    return customerServices.checkOTPUsePoint({
      "customerId": customerId,
      "otpCode": otpCode,
      "pointUse": pointUse,
    });
  }

  @override
  Future<(String, double)> getCustomerOTPToChangePoint(
      {required int customerId, required int pointUse}) {
    return customerServices.getCustomerOTPToChangePoint({
      "customerId": customerId,
      "pointUse": pointUse,
    });
  }

  @override
  Future<(String, CustomerModel?)> getCustomerOTPToUseDMem(
      {required String phoneNumber, required int isCheckBlackList}) {
    return customerServices.getCustomerOTPToUseDMem({
      "phoneNumber": phoneNumber,
      "isCheckBlackList": isCheckBlackList,
    });
  }

  @override
  Future<CustomerModel> getCustomerInfoById({required int customerId}) {
    return customerServices.getCustomerInfoById(customerId: customerId);
  }
}
