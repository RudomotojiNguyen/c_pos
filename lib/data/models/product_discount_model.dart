import 'dart:convert';

import 'package:c_pos/common/extensions/extension.dart';

import '../../common/enum/enum.dart';
import '../../presentation/utils/utils.dart';

class ProductDiscountModel {
  String? id;
  String? productCode;
  String? barCode;
  double? sellingPrice;
  double? originalPrice;
  double? sellingDiscount;
  XDiscountType? typeDiscount;
  double? value;
  double? maxValue;

  // note
  // customerDiscountType; // loại giảm giá "amount" / "percent"
  // customerDiscountAmount; // giá trị giảm
  // customerDiscountMaxAmount; // giá trị giảm tối đa
  // customerDiscountSellingPrice; // giá tiền sau khi giảm
  // customerTypeId; // id loại khách tại thời điểm mua

  ProductDiscountModel({
    this.id,
    this.productCode,
    this.barCode,
    this.sellingPrice,
    this.originalPrice,
    this.sellingDiscount,
    this.typeDiscount,
    this.value,
    this.maxValue,
  });

  ProductDiscountModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productCode = json['productCode'];
    barCode = json['barCode'];
    sellingPrice = Utils.toDouble(json['sellingPrice']);
    originalPrice = Utils.toDouble(json['originalPrice']);
    sellingDiscount = Utils.toDouble(json['sellingDiscount']);
    typeDiscount = (json['typeDiscount'] as String?)?.getDiscountType;
    value = Utils.toDouble(json['value']);
    maxValue = Utils.toDouble(json['maxValue']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['productCode'] = productCode;
    data['barCode'] = barCode;
    data['sellingPrice'] = sellingPrice;
    data['originalPrice'] = originalPrice;
    data['sellingDiscount'] = sellingDiscount;
    data['typeDiscount'] = typeDiscount;
    data['value'] = value;
    data['maxValue'] = maxValue;
    return data;
  }

  ProductDiscountModel toModel(String value) {
    final res = jsonDecode(value);
    return ProductDiscountModel.fromJson(res);
  }

  XDiscountType get discountType => typeDiscount ?? XDiscountType.none;
}
