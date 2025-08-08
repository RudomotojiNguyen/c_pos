import 'package:c_pos/common/extensions/extension.dart';

import '../../../common/enum/enum.dart';
import '../../../presentation/utils/utils.dart';

class TradeInProgramCreteriaGroupOptionModel {
  int? id;
  int? tradeInProgramCreteriaGroupId;
  String? creteriaName;
  String? description;
  int? priority;
  double? amount;
  XExpression? operator;
  int? amountType;
  double? adjustAmount;
  int? adjustOperator;
  int? adjustAmountType;

  TradeInProgramCreteriaGroupOptionModel(
      {this.id,
      this.tradeInProgramCreteriaGroupId,
      this.creteriaName,
      this.description,
      this.priority,
      this.amount,
      this.operator,
      this.amountType,
      this.adjustAmount,
      this.adjustOperator,
      this.adjustAmountType});

  TradeInProgramCreteriaGroupOptionModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    tradeInProgramCreteriaGroupId = json['tradeInProgramCreteriaGroupId'];
    creteriaName = json['creteriaName'];
    description = json['description'];
    priority = json['priority'];
    amount = Utils.toDouble(json['amount']);
    operator = (json['operator'] as int).getOperatorType;
    amountType = json['amountType'];
    adjustAmount = Utils.toDouble(json['adjustAmount']);
    adjustOperator = json['adjustOperator'];
    adjustAmountType = json['adjustAmountType'];
  }

  Map<String, dynamic> toJson() {
    return {
      "id": tradeInProgramCreteriaGroupId,
      // "id": id,
      "criteriaName": creteriaName,
      "amount": amount,
      "operator": getOperator.getValue,
    };
  }

  String get getCreteriaName => creteriaName ?? '';

  double get getAmount => amount ?? 0;

  XExpression get getOperator => operator ?? XExpression.none;
}
