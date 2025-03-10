import 'package:c_pos/common/extensions/extension.dart';
import 'package:intl/intl.dart';

import '../../common/enum/enum.dart';
import '../../presentation/utils/utils.dart';

class TradeInTransactionModel {
  int? id;
  int? tradeInProgramId;
  int? valuationRequestId;
  int? customerId;
  String? productIMEI;
  String? productId;
  double? productBuyingPrice;
  double? totalCriteriaPrice;
  double? estimationBuydingPrice;
  double? finalBuyingPrice;
  int? storeId;
  int? status;
  String? note;
  String? estimatedAt;
  int? createdBy;
  int? updatedBy;
  TradeInType? typeTradeIn;
  int? sourceType;

  TradeInTransactionModel({
    this.id,
    this.tradeInProgramId,
    this.valuationRequestId,
    this.customerId,
    this.productIMEI,
    this.productId,
    this.productBuyingPrice,
    this.totalCriteriaPrice,
    this.estimationBuydingPrice,
    this.finalBuyingPrice,
    this.storeId,
    this.status,
    this.note,
    this.estimatedAt,
    this.createdBy,
    this.updatedBy,
    this.typeTradeIn,
    this.sourceType,
  });

  TradeInTransactionModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    tradeInProgramId = json['tradeInProgramId'];
    valuationRequestId = json['valuationRequestId'];
    customerId = json['customerId'];
    productIMEI = json['productIMEI'];
    productId = json['productId'];
    productBuyingPrice = Utils.toDouble(json['productBuyingPrice']);
    totalCriteriaPrice = Utils.toDouble(json['totalCriteriaPrice']);
    estimationBuydingPrice = Utils.toDouble(json['estimationBuydingPrice']);
    finalBuyingPrice = Utils.toDouble(json['finalBuyingPrice']);
    storeId = json['storeId'];
    status = json['status'];
    note = json['note'];
    estimatedAt = json['estimatedAt'];
    createdBy = json['createdBy'];
    updatedBy = json['updatedBy'];
    typeTradeIn = (json['typeTradeIn'] as int? ?? -1).getTradeInType;
    sourceType = json['sourceType'];
  }

  String get getCreateDate {
    if (estimatedAt?.isNullOrEmpty ?? true) return '';

    String originalDateTime = estimatedAt!;
    DateFormat originalFormat = DateFormat('yyyy-MM-ddTHH:mm:ss.sssZ');
    DateFormat desiredFormat = DateFormat('HH:mm, dd/MM/yyyy');

    DateTime dateTime = originalFormat.parse(originalDateTime);
    String formattedDateTime = desiredFormat.format(dateTime);

    return formattedDateTime;
  }

  double get getFinalBuyingPrice => finalBuyingPrice ?? 0;

  String get getTypeStr => typeTradeIn?.getTitle ?? '';
}
