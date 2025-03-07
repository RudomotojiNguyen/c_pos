part of 'order_bloc.dart';

@immutable
sealed class OrderEvent {}

final class GetOrderEvent extends OrderEvent {}

final class GetMoreOrderEvent extends OrderEvent {}

final class SetDefaultFilterEvent extends OrderEvent {}

final class UpdateSearchTypeEvent extends OrderEvent {
  final SearchType searchType;

  UpdateSearchTypeEvent(this.searchType);
}

final class FilterOrderEvent extends OrderEvent {
  final StatusEnum? status;
  final FilterBillAndOrderType? type;
  final FilterTime? time;
  final StoreModel? store;
  final String? searchValue;
  final SearchType? searchType;

  FilterOrderEvent({
    this.status,
    this.type,
    this.time,
    this.store,
    this.searchValue,
    this.searchType,
  });
}

class GetOrderDetailEvent extends OrderEvent {
  final String orderId;

  GetOrderDetailEvent(this.orderId);
}
