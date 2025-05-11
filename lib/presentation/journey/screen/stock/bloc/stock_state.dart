part of 'stock_bloc.dart';

@immutable
sealed class StockState extends Equatable {
  final List<StockModel> productStocks;
  final List<ProductModel> products;
  final PageInfoEntity pageInfo;
  final FilterProductStockModel productStockFilter;

  const StockState({
    required this.productStocks,
    required this.products,
    required this.pageInfo,
    required this.productStockFilter,
  });

  @override
  List<Object?> get props => [
        productStocks,
        pageInfo,
        products,
        productStockFilter,
      ];
}

final class StockInitial extends StockState {
  const StockInitial({
    required super.productStocks,
    required super.products,
    required super.pageInfo,
    required super.productStockFilter,
  });
}

final class GetStockOfProductSuccess extends StockState {
  GetStockOfProductSuccess(
      {required StockState state, required super.productStocks})
      : super(
          products: state.products,
          pageInfo: state.pageInfo,
          productStockFilter: state.productStockFilter,
        );
}

final class StockIsLoading extends StockState {
  StockIsLoading({required StockState state})
      : super(
          productStocks: state.productStocks,
          products: state.products,
          pageInfo: state.pageInfo,
          productStockFilter: state.productStockFilter,
        );
}

final class StockIsLoadMore extends StockState {
  StockIsLoadMore({required StockState state})
      : super(
          productStocks: state.productStocks,
          products: state.products,
          pageInfo: state.pageInfo,
          productStockFilter: state.productStockFilter,
        );
}

final class GetProductsSuccess extends StockState {
  GetProductsSuccess({
    required StockState state,
    required super.products,
    required super.pageInfo,
  }) : super(
          productStocks: state.productStocks,
          productStockFilter: state.productStockFilter,
        );
}

final class UpdateFilterSuccess extends StockState {
  UpdateFilterSuccess(
      {required StockState state, required super.productStockFilter})
      : super(
          productStocks: state.productStocks,
          pageInfo: state.pageInfo,
          products: state.products,
        );
}
