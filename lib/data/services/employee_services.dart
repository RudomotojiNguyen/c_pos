import '../datasources/remote/api_remote.dart';
import '../models/employee_model.dart';

part 'impl/employee_services_impl.dart';

abstract class EmployeeServices {
  Future<List<EmployeeModel>> getEmployees();

  Future<List<EmployeeModel>> getEmployeesByStore({
    required List<int> storeIds,
  });
}
