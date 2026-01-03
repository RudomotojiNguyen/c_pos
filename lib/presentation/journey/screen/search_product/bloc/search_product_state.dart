part of 'search_product_bloc.dart';

sealed class SearchProductState extends Equatable {
  const SearchProductState({
    required this.searchType,
    required this.products,
    required this.pageInfo,
    required this.searchValue,
  });

  final SearchType searchType;

  final List<ProductModel> products;
  final PageInfoEntity pageInfo;
  final String searchValue;

  @override
  List<Object?> get props => [searchType, products, pageInfo, searchValue];
}

final class SearchLoading extends SearchProductState {
  SearchLoading({required SearchProductState state})
      : super(
          searchType: state.searchType,
          products: state.products,
          pageInfo: state.pageInfo,
          searchValue: state.searchValue,
        );
}

final class UpdateIsLoadMore extends SearchProductState {
  UpdateIsLoadMore({required SearchProductState state})
      : super(
          searchType: state.searchType,
          products: state.products,
          pageInfo: state.pageInfo,
          searchValue: state.searchValue,
        );
}

final class SearchProductInitial extends SearchProductState {
  const SearchProductInitial({
    required super.searchType,
    required super.products,
    required super.pageInfo,
    required super.searchValue,
  });
}

final class ChangeSearchTypeSuccess extends SearchProductState {
  ChangeSearchTypeSuccess(
      {required SearchProductState state, required super.searchType})
      : super(
          products: state.products,
          pageInfo: state.pageInfo,
          searchValue: state.searchValue,
        );
}

final class GetProductsSuccess extends SearchProductState {
  final String? searchText;

  GetProductsSuccess({
    required SearchProductState state,
    required super.products,
    required super.pageInfo,
    required this.searchText,
  }) : super(
          searchType: state.searchType,
          searchValue: searchText ?? state.searchValue,
        );
}

final class GetWarrantyProductsSuccess extends SearchProductState {
  final List<ProductModel> productsWarranty;
  GetWarrantyProductsSuccess(
      {required SearchProductState state, required this.productsWarranty})
      : super(
          searchType: state.searchType,
          products: state.products,
          pageInfo: state.pageInfo,
          searchValue: state.searchValue,
        );
}
