import 'dart:convert';

import '../../presentation/utils/utils.dart';
import 'store_model.dart';

class EmployeeModel {
  int? id;
  String? code;
  String? phoneNo;
  String? birthDay;
  int? jobTitleId;
  String? email;
  String? mobile;
  int? storeId;
  List<String>? listStoreId;
  String? address;
  String? createdAt;
  String? updatedAt;
  bool? deleted;
  bool? isActive;
  int? areaId;
  int? regionId;
  int? departmentId;
  int? personalAllowance;
  int? selfAllowance;
  int? dependent;
  String? commencementDate;
  bool? isPayPersonalIncomeTax;
  String? departmentUnit;
  int? transportationAllowanceAmount;
  int? employeeId;
  String? fullName;
  String? storeName;

  //
  StoreModel? store;
  StoreModel? jobTitle;

  EmployeeModel({
    this.id,
    this.code,
    this.fullName,
    this.phoneNo,
    this.birthDay,
    this.jobTitleId,
    this.email,
    this.mobile,
    this.storeId,
    this.listStoreId,
    this.address,
    this.createdAt,
    this.updatedAt,
    this.deleted,
    this.isActive,
    this.areaId,
    this.regionId,
    this.departmentId,
    this.personalAllowance,
    this.selfAllowance,
    this.dependent,
    this.commencementDate,
    this.isPayPersonalIncomeTax,
    this.departmentUnit,
    this.transportationAllowanceAmount,
    this.employeeId,
    this.storeName,
  });

  EmployeeModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    code = json['code'];
    fullName = json['fullName'];
    phoneNo = json['phoneNo'];
    birthDay = json['birthDay'];
    jobTitleId = json['jobTitleId'];
    email = json['email'];
    mobile = json['mobile'];
    storeId = json['storeId'];

    final stores = json['listStoreId'];
    if (stores is String) {
      listStoreId = [stores];
    } else if (stores is List) {
      listStoreId = stores.map((e) => e.toString()).toList();
    }

    address = json['address'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    deleted = Utils.toBoolean(json['deleted']);
    isActive = Utils.toBoolean(json['isActive']);
    areaId = json['areaId'];
    regionId = json['regionId'];
    departmentId = json['departmentId'];
    personalAllowance = json['personalAllowance'];
    selfAllowance = json['selfAllowance'];
    dependent = json['dependent'];
    commencementDate = json['commencementDate'];
    isPayPersonalIncomeTax = Utils.toBoolean(json['isPayPersonalIncomeTax']);
    departmentUnit = json['departmentUnit']?.toString();
    transportationAllowanceAmount = json['transportationAllowanceAmount'];
    employeeId = json['employeeId'];

    //
    store = json['store'] != null ? StoreModel.fromJson(json['store']) : null;
    jobTitle =
        json['jobTitle'] != null ? StoreModel.fromJson(json['jobTitle']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['fullName'] = fullName;
    data['code'] = code;
    return data;
  }

  EmployeeModel copyWith({
    int? id,
    String? code,
    String? phoneNo,
    String? birthDay,
    int? jobTitleId,
    String? email,
    String? mobile,
    int? storeId,
    List<String>? listStoreId,
    String? address,
    String? createdAt,
    String? updatedAt,
    bool? deleted,
    bool? isActive,
    int? areaId,
    int? regionId,
    int? departmentId,
    int? personalAllowance,
    int? selfAllowance,
    int? dependent,
    String? commencementDate,
    bool? isPayPersonalIncomeTax,
    String? departmentUnit,
    int? transportationAllowanceAmount,
    int? employeeId,
    String? fullName,
    String? storeName,
  }) {
    return EmployeeModel(
      id: id ?? this.id,
      code: code ?? this.code,
      fullName: fullName ?? this.fullName,
      phoneNo: phoneNo ?? this.phoneNo,
      birthDay: birthDay ?? this.birthDay,
      jobTitleId: jobTitleId ?? this.jobTitleId,
      email: email ?? this.email,
      mobile: mobile ?? this.mobile,
      storeId: storeId ?? this.storeId,
      listStoreId: listStoreId ?? this.listStoreId,
      address: address ?? this.address,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deleted: deleted ?? this.deleted,
      isActive: isActive ?? this.isActive,
      areaId: areaId ?? this.areaId,
      regionId: regionId ?? this.regionId,
      departmentId: departmentId ?? this.departmentId,
      personalAllowance: personalAllowance ?? this.personalAllowance,
      selfAllowance: selfAllowance ?? this.selfAllowance,
      dependent: dependent ?? this.dependent,
      commencementDate: commencementDate ?? this.commencementDate,
      isPayPersonalIncomeTax:
          isPayPersonalIncomeTax ?? this.isPayPersonalIncomeTax,
      departmentUnit: departmentUnit ?? this.departmentUnit,
      transportationAllowanceAmount:
          transportationAllowanceAmount ?? this.transportationAllowanceAmount,
      employeeId: employeeId ?? this.employeeId,
      storeName: storeName ?? this.storeName,
    );
  }

  EmployeeModel toModel(String value) {
    final res = jsonDecode(value);
    EmployeeModel data = EmployeeModel.fromJson(res);
    return data;
  }

  @override
  String toString() {
    return jsonEncode(toJson());
  }

  String get getFullName => fullName ?? '';

  String get getCode => code ?? '';

  int? get saleId => employeeId ?? id;

  int? get saleStoreId => storeId ?? store?.id;
}
