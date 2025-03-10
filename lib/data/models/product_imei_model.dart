import 'dart:convert';

import '../../presentation/utils/utils.dart';

class ProductImeiModel {
  String? id;
  String? parentProductId;
  String? productName;
  String? barCode;
  int? totalQuantityInStock;
  double? listedPrice;
  int? merchantId;
  int? totalQuantityInStore;
  String? imeiNo;

  /// lý do chọn imei không theo FIFO
  String? reasonSelect;

  ProductImeiModel({
    this.id,
    this.parentProductId,
    this.productName,
    this.barCode,
    this.totalQuantityInStock,
    this.listedPrice,
    this.merchantId,
    this.totalQuantityInStore,
    this.imeiNo,
  });

  ProductImeiModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    parentProductId = json['parentProductId'];
    productName = json['productName'];
    barCode = json['barCode'];
    totalQuantityInStock = json['totalQuantityInStock'];
    listedPrice = Utils.toDouble(json['listedPrice']);
    merchantId = json['merchantId'];
    totalQuantityInStore = json['totalQuantityInStore'];
    imeiNo = json['imeiNo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['parentProductId'] = parentProductId;
    data['productName'] = productName;
    data['barCode'] = barCode;
    data['totalQuantityInStock'] = totalQuantityInStock;
    data['listedPrice'] = listedPrice;
    data['merchantId'] = merchantId;
    data['totalQuantityInStore'] = totalQuantityInStore;
    data['imeiNo'] = imeiNo;
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
