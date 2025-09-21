part of 'search_product_bloc.dart';

sealed class SearchProductEvent {}

class ChangeSearchTypeEvent extends SearchProductEvent {
  final SearchType searchType;
  final CartType? cartType;

  ChangeSearchTypeEvent({required this.searchType, this.cartType});
}

class RefreshProductsEvent extends SearchProductEvent {
  final SearchAction searchAction;
  final String? parentProductId;
  final XItemType? productType;
  final CartType? cartType;

  RefreshProductsEvent({
    this.searchAction = SearchAction.search,
    this.parentProductId,
    this.productType,
    this.cartType,
  });
}

final class OnSearchProductsEvent extends SearchProductEvent {
  final String searchValue;
  final SearchAction searchAction;
  final XItemType? productType;
  final String? parentProductId;
  final CartType? cartType;

  OnSearchProductsEvent(
    this.searchValue, {
    this.searchAction = SearchAction.search,
    this.productType,
    this.parentProductId,
    this.cartType,
  });
}

final class LoadMoreProductsEvent extends SearchProductEvent {
  final SearchAction searchAction;
  final String? parentProductId;
  final XItemType? productType;
  final CartType? cartType;

  LoadMoreProductsEvent({
    this.searchAction = SearchAction.search,
    this.parentProductId,
    this.productType,
    this.cartType,
  });
}
