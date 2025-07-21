import 'dart:convert';

import '../../presentation/utils/utils.dart';

class ProductImeiModel {
  int? id;
  int? storeId;
  String? imeiNo;
  String? productId;
  double? originalPrice;
  double? sellingPrice;
  int? status;

  ProductImeiModel(
      {this.id,
      this.storeId,
      this.imeiNo,
      this.productId,
      this.originalPrice,
      this.sellingPrice,
      this.status});

  ProductImeiModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    storeId = json['storeId'];
    imeiNo = json['imeiNo'];
    productId = json['productId'];
    originalPrice = Utils.toDouble(json['originalPrice']);
    sellingPrice = Utils.toDouble(json['sellingPrice']);
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['storeId'] = storeId;
    data['imeiNo'] = imeiNo;
    data['productId'] = productId;
    data['originalPrice'] = originalPrice;
    data['sellingPrice'] = sellingPrice;
    data['status'] = status;
    return data;
  }

  ProductImeiModel toModel(String value) {
    final res = jsonDecode(value);
    ProductImeiModel data = ProductImeiModel.fromJson(res);
    return data;
  }

  String get getImeiNoValue => imeiNo ?? '';

  @override
  String toString() {
    return jsonEncode(toJson());
  }
}
