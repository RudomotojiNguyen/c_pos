import '../models/customer_model.dart';
import '../models/response/paginated_response.dart';
import '../services/customer_services.dart';

part 'impl/customer_repository_impl.dart';

abstract class CustomerRepository {
  Future<PaginatedResponse<CustomerModel>> getCustomers({
    required int page,
    required int size,
    String? phoneNumber,
    String? customerName,
  });

  Future<CustomerModel> getCustomerInfoById({required int customerId});

  Future<(String, double)> getCustomerOTPToChangePoint({
    required int customerId,
    required int pointUse,
  });

  Future<double> checkOTPUsePoint({
    required int customerId,
    required String otpCode,
    required int pointUse,
  });

  Future<bool> updateCustomerInfo({
    required Map<String, dynamic> params,
    required int customerId,
  });
}
