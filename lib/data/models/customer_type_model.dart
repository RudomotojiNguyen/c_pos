import 'dart:convert';

import '../../presentation/utils/utils.dart';

class CustomerTypeModel {
  int? id;
  String? code;
  String? name;
  String? description;
  int? userCreated;
  int? upgradeCost;
  bool? status;
  String? createdAt;
  String? updatedAt;
  List<CustomerTypeDiscountSettingModel>? customerTypeDiscountSettings;

  CustomerTypeModel({
    this.id,
    this.code,
    this.name,
    this.description,
    this.userCreated,
    this.upgradeCost,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.customerTypeDiscountSettings,
  });

  CustomerTypeModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    code = json['code'];
    name = json['name'];
    description = json['description'];
    userCreated = json['userCreated'];
    upgradeCost = json['upgradeCost'];
    status = json['status'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    if (json['customerTypeDiscountSettings'] != null) {
      customerTypeDiscountSettings = <CustomerTypeDiscountSettingModel>[];
      json['customerTypeDiscountSettings'].forEach((v) {
        customerTypeDiscountSettings!
            .add(CustomerTypeDiscountSettingModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['code'] = code;
    data['name'] = name;
    data['description'] = description;
    data['userCreated'] = userCreated;
    data['upgradeCost'] = upgradeCost;
    data['status'] = status;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    if (customerTypeDiscountSettings != null) {
      data['customerTypeDiscountSettings'] =
          customerTypeDiscountSettings!.map((v) => v.toJson()).toList();
    }
    return data;
  }

  CustomerTypeModel.toModel(String value) {
    final res = jsonDecode(value);
    CustomerTypeModel.fromJson(res);
  }

  @override
  String toString() {
    return jsonEncode(toJson());
  }
}

class CustomerTypeDiscountSettingModel {
  int? id;
  int? customerTypeId;
  String? typeDiscount;
  double? value;
  double? maxValue;
  String? typeItem;
  String? referentId;
  int? deleted;
  String? createdAt;
  String? updatedAt;

  CustomerTypeDiscountSettingModel({
    this.id,
    this.customerTypeId,
    this.typeDiscount,
    this.value,
    this.maxValue,
    this.typeItem,
    this.referentId,
    this.deleted,
    this.createdAt,
    this.updatedAt,
  });

  CustomerTypeDiscountSettingModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    customerTypeId = json['customerTypeId'] ?? json['CustomerTypeId'];
    typeDiscount = json['typeDiscount'];
    value = Utils.toDouble(json['value']);
    maxValue = Utils.toDouble(json['maxValue']);
    typeItem = json['typeItem'];
    referentId = json['referentId'];
    deleted = json['deleted'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['customerTypeId'] = customerTypeId;
    data['typeDiscount'] = typeDiscount;
    data['value'] = value;
    data['maxValue'] = maxValue;
    data['typeItem'] = typeItem;
    data['referentId'] = referentId;
    data['deleted'] = deleted;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['CustomerTypeId'] = customerTypeId;
    return data;
  }
}
