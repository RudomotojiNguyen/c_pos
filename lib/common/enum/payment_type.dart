enum PaymentType { cash, transfer, credit, installment, refund }

extension PaymentTypeExtension on PaymentType {
  static const Map<int, PaymentType> map = {
    1: PaymentType.cash,
    2: PaymentType.transfer,
    3: PaymentType.credit,
    4: PaymentType.installment,
  };

  String get getTitle {
    switch (this) {
      case PaymentType.cash:
        return 'Tiền mặt';
      case PaymentType.transfer:
        return 'Chuyển khoản';
      case PaymentType.credit:
        return 'Cà thẻ';
      case PaymentType.installment:
        return 'Trả góp';
      case PaymentType.refund:
        return 'Hoàn tiền';
      default:
        return '';
    }
  }

  int get getValue {
    switch (this) {
      case PaymentType.cash:
        return 1;
      case PaymentType.transfer:
        return 2;
      case PaymentType.credit:
        return 3;
      case PaymentType.installment:
        return 4;
      case PaymentType.refund:
        return 6;
      default:
        return 0;
    }
  }
}
