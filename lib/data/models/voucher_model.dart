import 'dart:convert';

import 'package:c_pos/common/extensions/extension.dart';

import '../../common/enum/enum.dart';
import '../../presentation/utils/utils.dart';

class VoucherModel {
  int? voucherId;
  int? voucherDetailId;
  String? voucherCode;
  String? voucherName;
  double? value;
  XDiscountType? type;
  int? usable;
  double? voucherValue;
  double? maxValue;
  List<CumulativeValueModel>? cumulativeValues;

  VoucherModel({
    this.voucherId,
    this.voucherDetailId,
    this.voucherCode,
    this.voucherName,
    this.value,
    this.type,
    this.usable,
    this.voucherValue,
    this.maxValue,
    this.cumulativeValues,
  });

  List<String> get cumulativeStringValues => cumulativeValues != null
      ? cumulativeValues!.map((e) => jsonEncode(e.toJson())).toList()
      : [];

  VoucherModel.fromJson(Map<String, dynamic> json) {
    voucherId = json['voucherId'];
    voucherDetailId = json['voucherDetailId'];
    voucherCode = json['voucherCode'];
    voucherName = json['voucherName'];
    value = Utils.toDouble(json['value'] ?? json['voucherAmount']);
    type = ((json['type'] ?? json['voucherTypeDiscount']) as int?)
        ?.getDiscountType;
    usable = json['usable'];
    voucherValue = Utils.toDouble(json['voucherValue']);
    maxValue = Utils.toDouble(json['maxValue']);
    if (json['cumluativeValues'] != null) {
      cumulativeValues = <CumulativeValueModel>[];

      dynamic data = json['cumluativeValues'];

      if (data is String) {
        data = jsonDecode(data);
      }

      if (data is List) {
        for (var v in data) {
          cumulativeValues!.add(CumulativeValueModel.fromJson(v));
        }
      }
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['voucherId'] = voucherId;
    data['voucherDetailId'] = voucherDetailId;
    data['voucherCode'] = voucherCode;
    data['voucherName'] = voucherName;
    data['value'] = value;
    data['type'] = type == XDiscountType.none ? null : type?.value;
    data['usable'] = usable;
    data['voucherValue'] = voucherValue;
    data['maxValue'] = maxValue;
    if (cumulativeValues != null) {
      data['cumluativeValues'] =
          cumulativeValues!.map((v) => v.toJson()).toList();
    }
    return data;
  }

  List<CumulativeValueModel> get getCumulativeValues => cumulativeValues ?? [];

  double get getMaxValue => maxValue ?? 0;

  double get getVoucherValue => value ?? 0;

  int get getUsable => usable ?? 0;

  String get getCode => voucherCode ?? '';

  String get getName => voucherName ?? '';

  XDiscountType get getDiscountType => type ?? XDiscountType.none;
}

class CumulativeValueModel {
  int? id;
  int? voucherId;
  int? quantityFrom;
  int? quantityTo;
  double? cumulativeValue;

  CumulativeValueModel({
    this.id,
    this.voucherId,
    this.quantityFrom,
    this.quantityTo,
    this.cumulativeValue,
  });

  CumulativeValueModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    voucherId = json['voucherId'];
    quantityFrom = json['quantityFrom'];
    quantityTo = json['quantityTo'];
    cumulativeValue = Utils.toDouble(json['cumulativeValue']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['voucherId'] = voucherId;
    data['quantityFrom'] = quantityFrom;
    data['quantityTo'] = quantityTo;
    data['cumulativeValue'] = cumulativeValue;
    return data;
  }

  double get getValue => cumulativeValue ?? 0;

  int get getQuantityFrom => quantityFrom ?? 0;

  int get getQuantityTo => quantityTo ?? 0;

  CumulativeValueModel toModel(String value) {
    final res = jsonDecode(value);
    CumulativeValueModel data = CumulativeValueModel.fromJson(res);
    return data;
  }
}
