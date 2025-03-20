enum MethodDeposit { interestPayment, noneInterestPayment, none }

extension MethodDepositExtension on MethodDeposit {
  String get getTitle {
    switch (this) {
      case MethodDeposit.noneInterestPayment:
        return 'Lãi suất 0%';
      case MethodDeposit.interestPayment:
        return 'Dịch vụ trả lãi';
      default:
        return '';
    }
  }

  int get getValue {
    switch (this) {
      case MethodDeposit.noneInterestPayment:
        return 2;
      case MethodDeposit.interestPayment:
        return 1;
      default:
        return 0;
    }
  }
}
