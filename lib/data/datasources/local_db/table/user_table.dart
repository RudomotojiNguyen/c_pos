import 'package:isar/isar.dart';

part 'user_table.g.dart';

@Collection()
class UserTable {
  Id id = Isar.autoIncrement;

  int? userId;
  String? username;
  int? storeId;
  String? storeName;
  int? employeeId;
  int? isActive;
  String? accessToken;
  List<String>? listFeature;
  int? jobTitleId;
  String? fullName;
  String? userCode;
}

extension UserTableExtension on UserTable {}
