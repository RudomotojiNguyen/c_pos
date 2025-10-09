import 'package:c_pos/common/extensions/extension.dart';

import '../../common/enum/enum.dart';

class RewardProductCheckModel {
  int? id;
  String? name;
  int? detailId;
  int? amount1;
  int? amount2;
  RewardOperatorType? amount1Operator;
  RewardOperatorType? amount2Operator;
  int? rewardProgramCategoryId;
  List<Categories>? categories;

  RewardProductCheckModel(
      {this.id,
      this.name,
      this.detailId,
      this.amount1,
      this.amount2,
      this.amount1Operator,
      this.amount2Operator,
      this.rewardProgramCategoryId,
      this.categories});

  RewardProductCheckModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    detailId = json['detailId'];
    amount1 = json['amount1'];
    amount2 = json['amount2'];
    amount1Operator =
        (json['amount1Operator'] as int?)?.getRewardOperatorType ??
            RewardOperatorType.none;
    amount2Operator =
        (json['amount2Operator'] as int?)?.getRewardOperatorType ??
            RewardOperatorType.none;
    rewardProgramCategoryId = json['rewardProgramCategoryId'];
    if (json['categories'] != null) {
      categories = <Categories>[];
      json['categories'].forEach((v) {
        categories!.add(Categories.fromJson(v));
      });
    }
  }
}

extension RewardProductCheckModelExtension on RewardProductCheckModel {
  String get getRewardName => name ?? '';

  String get getConfigInfo {
    return '${amount1?.formatCurrency} ${amount1Operator?.getOperator} DT ${amount2Operator?.getOperator} ${amount2?.formatCurrency}';
  }

  List<Categories> get getCategories => categories ?? [];
}

class Categories {
  int? id;
  int? type;
  String? referenceId;
  int? rewardProductCategoryId;
  String? rewardProductCategoryName;

  Categories(
      {this.id,
      this.type,
      this.referenceId,
      this.rewardProductCategoryId,
      this.rewardProductCategoryName});

  Categories.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    referenceId = json['referenceId'];
    rewardProductCategoryId = json['rewardProductCategoryId'];
    rewardProductCategoryName = json['rewardProductCategoryName'];
  }
}

extension CategoriesExtension on Categories {
  String get getCategoryName => rewardProductCategoryName ?? '';
}
