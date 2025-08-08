part of 'trade_in_bloc.dart';

@immutable
sealed class TradeInEvent {}

final class GetTradeInDataEvent extends TradeInEvent {}

final class GetMoreTradeInDataEvent extends TradeInEvent {}

final class SetDefaultFilter extends TradeInEvent {}

final class UpdateFilterEvent extends TradeInEvent {
  final DateTime? fromDate;
  final DateTime? toDate;
  final String? searchValue;
  final SearchType? searchType;

  UpdateFilterEvent({
    this.fromDate,
    this.toDate,
    this.searchValue,
    this.searchType,
  });
}

final class OnChangeTextSearchEvent extends TradeInEvent {
  final String? searchValue;

  OnChangeTextSearchEvent({
    this.searchValue,
  });
}

final class GetTradeInDataDetailEvent extends TradeInEvent {
  final int id;

  GetTradeInDataDetailEvent(this.id);
}

final class GetImagesTradeInEvent extends TradeInEvent {
  final int id;

  GetImagesTradeInEvent(this.id);
}

final class UpdateImageTradeInEvent extends TradeInEvent {
  final int index;
  final String? uuid;
  final XFile? value;

  UpdateImageTradeInEvent({
    required this.index,
    this.uuid,
    required this.value,
  });
}

final class RemoveImageTradeInEvent extends TradeInEvent {
  final int index;
  final String? uuid;

  RemoveImageTradeInEvent({
    required this.index,
    this.uuid,
  });
}

final class UploadImageTradeInEvent extends TradeInEvent {
  final int tradeInBillId;
  final XFile file;
  final int index;

  UploadImageTradeInEvent({
    required this.tradeInBillId,
    required this.index,
    required this.file,
  });
}

final class SearchProductByNameEvent extends TradeInEvent {
  final String name;

  SearchProductByNameEvent(this.name);
}

final class GetTradeInCritrtionEvent extends TradeInEvent {
  final String productId;

  GetTradeInCritrtionEvent(this.productId);
}
