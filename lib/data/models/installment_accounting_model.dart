import 'dart:convert';

class InstallmentAccountingModel {
  String? id;
  String? name;
  String? code;
  String? phone;
  String? address;
  int? createdBy;
  bool? deleted;
  String? createdAt;
  String? updatedAt;

  InstallmentAccountingModel({
    this.id,
    this.name,
    this.code,
    this.phone,
    this.address,
    this.createdBy,
    this.deleted,
    this.createdAt,
    this.updatedAt,
  });

  InstallmentAccountingModel.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toString();
    name = json['name'];
    code = json['code'];
    phone = json['phone'];
    address = json['address'];
    createdBy = json['createdBy'];
    deleted = json['deleted'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['code'] = code;
    data['phone'] = phone;
    data['address'] = address;
    data['createdBy'] = createdBy;
    data['deleted'] = deleted;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    return data;
  }

  InstallmentAccountingModel toModel(String value) {
    final res = jsonDecode(value);
    return InstallmentAccountingModel.fromJson(res);
  }

  String get getName => name ?? '';
}
