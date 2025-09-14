import 'package:c_pos/common/extensions/extension.dart';

import '../../common/enum/x_job_title.dart';
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
    ..jobTitleId = employee?.jobTitleId
    ..storeId = employee?.storeId
    ..storeName = employee?.storeName
    ..userCode = employee?.code;

  XJobTitle get getJob => employee?.jobTitleId?.getJob ?? XJobTitle.none;

  Map<String, dynamic> formatCreatorInfoCreateBill() {
    Map<String, dynamic> data = {};
    data['storeId'] = getStoreId;
    data['storeName'] = getStoreName;
    return data;
  }
}
