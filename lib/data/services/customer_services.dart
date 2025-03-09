import '../../presentation/utils/utils.dart';
import '../datasources/remote/customer_api.dart';
import '../models/customer_model.dart';

part 'impl/customer_services_impl.dart';

abstract class CustomerServices {
  Future<List<CustomerModel>> getCustomers({
    required int page,
    required int size,
    String? phoneNumber,
  });

  Future<CustomerModel> getCustomerInfoById({required int customerId});

  Future<(String, double)> getCustomerOTPToChangePoint(
      Map<String, dynamic> params);

  Future<double> checkOTPUsePoint(Map<String, dynamic> params);

  Future<(String, CustomerModel?)> getCustomerOTPToUseDMem(
      Map<String, dynamic> params);

  Future<bool> checkOTPUseDMem(Map<String, dynamic> params);
}
