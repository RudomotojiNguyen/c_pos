part of '../employee_services.dart';

class EmployeeServicesImpl implements EmployeeServices {
  final EmployeeApi employeeApi;

  EmployeeServicesImpl({required this.employeeApi});

  @override
  Future<List<EmployeeModel>> getEmployees() {
    return employeeApi.getEmployees().then(
      (value) {
        List<EmployeeModel> data = [];

        for (var customer in value.data) {
          data.add(EmployeeModel.fromJson(customer));
        }

        return data;
      },
    );
  }
}
