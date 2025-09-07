import 'package:c_pos/common/constants/app_constants.dart';
import 'package:c_pos/common/extensions/extension.dart';

import '../../../common/enum/enum.dart';
import '../../../presentation/utils/utils.dart';

class TradeInModel {
  int? id;
  String? customerName;
  String? customerPhone;
  String? productName;
  String? imeiCode;
  double? estimationBuyingPrice;
  double? finalBuyingPrice;
  String? storeName;
  String? date;
  int? status;
  String? statusName;
  String? createdBy;
  String? tradeInTypeName;
  String? note;
  List<CriteriaGroupModel>? listCriteria;

  double? productBuyingPrice;
  double? totalCriteriaPrice;

  String? productImageUrl;
  String? productBarCode;

  TradeInModel({
    this.id,
    this.customerName,
    this.customerPhone,
    this.productName,
    this.imeiCode,
    this.estimationBuyingPrice,
    this.finalBuyingPrice,
    this.storeName,
    this.date,
    this.status,
    this.statusName,
    this.createdBy,
    this.tradeInTypeName,
    this.note,
    this.listCriteria,
    this.productBuyingPrice,
    this.totalCriteriaPrice,
    this.productImageUrl,
    this.productBarCode,
  });

  TradeInModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    customerName = json['customerName'];
    customerPhone = json['customerPhone'] ?? json['customerPhoneNo'];
    productName = json['productName'];
    imeiCode = json['imeiCode'];
    estimationBuyingPrice = Utils.toDouble(json['estimationBuydingPrice']);
    finalBuyingPrice = Utils.toDouble(json['finalBuyingPrice']);
    storeName = json['storeName'];
    date = json['date'];
    status = json['status'];
    statusName = json['statusName'];
    createdBy = json['createdBy'];
    tradeInTypeName = json['tradeInTypeName'];
    note = json['note'];
    productBuyingPrice = Utils.toDouble(json['productBuyingPrice']);
    totalCriteriaPrice = Utils.toDouble(json['totalCriteriaPrice']);
    if (json['listCreteriaGroup'] != null) {
      listCriteria = <CriteriaGroupModel>[];
      json['listCreteriaGroup'].forEach((v) {
        listCriteria!.add(CriteriaGroupModel.fromJson(v));
      });
    }

    productImageUrl = json['productImageUrl'];
    productBarCode = json['productBarCode'];
  }

  String get getBillNumber => id == null ? '' : id.toString();

  String get getCustomerName => customerName ?? '';

  String get getCustomerPhone => customerPhone ?? '';

  String get getCreateDate => date ?? '';

  String get getStatusStr => statusName ?? '';

  String get getLocationSrt => '';

  String get getIdCard => '';

  String get getStoreName => storeName ?? '';

  String get getProductName => productName ?? '';

  String get getProductImei => imeiCode ?? '';

  String get getProductImage => productImageUrl ?? AppConstants.defaultImage;

  double get getProductBuyingPrice => productBuyingPrice ?? 0;

  double get getFinalBuyingPrice => finalBuyingPrice ?? 0;

  double get getEstimationBuyingPrice => estimationBuyingPrice ?? 0;

  double get getTotalCriteriaPrice => totalCriteriaPrice ?? 0;

  StatusEnum get getOrderStatus => status?.getStatusEnum ?? StatusEnum.none;

  List<CriteriaGroupModel> get getListCriteriaChecked =>
      (listCriteria ?? []).where((e) => e.getListCheck.isNotEmpty).toList();

  bool get isCanAction => status != TradeInStatus.collected.getTypeValue;
}

class CriteriaGroupModel {
  int? id;
  int? priority;
  String? criteriaName;
  int? type;
  List<CriteriaModel>? listItem;

  CriteriaGroupModel(
      {this.id, this.priority, this.criteriaName, this.type, this.listItem});

  CriteriaGroupModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    priority = json['priority'];
    criteriaName = json['criterialName'];
    type = json['type'];
    if (json['listItem'] != null) {
      listItem = <CriteriaModel>[];
      json['listItem'].forEach((v) {
        listItem!.add(CriteriaModel.fromJson(v));
      });
    }
  }

  String get getGroupName => criteriaName ?? '';

  List<CriteriaModel> get getListCheck =>
      (listItem ?? []).where((element) => element.isSelected).toList();
}

class CriteriaModel {
  int? id;
  int? priority;
  String? name;
  XExpression? operatorType;
  int? adjustOperator;
  double? adjustAmount;
  double? amount;
  String? description;
  bool? selected;
  int? optionType;

  CriteriaModel({
    this.id,
    this.priority,
    this.name,
    this.operatorType,
    this.adjustOperator,
    this.adjustAmount,
    this.amount,
    this.description,
    this.selected,
    this.optionType,
  });

  CriteriaModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    priority = json['priority'];
    name = json['name'];
    operatorType = (json['operatorType'] as int).getOperatorType;
    adjustOperator = json['adjustOperator'];
    adjustAmount = Utils.toDouble(json['adjustAmount']);
    amount = Utils.toDouble(json['amount']);
    description = json['description'];
    selected = Utils.toBoolean(json['selected']) || json['selected'] == id;
    optionType = json['optionType'];
  }

  double get getAmount => amount ?? 0;

  String get getName => name ?? '';

  XExpression get getOperatorType => operatorType ?? XExpression.none;

  bool get isSelected => selected ?? false;
}
