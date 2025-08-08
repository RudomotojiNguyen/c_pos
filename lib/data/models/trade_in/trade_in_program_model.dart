import 'trade_in_program_criteria_group_model.dart';

class TradeInProgramModel {
  int? id;
  String? name;
  String? description;
  bool? status;
  String? startDate;
  String? endDate;
  int? amortizationExpense;
  String? productName;
  String? productId;
  int? buyingPrice;
  List<TradeInProgramCriteriaGroupModel>? tradeInProgramCriteriaGroup;

  TradeInProgramModel(
      {this.id,
      this.name,
      this.description,
      this.status,
      this.startDate,
      this.endDate,
      this.amortizationExpense,
      this.productName,
      this.productId,
      this.buyingPrice,
      this.tradeInProgramCriteriaGroup});

  TradeInProgramModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    status = json['status'];
    startDate = json['startDate'];
    endDate = json['endDate'];
    amortizationExpense = json['amortizationExpense'];
    productName = json['productName'];
    productId = json['productId'];
    buyingPrice = json['buyingPrice'];
    if (json['tradeInProgramCriteriaGroup'] != null) {
      tradeInProgramCriteriaGroup = <TradeInProgramCriteriaGroupModel>[];
      json['tradeInProgramCriteriaGroup'].forEach((v) {
        tradeInProgramCriteriaGroup!
            .add(TradeInProgramCriteriaGroupModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['description'] = description;
    data['status'] = status;
    data['startDate'] = startDate;
    data['endDate'] = endDate;
    data['amortizationExpense'] = amortizationExpense;
    data['productName'] = productName;
    data['productId'] = productId;
    data['buyingPrice'] = buyingPrice;
    if (tradeInProgramCriteriaGroup != null) {
      data['tradeInProgramCriteriaGroup'] =
          tradeInProgramCriteriaGroup!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
