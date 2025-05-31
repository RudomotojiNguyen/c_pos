import 'package:c_pos/common/extensions/extension.dart';
import 'package:intl/intl.dart';

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
  String? actionName;
  String? createdAt;

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
    this.actionName,
    this.createdAt,
  });

  ImeiTransactionModel.fromJson(Map<String, dynamic> json) {
    imeiId = json['imeiId'];
    imeiCode = json['imeiCode'];
    productName = json['productName'];
    productCode = json['productCode'];
    providerName = json['providerName'];
    saleName = json['createdBy'];
    code = json['stockSlipCode'];
    createdBy = json['createdBy'];
    stockSlipId = json['stockSlipId'];
    stockSlipType = json['stockSlipType'];
    billNumber = json['billNumber'];
    storeName = json['storeName'];
    actionName = json['action'];
    createdAt = json['createdAt'];
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
