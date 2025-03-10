import 'package:c_pos/common/extensions/extension.dart';
import 'package:intl/intl.dart';

import '../../common/enum/enum.dart';

class ImeiTransactionModel {
  String? id;
  int? billNumber;
  BillType? type;
  String? createdAt;
  List<BillItemModel>? billItems;

  ImeiTransactionModel({
    this.id,
    this.billNumber,
    this.type,
    this.createdAt,
    this.billItems,
  });

  ImeiTransactionModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    billNumber = json['billNumber'];
    type = (json['type'] as int? ?? 0).getBillType;
    createdAt = json['createdAt'];
    if (json['billItems'] != null) {
      billItems = (json['billItems'] as List)
          .map((item) => BillItemModel.fromJson(item))
          .toList();
    }
  }

  String get getCreateDate {
    if (createdAt?.isNullOrEmpty ?? true) return '';

    String originalDateTime = createdAt!;
    DateFormat originalFormat = DateFormat('yyyy-MM-ddTHH:mm:ss.sssZ');
    DateFormat desiredFormat = DateFormat('HH:mm, dd/MM/yyyy');

    DateTime dateTime = originalFormat.parse(originalDateTime);
    String formattedDateTime = desiredFormat.format(dateTime);

    return formattedDateTime;
  }

  String get getTypeTitle => type?.getTitle ?? '';

  BillType get getBillType => type ?? BillType.undefine;
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
