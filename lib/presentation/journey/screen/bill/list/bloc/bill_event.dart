part of 'bill_bloc.dart';

@immutable
sealed class BillEvent {}

final class GetBillListEvent extends BillEvent {}

final class GetMoreBillListEvent extends BillEvent {}

final class FilterBillEvent extends BillEvent {
  final String? searchValue;
  final FilterBillAndOrderType? type;
  final StoreModel? store;
  final SearchType? searchType;

  FilterBillEvent({
    this.searchValue,
    this.type,
    this.store,
    this.searchType,
  });
}

final class UpdateSearchTypeEvent extends BillEvent {
  final SearchType searchType;

  UpdateSearchTypeEvent({
    required this.searchType,
  });
}

final class UpdateSearchTextEvent extends BillEvent {
  final String searchText;

  UpdateSearchTextEvent({
    required this.searchText,
  });
}

final class SetFilterDefaultEvent extends BillEvent {}

final class GetBillDetailEvent extends BillEvent {
  final String billId;

  GetBillDetailEvent(this.billId);
}
