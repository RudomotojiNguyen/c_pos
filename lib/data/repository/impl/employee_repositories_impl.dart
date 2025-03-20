part of '../employee_repositories.dart';

class EmployeeRepositoriesImpl implements EmployeeRepositories {
  final EmployeeServices employeeServices;

  EmployeeRepositoriesImpl({required this.employeeServices});

  @override
  Future<List<EmployeeModel>> getEmployees({int? storeId}) {
    return employeeServices.getEmployees(storeId: storeId);
  }
}
