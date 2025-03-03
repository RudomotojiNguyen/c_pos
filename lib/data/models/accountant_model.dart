import 'dart:convert';

class AccountantModel {
  String? id;
  int? type;
  int? storeId;
  int? parentId;
  String? code;
  String? name;
  int? level;
  String? accountBankNo;
  String? accountGateWay;
  int? status;
  int? createdBy;
  bool? deleted;
  List<SubAccountModel>? subAccounts;

  AccountantModel(
      {this.id,
      this.type,
      this.storeId,
      this.parentId,
      this.code,
      this.name,
      this.level,
      this.accountBankNo,
      this.accountGateWay,
      this.status,
      this.createdBy,
      this.deleted,
      this.subAccounts});

  AccountantModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    storeId = json['storeId'];
    parentId = json['parentId'];
    code = json['code'];
    name = json['name'];
    level = json['level'];
    accountBankNo = json['accountBankNo'];
    accountGateWay = json['accountGateWay'];
    status = json['status'];
    createdBy = json['createdBy'];
    deleted = json['deleted'];
    if (json['subAccounts'] != null) {
      subAccounts = <SubAccountModel>[];
      json['subAccounts'].forEach((v) {
        subAccounts!.add(SubAccountModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['type'] = type;
    data['storeId'] = storeId;
    data['parentId'] = parentId;
    data['code'] = code;
    data['name'] = name;
    data['level'] = level;
    data['accountBankNo'] = accountBankNo;
    data['accountGateWay'] = accountGateWay;
    data['status'] = status;
    data['createdBy'] = createdBy;
    data['deleted'] = deleted;
    if (subAccounts != null) {
      data['subAccounts'] = subAccounts!.map((v) => v.toJson()).toList();
    }
    return data;
  }

  @override
  String toString() {
    return jsonEncode(toJson());
  }

  AccountantModel toModel(String value) {
    final res = jsonDecode(value);
    return AccountantModel.fromJson(res);
  }

  String get getName => name ?? '';

  String get getAccountBankNo => accountBankNo ?? '';
}

class SubAccountModel {
  int? id;
  String? name;
  String? identifyCode;
  String? accountantId;
  int? storeId;
  int? status;
  bool? deleted;

  SubAccountModel({
    this.id,
    this.name,
    this.identifyCode,
    this.accountantId,
    this.storeId,
    this.status,
    this.deleted,
  });

  SubAccountModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    identifyCode = json['identifyCode'];
    accountantId = json['accountantId'];
    storeId = json['storeId'];
    status = json['status'];
    deleted = json['deleted'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['identifyCode'] = identifyCode;
    data['accountantId'] = accountantId;
    data['storeId'] = storeId;
    data['status'] = status;
    data['deleted'] = deleted;
    return data;
  }
}
