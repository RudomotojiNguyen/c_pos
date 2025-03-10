import 'package:c_pos/common/constants/app_constants.dart';
import 'package:c_pos/common/extensions/extension.dart';

import '../../common/enum/enum.dart';
import '../../presentation/utils/utils.dart';

class ImeiHistoryModel {
  String? id;
  int? storeId;
  String? imeiNo;
  String? productId;
  String? providerId;
  double? originalPrice;
  double? sellingPrice;
  ImeiStatus? status;

  // Null? beforeImportStatus;
  // Null? description;
  String? createdAt;
  String? updatedAt;
  String? importDate;
  int? merchantId;
  String? receiptDate;

  // Null? priorityCartId;
  String? productName;
  String? barCode;
  String? productCode;
  String? storeName;
  String? statusName;

  ImeiHistoryModel(
      {this.id,
      this.storeId,
      this.imeiNo,
      this.productId,
      this.providerId,
      this.originalPrice,
      this.sellingPrice,
      this.status,
      // this.beforeImportStatus,
      // this.description,
      this.createdAt,
      this.updatedAt,
      this.importDate,
      this.merchantId,
      this.receiptDate,
      // this.priorityCartId,
      this.productName,
      this.barCode,
      this.productCode,
      this.storeName,
      this.statusName});

  ImeiHistoryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    storeId = json['storeId'];
    imeiNo = json['imeiNo'];
    productId = json['productId'];
    providerId = json['providerId'];
    originalPrice = Utils.toDouble(json['originalPrice']);
    sellingPrice = Utils.toDouble(json['sellingPrice']);
    status = ((json['status'] as int?) ?? 0).getImeiStatus;
    // beforeImportStatus = json['beforeImportStatus'];
    // description = json['description'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    importDate = json['importDate'];
    merchantId = json['merchantId'];
    receiptDate = json['receiptDate'];
    // priorityCartId = json['priorityCartId'];
    productName = json['productName'];
    barCode = json['barCode'];
    productCode = json['productCode'];
    storeName = json['storeName'];
    statusName = json['statusName'];
  }

  String get getImei => imeiNo ?? '';

  String get getStatus => statusName ?? '';

  String get getProductName => productName ?? '';

  String get getProductImage => AppConstants.noImage;

  double get getSellingPrice => sellingPrice ?? 0;
}
