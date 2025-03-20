import '../datasources/remote/employee_api.dart';
import '../models/employee_model.dart';

part 'impl/employee_services_impl.dart';

abstract class EmployeeServices {
  Future<List<EmployeeModel>> getEmployees({int? storeId});
}
