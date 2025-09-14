part of 'search_product_bloc.dart';

sealed class SearchProductEvent {}

class ChangeSearchTypeEvent extends SearchProductEvent {
  final SearchType searchType;

  ChangeSearchTypeEvent({required this.searchType});
}

class RefreshProductsEvent extends SearchProductEvent {
  final SearchAction searchAction;
  final String? parentProductId;
  final XItemType? productType;

  RefreshProductsEvent({
    this.searchAction = SearchAction.search,
    this.parentProductId,
    this.productType,
  });
}

final class OnSearchProductsEvent extends SearchProductEvent {
  final String searchValue;
  final SearchAction searchAction;
  final XItemType? productType;
  final String? parentProductId;

  OnSearchProductsEvent(
    this.searchValue, {
    this.searchAction = SearchAction.search,
    this.productType,
    this.parentProductId,
  });
}

final class LoadMoreProductsEvent extends SearchProductEvent {
  final SearchAction searchAction;
  final String? parentProductId;
  final XItemType? productType;

  LoadMoreProductsEvent({
    this.searchAction = SearchAction.search,
    this.parentProductId,
    this.productType,
  });
}
