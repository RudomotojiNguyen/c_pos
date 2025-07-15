part of '../customer_repository.dart';

class CustomerRepositoryImpl implements CustomerRepository {
  final CustomerServices customerServices;

  CustomerRepositoryImpl({required this.customerServices});

  @override
  Future<PaginatedResponse<CustomerModel>> getCustomers({
    required int page,
    required int size,
    String? phoneNumber,
    String? customerName,
  }) async {
    final res = await customerServices.getCustomers(
      page: page,
      size: size,
      phoneNumber: phoneNumber,
    );

    return res;
  }

  @override
  Future<double> checkOTPUsePoint({
    required int customerId,
    required String otpCode,
    required int pointUse,
  }) {
    return customerServices.checkOTPUsePoint({
      "customerId": customerId,
      "otpCode": otpCode,
      "pointUse": pointUse,
    });
  }

  @override
  Future<(String, double)> getCustomerOTPToChangePoint({
    required int customerId,
    required int pointUse,
  }) {
    return customerServices.getCustomerOTPToChangePoint({
      "customerId": customerId,
      "pointUse": pointUse,
    });
  }

  @override
  Future<CustomerModel> getCustomerInfoById({required int customerId}) {
    return customerServices.getCustomerInfoById(customerId: customerId);
  }

  @override
  Future<bool> updateCustomerInfo({
    required Map<String, dynamic> params,
    required int customerId,
  }) {
    return customerServices.updateCustomerInfo(
      params: params,
      customerId: customerId,
    );
  }
}
