part of 'stock_bloc.dart';

@immutable
sealed class StockState extends Equatable {
  final List<StockModel> productStocks;
  final List<ProductModel> products;
  final BaseLoadingInfoModel loadingInfo;
  final FilterProductStockModel productStockFilter;

  const StockState({
    required this.productStocks,
    required this.products,
    required this.loadingInfo,
    required this.productStockFilter,
  });

  @override
  List<Object?> get props => [
        productStocks,
        loadingInfo,
        products,
        productStockFilter,
      ];
}

final class StockInitial extends StockState {
  const StockInitial({
    required super.productStocks,
    required super.products,
    required super.loadingInfo,
    required super.productStockFilter,
  });
}

final class GetStockOfProductSuccess extends StockState {
  GetStockOfProductSuccess(
      {required StockState state, required super.productStocks})
      : super(
          products: state.products,
          loadingInfo: state.loadingInfo,
          productStockFilter: state.productStockFilter,
        );
}

final class StockIsLoading extends StockState {
  StockIsLoading({required StockState state})
      : super(
          productStocks: state.productStocks,
          products: state.products,
          loadingInfo: state.loadingInfo,
          productStockFilter: state.productStockFilter,
        );
}

final class StockIsLoadMore extends StockState {
  StockIsLoadMore({required StockState state})
      : super(
          productStocks: state.productStocks,
          products: state.products,
          loadingInfo: state.loadingInfo,
          productStockFilter: state.productStockFilter,
        );
}

final class GetProductsSuccess extends StockState {
  GetProductsSuccess({
    required StockState state,
    required super.products,
    required super.loadingInfo,
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
          loadingInfo: state.loadingInfo,
          products: state.products,
        );
}
