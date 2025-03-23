part of 'search_product_bloc.dart';

sealed class SearchProductEvent {}

class ChangeSearchTypeEvent extends SearchProductEvent {
  final SearchType searchType;

  ChangeSearchTypeEvent({required this.searchType});
}

class RefreshProductsEvent extends SearchProductEvent {}

final class OnSearchProductsEvent extends SearchProductEvent {
  final String searchValue;

  OnSearchProductsEvent(this.searchValue);
}

final class LoadMoreProductsEvent extends SearchProductEvent {}
