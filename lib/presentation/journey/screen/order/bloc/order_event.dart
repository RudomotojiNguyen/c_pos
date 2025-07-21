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
  final StoreModel? store;
  final EmployeeModel? employee;
  final DateTime? fromDay;
  final DateTime? toDay;
  final String? searchValue;
  final SearchType? searchType;

  FilterOrderEvent({
    this.status,
    this.store,
    this.employee,
    this.fromDay,
    this.toDay,
    this.searchValue,
    this.searchType,
  });
}

class GetOrderDetailEvent extends OrderEvent {
  final String orderId;

  GetOrderDetailEvent(this.orderId);
}
