part of '../customer_services.dart';

class CustomerServicesImpl implements CustomerServices {
  final CustomerApi customerApi;

  CustomerServicesImpl({required this.customerApi});

  @override
  Future<PaginatedResponse<CustomerModel>> getCustomers({
    required int page,
    required int size,
    String? phoneNumber,
    String? customerName,
  }) {
    return customerApi
        .getCustomers(
      page: page,
      size: size,
      customerPhone: phoneNumber,
      customerName: customerName,
    )
        .then((value) {
      return PaginatedResponse.fromJson(
        value.data,
        (json) => CustomerModel.fromJson(json),
        // itemsKey: 'list_customer',
      );
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
    Map<String, dynamic> params,
  ) {
    return customerApi.getCustomerOTPToChangePoint(params).then((value) {
      String otp = value.data['otp'] as String;
      double moneyUsePoint = Utils.toDouble(value.data['moneyUsePoint']);
      return (otp, moneyUsePoint);
    });
  }

  @override
  Future<CustomerModel> getCustomerInfoById({required int customerId}) {
    return customerApi
        .getCustomerInfoById(customerId)
        .then((value) => CustomerModel.fromJson(value.data));
  }

  @override
  Future<bool> updateCustomerInfo({
    required Map<String, dynamic> params,
    required int customerId,
  }) async {
    final result = await customerApi.saveCustomerInfo(
      params: params,
      customerId: customerId,
    );
    return result.checkIsSuccess;
  }
}
