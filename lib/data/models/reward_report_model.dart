import 'package:c_pos/common/extensions/extension.dart';
import 'package:flutter/material.dart';

import '../../common/enum/x_expression.dart';
import '../../presentation/utils/utils.dart';

class RewardReportModel {
  int? storeId;
  String? storeName;
  String? fromDate;
  String? toDate;
  double? totalCount;
  double? totalBonus;
  double? totalMinus;
  double? totalPoint;
  double? bonusPoint;
  double? minusPoint;
  double? finalPoint;
  List<RewardMoreModel>? listBonus;
  List<RewardMoreModel>? listMinus;
  List<ListDetailCommission>? listDetail;

  RewardReportModel(
      {this.storeId,
      this.storeName,
      this.fromDate,
      this.toDate,
      this.totalCount,
      this.totalBonus,
      this.totalMinus,
      this.totalPoint,
      this.bonusPoint,
      this.minusPoint,
      this.finalPoint,
      this.listBonus,
      this.listMinus,
      this.listDetail});

  RewardReportModel.fromJson(Map<String, dynamic> json) {
    storeId = json['storeId'];
    storeName = json['storeName'];
    fromDate = json['fromDate'];
    toDate = json['toDate'];
    totalCount = Utils.toDouble(json['totalCount']);
    totalBonus = Utils.toDouble(json['totalBonus']);
    totalMinus = Utils.toDouble(json['totalMinus']);
    totalPoint = Utils.toDouble(json['totalPoint']);
    bonusPoint = Utils.toDouble(json['bonusPoint']);
    minusPoint = Utils.toDouble(json['minusPoint']);
    finalPoint = Utils.toDouble(json['finalPoint']);
    if (json['listBonus'] != null) {
      listBonus = <RewardMoreModel>[];
      json['listBonus'].forEach((v) {
        listBonus!.add(RewardMoreModel.fromJson(v));
      });
    }
    if (json['listMinus'] != null) {
      listMinus = <RewardMoreModel>[];
      json['listMinus'].forEach((v) {
        listMinus!.add(RewardMoreModel.fromJson(v));
      });
    }
    if (json['listDetail'] != null) {
      listDetail = <ListDetailCommission>[];
      json['listDetail'].forEach((v) {
        listDetail!.add(ListDetailCommission.fromJson(v));
      });
    }
  }

  /// hoa hồng phát sinh
  double get commissionsArise => totalPoint ?? 0;

  /// tiền thực lãnh
  double get actualMoneyReceived => finalPoint ?? 0;

  /// tổng số sản phẩm bán
  double get totalProductsSold => totalBonus ?? 0;

  /// tổng sản phẩm trả hàng
  double get totalProductReturned => totalMinus ?? 0;

  /// tiền được cộng khác
  double get otherAmountAdded => bonusPoint ?? 0;

  /// tiền bị trừ khác
  double get otherAmountDeducted => minusPoint ?? 0;

  List<ListDetailCommission> get getListDetail => listDetail ?? [];

  RewardReportModel formatListDetail() {
    try {
      for (var commission in getListDetail) {
        commission
            .formatListDetail(); // Call the formatListDetail of each ListDetailCommission
      }
    } catch (e) {
      debugPrint('error => $e');
    }
    return this; // Return the updated RewardReportModel
  }
}

class ListDetailCommission {
  int? id;
  String? fullName;
  int? jobTitleId;
  String? jobTitleName;
  double? count;
  double? rewardPoint;
  double? bonusPoint;
  double? minusPoint;
  List<ListDetailCommission>? listDetail;

  ///
  List<ConditionModel>? conditions;
  String? name;

  ListDetailCommission({
    this.id,
    this.fullName,
    this.jobTitleId,
    this.jobTitleName,
    this.count,
    this.rewardPoint,
    this.bonusPoint,
    this.minusPoint,
    this.listDetail,
    this.name,
    this.conditions,
  });

  ListDetailCommission.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fullName = json['fullName'];
    name = json['name'];
    jobTitleId = json['jobTitleId'];
    jobTitleName = json['jobTitleName'];
    count = Utils.toDouble(json['count']);
    rewardPoint = Utils.toDouble(json['rewardPoint']);
    bonusPoint = Utils.toDouble(json['bonusPoint']);
    minusPoint = Utils.toDouble(json['minusPoint']);
    if (json['listDetail'] != null) {
      listDetail = <ListDetailCommission>[];
      json['listDetail'].forEach((v) {
        listDetail!.add(ListDetailCommission.fromJson(v));
      });
    }
    if (json['conditions'] != null) {
      conditions = <ConditionModel>[];
      json['conditions'].forEach((v) {
        conditions!.add(ConditionModel.fromJson(v));
      });
    }
  }

  List<ListDetailCommission> get getListDetail => listDetail ?? [];

  List<ConditionModel> get getConditions => conditions ?? [];

  int get getJobTitleId => jobTitleId ?? 0;

  bool get checkHasData =>
      count! > 0 || rewardPoint! > 0 || bonusPoint! > 0 || minusPoint! > 0;

  /// Format the listDetail and update the list directly
  void formatListDetail() {
    try {
      // Kiểm tra nếu không có dữ liệu hợp lệ thì gán listDetail là mảng rỗng
      if (!checkHasData) {
        listDetail = [];
        return;
      }

      // Lặp qua getListDetail và xử lý conditions
      final filteredDetails = getListDetail
          .map((detail) {
            // Lọc ra những condition có checkHasData = true
            final validConditions = detail.getConditions
                .where((condition) => condition.checkHasData)
                .toList();

            // Chỉ trả về phần tử đã lọc conditions, nếu có conditions hợp lệ
            if (validConditions.isNotEmpty || detail.checkHasData) {
              detail.conditions = validConditions; // Cập nhật lại conditions
              return detail;
            }
            return null; // Trả về null nếu không có condition hợp lệ
          })
          .where((detail) => detail != null) // Lọc bỏ những phần tử null
          .cast<ListDetailCommission>()
          .toList();

      // Cập nhật lại listDetail với những phần tử đã lọc
      listDetail = filteredDetails;
    } catch (e) {
      print('Error in formatListDetail: $e');
    }
  }
}

class ConditionModel {
  String? name;
  double? count;
  double? point;
  double? bonusPoint;
  double? minusPoint;
  List<int>? ids;

  ConditionModel({
    this.name,
    this.count,
    this.point,
    this.bonusPoint,
    this.minusPoint,
    this.ids,
  });

  ConditionModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    count = Utils.toDouble(json['count']);
    point = Utils.toDouble(json['point']);
    bonusPoint = Utils.toDouble(json['bonusPoint']);
    minusPoint = Utils.toDouble(json['minusPoint']);
    ids = json['ids'].cast<int>();
  }

  String get getName => name ?? '';

  double get getBonusPoint => bonusPoint ?? 0;

  double get getMinusPoint => minusPoint ?? 0;

  double get getPoint => point ?? 0;

  List<int> get getIds => ids ?? [];

  bool get checkHasData =>
      count! > 0 || point! > 0 || bonusPoint! > 0 || minusPoint! > 0;
}

class RewardMoreModel {
  String? description;
  String? date;
  late XExpression operatorType;
  String? operatorTypeName;
  double? amount;

  RewardMoreModel(
      {this.description,
      this.date,
      required this.operatorType,
      this.operatorTypeName,
      this.amount});

  RewardMoreModel.fromJson(Map<String, dynamic> json) {
    description = json['description'];
    date = json['date'];
    operatorType = (json['operatorType'] as int? ?? -1).getOperatorType;
    operatorTypeName = json['operatorTypeName'];
    amount = Utils.toDouble(json['amount']);
  }

  String get getDate => date ?? '';

  double get getAmount => amount ?? 0;

  String get getAmountStr {
    return '${operatorType.getExpressionStr} ${getAmount.formatNumber}';
  }
}
