import '../datasources/local_db/table/user_table.dart';
import 'employee_model.dart';

class AuthModel {
  int? userId;
  String? username;
  int? storeId;
  String? storeName;
  int? employeeId;
  int? isActive;
  String? accessToken;
  List<String>? listFeature;
  int? jobTitleId;
  EmployeeModel? employee;

  AuthModel({
    this.userId,
    this.username,
    this.storeId,
    this.storeName,
    this.employeeId,
    this.isActive,
    this.accessToken,
    this.listFeature,
    this.jobTitleId,
    this.employee,
  });

  AuthModel.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    username = json['username'];
    storeId = json['storeId'];
    storeName = json['storeName'];
    employeeId = json['employeeId'];
    isActive = json['isActive'];
    accessToken = json['accessToken'];
    listFeature = json['listFeature'].cast<String>();
    jobTitleId = json['jobTitleId'];
    employee = json['employee'] != null
        ? EmployeeModel.fromJson(json['employee'])
        : null;
  }

  String get getFullName => employee?.fullName ?? '';

  String get getUserCode => employee?.code ?? '';

  String get getStoreName => storeName ?? '';

  int get getStoreId => storeId ?? 0;

  int get getUserId => userId ?? 0;

  UserTable get convertToUserTable => UserTable()
    ..userId = userId
    ..username = username
    ..storeId = storeId
    ..storeName = storeName
    ..employeeId = employeeId
    ..isActive = isActive
    ..accessToken = accessToken
    ..listFeature = listFeature
    ..jobTitleId = jobTitleId
    ..fullName = employee?.fullName
    ..userCode = employee?.code;
}
