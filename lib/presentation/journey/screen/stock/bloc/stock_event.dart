part of 'stock_bloc.dart';

@immutable
sealed class StockEvent {}

final class GetStockOfProductEvent extends StockEvent {
  final String productId;

  GetStockOfProductEvent(this.productId);
}

final class UpdateFilterEvent extends StockEvent {
  final CategoryModel? cateSelected;
  final SearchType? searchType;
  final bool? isInStock;
  final String? searchValue;
  final int? storeId;

  UpdateFilterEvent({
    this.cateSelected,
    this.searchType,
    this.isInStock,
    this.searchValue,
    this.storeId,
  });
}

final class GetProductsEvent extends StockEvent {}

final class GetMoreProductsEvent extends StockEvent {}

final class SetDefaultFilterEvent extends StockEvent {}
