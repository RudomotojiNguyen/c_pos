import 'dart:ui';

import '../../presentation/theme/colors.dart';

enum XExpression { none, add, minus }

extension XExpressionExtension on XExpression {
  static const Map<int, XExpression> mapOperatorType = {
    1: XExpression.add,
    2: XExpression.minus,
  };

  String get getExpressionStr {
    switch (this) {
      case XExpression.add:
        return '+';
      case XExpression.minus:
        return '-';
      default:
        return '';
    }
  }

  Color get getExpressionColor {
    switch (this) {
      case XExpression.add:
        return AppColors.successColor;
      case XExpression.minus:
        return AppColors.errorColor;
      default:
        return AppColors.neutralColor;
    }
  }

  int get getValue {
    return mapOperatorType.entries
        .firstWhere((entry) => entry.value == this)
        .key;
  }
}
