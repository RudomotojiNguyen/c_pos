import 'dart:ui';

import '../../presentation/theme/themes.dart';

enum Expression { none, add, minus }

extension ExpressionExtension on Expression {
  static const Map<int, Expression> mapOperatorType = {
    1: Expression.add,
    2: Expression.minus,
  };

  String get getExpressionStr {
    switch (this) {
      case Expression.add:
        return '+';
      case Expression.minus:
        return '-';
      default:
        return '';
    }
  }

  Color get getExpressionColor {
    switch (this) {
      case Expression.add:
        return AppColors.successColor;
      case Expression.minus:
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
