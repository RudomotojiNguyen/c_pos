part of 'product_bloc.dart';

sealed class ProductEvent {}

final class GetImeiHistoryEvent extends ProductEvent {}

final class GetMoreImeiHistoryEvent extends ProductEvent {}

final class UpdateImeiFilterEvent extends ProductEvent {
  final ImeiStatus imeiStatus;
  final StoreModel? store;
  final String search;

  UpdateImeiFilterEvent(
      {required this.imeiStatus, this.store, required this.search});
}

final class SetDefaultImeiFilterEvent extends ProductEvent {}

final class GetImeiTransactionEvent extends ProductEvent {
  final String imei;

  GetImeiTransactionEvent({required this.imei});
}

final class GetImeiTradeinTransactionEvent extends ProductEvent {
  final String imei;

  GetImeiTradeinTransactionEvent({required this.imei});
}
