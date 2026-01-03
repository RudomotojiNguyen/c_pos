part of 'payment_bloc.dart';

@immutable
sealed class PaymentEvent {}

final class GetCashAccountsEvent extends PaymentEvent {
  final int? storeId;

  GetCashAccountsEvent({required this.storeId});
}

final class GetTransferAccountsEvent extends PaymentEvent {
  final int? storeId;

  GetTransferAccountsEvent({required this.storeId});
}

final class GetCreditAccountsEvent extends PaymentEvent {
  final int? storeId;

  GetCreditAccountsEvent({required this.storeId});
}

final class GetInstallmentAccountsEvent extends PaymentEvent {}

final class GetPaymentEnumEvent extends PaymentEvent {}
