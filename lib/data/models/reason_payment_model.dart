import 'package:c_pos/common/extensions/extension.dart';

import '../../common/enum/enum.dart';

class PaymentReasonModel {
  String? createdAt;
  String? updatedAt;
  int? id;
  String? name;
  int? status;
  XFinanceRecipientObjectTypeEnum? objectType;

  PaymentReasonModel({
    this.createdAt,
    this.updatedAt,
    this.id,
    this.name,
    this.status,
    this.objectType,
  });

  PaymentReasonModel.fromJson(Map<String, dynamic> json) {
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    id = json['id'];
    name = json['name'];
    status = json['status'];
    objectType = (json['objectType'] as String? ?? '')
        .getXFinanceRecipientObjectTypeEnum;
  }

  String get getName => name ?? '';
}
