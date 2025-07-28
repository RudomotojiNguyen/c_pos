import 'package:c_pos/common/extensions/extension.dart';
import 'package:intl/intl.dart';

class ImeiTransactionModel {
  int? id;
  int? imeiId;
  String? imeiCode;
  String? productName;
  String? productCode;
  String? barCode;
  String? providerName;
  String? saleName;
  String? action;
  String? code;
  String? createdBy;
  int? stockSlipId;
  String? stockSlipCode;
  int? stockSlipType;
  String? createdAt;
  String? storeName;

  ImeiTransactionModel({
    this.id,
    this.imeiId,
    this.imeiCode,
    this.productName,
    this.productCode,
    this.barCode,
    this.providerName,
    this.saleName,
    this.action,
    this.code,
    this.createdBy,
    this.stockSlipId,
    this.stockSlipCode,
    this.stockSlipType,
    this.createdAt,
    this.storeName,
  });

  ImeiTransactionModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    imeiId = json['imeiId'];
    imeiCode = json['imeiCode'];
    productName = json['productName'];
    productCode = json['productCode'];
    barCode = json['barCode'];
    providerName = json['providerName'];
    saleName = json['saleName'];
    action = json['action'];
    code = json['code'];
    createdBy = json['createdBy'];
    stockSlipId = json['stockSlipId'];
    stockSlipCode = json['stockSlipCode'];
    stockSlipType = json['stockSlipType'];
    createdAt = json['createdAt'];
    storeName = json['storeName'];
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

  String get getTransactionCode => stockSlipCode ?? '';

  String get getActionName => action ?? '';

  String get getCreator => createdBy ?? '';
}
