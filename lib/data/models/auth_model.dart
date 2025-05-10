import '../datasources/local_db/table/user_table.dart';
import 'employee_model.dart';

class AuthModel {
  int? userId;
  String? username;
  EmployeeModel? employee;
  int? isActive;
  String? accessToken;

  AuthModel({
    this.userId,
    this.username,
    this.isActive,
    this.accessToken,
    this.employee,
  });

  AuthModel.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    username = json['username'];
    isActive = json['isActive'];
    accessToken = json['accessToken'];
    employee = json['employee'] != null
        ? EmployeeModel.fromJson(json['employee'])
        : null;
  }

  String get getFullName => employee?.fullName ?? '';

  String get getUserCode => employee?.code ?? '';

  String get getStoreName => employee?.storeName ?? '';

  int get getStoreId => employee?.storeId ?? 0;

  int get getUserId => userId ?? 0;

  UserTable get convertToUserTable => UserTable()
    ..userId = userId
    ..username = username
    ..isActive = isActive
    ..accessToken = accessToken
    ..fullName = employee?.fullName
    ..userCode = employee?.code;
}
