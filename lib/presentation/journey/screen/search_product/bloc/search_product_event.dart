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
  final String? referenceId;

  RefreshProductsEvent({
    this.searchAction = SearchAction.search,
    this.parentProductId,
    this.productType,
    this.cartType,
    this.referenceId,
  });
}

final class OnSearchProductsEvent extends SearchProductEvent {
  final String searchValue;
  final SearchAction searchAction;
  final XItemType? productType;
  final String? parentProductId;
  final CartType? cartType;
  final String? referenceId;

  OnSearchProductsEvent(
    this.searchValue, {
    this.searchAction = SearchAction.search,
    this.productType,
    this.parentProductId,
    this.cartType,
    this.referenceId,
  });
}

final class LoadMoreProductsEvent extends SearchProductEvent {
  final SearchAction searchAction;
  final String? parentProductId;
  final XItemType? productType;
  final CartType? cartType;
  final String? referenceId;

  LoadMoreProductsEvent({
    this.searchAction = SearchAction.search,
    this.parentProductId,
    this.productType,
    this.cartType,
    this.referenceId,
  });
}
