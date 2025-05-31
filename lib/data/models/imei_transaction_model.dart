import 'package:c_pos/common/extensions/extension.dart';
import 'package:intl/intl.dart';

import '../../common/enum/enum.dart';

class ImeiTransactionModel {
  int? imeiId;
  String? imeiCode;
  String? productName;
  String? productCode;
  String? providerName;
  String? saleName;
  String? code;
  String? createdBy;
  int? stockSlipId;
  int? stockSlipType;
  String? billNumber;
  String? storeName;
  int? action;
  String? actionName;
  String? createdAt;
  int? index;

  ImeiTransactionModel({
    this.imeiId,
    this.imeiCode,
    this.productName,
    this.productCode,
    this.providerName,
    this.saleName,
    this.code,
    this.createdBy,
    this.stockSlipId,
    this.stockSlipType,
    this.billNumber,
    this.storeName,
    this.action,
    this.actionName,
    this.createdAt,
    this.index,
  });

  ImeiTransactionModel.fromJson(Map<String, dynamic> json) {
    imeiId = json['imeiId'];
    imeiCode = json['imeiCode'];
    productName = json['productName'];
    productCode = json['productCode'];
    providerName = json['providerName'];
    saleName = json['saleName'];
    code = json['code'];
    createdBy = json['createdBy'];
    stockSlipId = json['stockSlipId'];
    stockSlipType = json['stockSlipType'];
    billNumber = json['billNumber'];
    storeName = json['storeName'];
    action = json['action'];
    actionName = json['actionName'];
    createdAt = json['createdAt'];
    index = json['index'];
  }

  String get getCreateDate {
    if (createdAt?.isNullOrEmpty ?? true) return '';

    String originalDateTime = createdAt!;
    DateFormat originalFormat = DateFormat('yyyy-MM-ddTHH:mm:ss.sssZ');
    DateFormat desiredFormat = DateFormat('HH:mm, dd/MM/yyyy');

    DateTime dateTime =
        originalFormat.tryParse(originalDateTime) ?? DateTime.now();
    String formattedDateTime = desiredFormat.format(dateTime);

    return formattedDateTime;
  }

  String get getTransactionCode => code ?? '';

  // String get getTypeTitle => type?.getTitle ?? '';

  // BillType get getBillType => type ?? BillType.undefine;
}

class BillItemModel {
  String? id;
  String? billId;
  String? productId;
  int? quantity;
  int? productPrice;
  int? discountAmount;
  int? discountType;
  int? totalAmount;

  BillItemModel({
    this.id,
    this.billId,
    this.productId,
    this.quantity,
    this.productPrice,
    this.discountAmount,
    this.discountType,
    this.totalAmount,
  });

  BillItemModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    billId = json['billId'];
    productId = json['productId'];
    quantity = json['quantity'];
    productPrice = json['productPrice'];
    discountAmount = json['discountAmount'];
    discountType = json['discountType'];
    totalAmount = json['totalAmount'];
  }
}
