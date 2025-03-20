import 'package:c_pos/common/extensions/extension.dart';

import '../../common/enum/enum.dart';
import '../../presentation/utils/utils.dart';

class CouponModel {
  int? id;
  int? couponProgramId;
  String? code;
  int? maxUse;
  int? used;
  String? name;
  String? description;
  double? value;
  XDiscountType? type;
  String? startDate;
  String? endDate;
  double? maxValue;
  String? storeIds;
  double? applyFromAmount;
  int? applyWithPromotion;
  int? isApplyAllProduct;
  int? isApplyAllCustomer;
  double? totalMoneyInLineItems;
  double? discountMoney;

  CouponModel({
    this.id,
    this.couponProgramId,
    this.code,
    this.maxUse,
    this.used,
    this.name,
    this.description,
    this.value,
    this.type,
    this.startDate,
    this.endDate,
    this.maxValue,
    this.storeIds,
    this.applyFromAmount,
    this.applyWithPromotion,
    this.isApplyAllProduct,
    this.isApplyAllCustomer,
    this.totalMoneyInLineItems,
    this.discountMoney,
  });

  CouponModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    couponProgramId = json['couponProgramId'];
    code = json['code'];
    maxUse = json['maxUse'];
    used = json['used'];
    name = json['name'];
    description = json['description'];
    value = Utils.toDouble(json['value']);
    type = (json['type'] as int?)?.getDiscountType;
    startDate = json['startDate'];
    endDate = json['endDate'];
    maxValue = Utils.toDouble(json['maxValue']);
    storeIds = json['storeIds'];
    applyFromAmount = Utils.toDouble(json['applyFromAmount']);
    applyWithPromotion = json['applyWithPromotion'];
    isApplyAllProduct = json['isApplyAllProduct'];
    isApplyAllCustomer = json['isApplyAllCustomer'];
    totalMoneyInLineItems = Utils.toDouble(json['totalMoneyInLineItems']);
    discountMoney = Utils.toDouble(json['discountMoney']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['couponProgramId'] = couponProgramId;
    data['code'] = code;
    data['maxUse'] = maxUse;
    data['used'] = used;
    data['name'] = name;
    data['description'] = description;
    data['value'] = value;
    data['type'] = type;
    data['startDate'] = startDate;
    data['endDate'] = endDate;
    data['maxValue'] = maxValue;
    data['storeIds'] = storeIds;
    data['applyFromAmount'] = applyFromAmount;
    data['applyWithPromotion'] = applyWithPromotion;
    data['isApplyAllProduct'] = isApplyAllProduct;
    data['isApplyAllCustomer'] = isApplyAllCustomer;
    data['totalMoneyInLineItems'] = totalMoneyInLineItems;
    data['discountMoney'] = discountMoney;
    return data;
  }

  XDiscountType get getDiscountType => type ?? XDiscountType.none;

  double get getValue => value ?? 0;

  double get getMaxValue => maxValue ?? 0;

  int get getUsed => used ?? 0;

  int get getMaxUse => maxUse ?? 0;

  int get getCanUse => getMaxUse - getUsed;

  String get getEndDate => endDate == null ? '' : endDate!.formatDate();

  String get getCode => code ?? '';
}
