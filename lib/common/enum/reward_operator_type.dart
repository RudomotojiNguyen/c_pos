enum RewardOperatorType {
  none,
  lessThan,
  lessThanOrEqual,
  greaterThan,
  greaterThanOrEqual,
}

extension RewardOperatorTypeExtension on RewardOperatorType {
  static const Map<int, RewardOperatorType> map = {
    1: RewardOperatorType.none,
    2: RewardOperatorType.lessThan,
    4: RewardOperatorType.lessThanOrEqual,
    3: RewardOperatorType.greaterThan,
    5: RewardOperatorType.greaterThanOrEqual,
  };

  String get getOperator {
    switch (this) {
      case RewardOperatorType.none:
        return '--';
      case RewardOperatorType.lessThan:
        return '<';
      case RewardOperatorType.lessThanOrEqual:
        return '<=';
      case RewardOperatorType.greaterThan:
        return '>';
      case RewardOperatorType.greaterThanOrEqual:
        return '>=';
    }
  }
}
