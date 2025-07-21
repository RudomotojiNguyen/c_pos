part of 'search_product_bloc.dart';

sealed class SearchProductEvent {}

class ChangeSearchTypeEvent extends SearchProductEvent {
  final SearchType searchType;

  ChangeSearchTypeEvent({required this.searchType});
}

class RefreshProductsEvent extends SearchProductEvent {
  final SearchAction searchAction;

  RefreshProductsEvent({this.searchAction = SearchAction.search});
}

final class OnSearchProductsEvent extends SearchProductEvent {
  final String searchValue;
  final SearchAction searchAction;

  OnSearchProductsEvent(this.searchValue,
      {this.searchAction = SearchAction.search});
}

final class LoadMoreProductsEvent extends SearchProductEvent {
  final SearchAction searchAction;

  LoadMoreProductsEvent({this.searchAction = SearchAction.search});
}
