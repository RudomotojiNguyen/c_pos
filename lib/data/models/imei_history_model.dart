import 'package:c_pos/common/constants/app_constants.dart';
import 'package:c_pos/common/extensions/extension.dart';
import 'package:flutter/material.dart';

import '../../common/enum/enum.dart';
import '../../presentation/theme/themes.dart';
import '../../presentation/utils/utils.dart';

class ImeiHistoryModel {
  String? id;
  int? storeId;
  String? imeiCode;
  String? productId;
  String? providerId;
  double? originalPrice;
  double? sellingPrice;
  ImeiStatus? status;
  List<String>? imageUrls;
  String? imageUrl;

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
  String? providerName;

  ImeiHistoryModel({
    this.id,
    this.storeId,
    this.imeiCode,
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
    this.statusName,
    this.providerName,
    this.imageUrls,
    this.imageUrl,
  });

  ImeiHistoryModel.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toString();
    storeId = json['storeId'];
    imeiCode = json['imeiCode'];
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
    providerName = json['providerName'];
    if (json['imageUrls'] != null) {
      imageUrls = <String>[];
      for (var v in json['imageUrls']) {
        if (v != null) {
          imageUrls!.add(v);
        }
      }
    }
    imageUrl = json['imageUrl'];
  }

  String get getImei => imeiCode ?? '';

  String get getStatus => status?.getTitle ?? '';

  Color get getColorImeiStatus =>
      status?.getColorImeiStatus ?? AppColors.neutral2Color;

  String get getProductName => productName ?? '';

  String get getProductImage =>
      imageUrl.isNullOrEmpty ? AppConstants.defaultImage : imageUrl!;

  double get getSellingPrice => sellingPrice ?? 0;

  String get getProvider => providerName ?? '';
}
