import 'package:c_pos/presentation/widgets/widgets.dart';

import '../../presentation/utils/utils.dart';
import '../datasources/remote/customer_api.dart';
import '../models/customer_model.dart';
import '../models/response/paginated_response.dart';

part 'impl/customer_services_impl.dart';

abstract class CustomerServices {
  Future<PaginatedResponse<CustomerModel>> getCustomers({
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

  Future<bool> updateCustomerInfo({
    required Map<String, dynamic> params,
    required int customerId,
  });
}
