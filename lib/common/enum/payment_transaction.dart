enum PaymentTransaction { cash, credit, transfer, installment }

extension PaymentTransactionExtension on PaymentTransaction {
  static const Map<int, PaymentTransaction> map = {
    1: PaymentTransaction.cash,
    2: PaymentTransaction.transfer,
    3: PaymentTransaction.credit,
    4: PaymentTransaction.installment,
  };

  int get getValue {
    switch (this) {
      case PaymentTransaction.cash:
        return 1;
      case PaymentTransaction.transfer:
        return 2;
      case PaymentTransaction.credit:
        return 3;
      case PaymentTransaction.installment:
        return 4;
      default:
        return 0;
    }
  }
}
