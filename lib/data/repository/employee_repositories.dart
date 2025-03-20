import '../models/employee_model.dart';
import '../services/employee_services.dart';

part 'impl/employee_repositories_impl.dart';

abstract class EmployeeRepositories {
  Future<List<EmployeeModel>> getEmployees({int? storeId});
}
