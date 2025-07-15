import 'package:c_pos/common/extensions/extension.dart';

import '../../../common/enum/enum.dart';
import 'trade_in_program_creteria_group_option_model.dart';

class TradeInProgramCriteriaGroupModel {
  int? id;
  int? tradeInProgramId;
  String? criteriaGroupName;
  int? priority;
  TypeSelect? type;
  bool? status;
  bool? isDisplayOnWeb;
  List<TradeInProgramCreteriaGroupOptionModel>?
      tradeInProgramCreteriaGroupOptions;

  TradeInProgramCriteriaGroupModel(
      {this.id,
      this.tradeInProgramId,
      this.criteriaGroupName,
      this.priority,
      this.type,
      this.status,
      this.isDisplayOnWeb,
      this.tradeInProgramCreteriaGroupOptions});

  TradeInProgramCriteriaGroupModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    tradeInProgramId = json['tradeInProgramId'];
    criteriaGroupName = json['criteriaGroupName'];
    priority = json['priority'];
    type = (json['type'] as int? ?? -1).getTypeSelect;
    status = json['status'];
    isDisplayOnWeb = json['isDisplayOnWeb'];
    if (json['tradeInProgramCreteriaGroupOptions'] != null) {
      tradeInProgramCreteriaGroupOptions =
          <TradeInProgramCreteriaGroupOptionModel>[];
      json['tradeInProgramCreteriaGroupOptions'].forEach((v) {
        tradeInProgramCreteriaGroupOptions!
            .add(TradeInProgramCreteriaGroupOptionModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['tradeInProgramId'] = tradeInProgramId;
    data['criteriaGroupName'] = criteriaGroupName;
    data['priority'] = priority;
    data['type'] = type;
    data['status'] = status;
    data['isDisplayOnWeb'] = isDisplayOnWeb;
    if (tradeInProgramCreteriaGroupOptions != null) {
      data['tradeInProgramCreteriaGroupOptions'] =
          tradeInProgramCreteriaGroupOptions!.map((v) => v.toJson()).toList();
    }
    return data;
  }

  String get getGroupName => criteriaGroupName ?? '';

  List<TradeInProgramCreteriaGroupOptionModel>
      get getTradeInProgramCreteriaGroupOptions =>
          tradeInProgramCreteriaGroupOptions ?? [];

  TypeSelect get getTypeSelect => type ?? TypeSelect.none;
}
