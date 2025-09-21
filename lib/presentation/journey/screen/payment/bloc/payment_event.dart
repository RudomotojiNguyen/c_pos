part of 'payment_bloc.dart';

@immutable
sealed class PaymentEvent {}

final class GetCashAccountsEvent extends PaymentEvent {
  final int? storeId;

  GetCashAccountsEvent({required this.storeId});
}

final class GetTransferAccountsEvent extends PaymentEvent {
  final CartType cartType;

  GetTransferAccountsEvent({required this.cartType});
}

final class GetCreditAccountsEvent extends PaymentEvent {
  final CartType cartType;

  GetCreditAccountsEvent({required this.cartType});
}

final class GetInstallmentAccountsEvent extends PaymentEvent {}

final class GetPaymentEnumEvent extends PaymentEvent {}
