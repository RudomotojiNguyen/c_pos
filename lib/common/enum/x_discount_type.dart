enum XDiscountType { none, percent, amount }

extension XDiscountTypeExtension on XDiscountType {
  static const Map<int, XDiscountType> map = {
    1: XDiscountType.amount,
    2: XDiscountType.percent,
  };
  static const Map<String, XDiscountType> mapStr = {
    'amount': XDiscountType.amount,
    'percent': XDiscountType.percent,
  };

  String get getValueNum {
    switch (this) {
      case XDiscountType.amount:
        return 'amount';
      case XDiscountType.percent:
        return 'percent';
      default:
        return '';
    }
  }

  int get value {
    switch (this) {
      case XDiscountType.amount:
        return 1;
      case XDiscountType.percent:
        return 2;
      default:
        return 0;
    }
  }

  String get unit {
    switch (this) {
      case XDiscountType.amount:
        return 'đ';
      case XDiscountType.percent:
        return '%';
      default:
        return '';
    }
  }

  String get title {
    switch (this) {
      case XDiscountType.amount:
        return 'Tiền';
      case XDiscountType.percent:
        return 'Phần trăm';
      default:
        return '';
    }
  }
}
