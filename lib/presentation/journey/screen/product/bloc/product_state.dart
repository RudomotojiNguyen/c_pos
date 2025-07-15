part of 'product_bloc.dart';

sealed class ProductState extends Equatable {
  final List<ImeiHistoryModel> listImeiHistory;
  final PageInfoEntity pageInfo;
  final FilterImeiHistoryModel filterImeiHistory;

  const ProductState({
    required this.listImeiHistory,
    required this.pageInfo,
    required this.filterImeiHistory,
  });

  @override
  List<Object?> get props => [
        listImeiHistory,
        pageInfo,
      ];
}

final class ProductInitial extends ProductState {
  const ProductInitial({
    required super.listImeiHistory,
    required super.pageInfo,
    required super.filterImeiHistory,
  });
}

final class UpdateFilterSuccess extends ProductState {
  UpdateFilterSuccess({
    required ProductState state,
    required super.filterImeiHistory,
  }) : super(
          listImeiHistory: state.listImeiHistory,
          pageInfo: state.pageInfo,
        );
}

final class GetDataImeiHistorySuccess extends ProductState {
  GetDataImeiHistorySuccess({
    required ProductState state,
    required super.listImeiHistory,
    required super.pageInfo,
  }) : super(
          filterImeiHistory: state.filterImeiHistory,
        );
}

final class IsLoading extends ProductState {
  IsLoading({
    required ProductState state,
  }) : super(
          pageInfo: state.pageInfo,
          filterImeiHistory: state.filterImeiHistory,
          listImeiHistory: state.listImeiHistory,
        );
}

/// transaction imei
final class GetImeiTransactionSuccess extends ProductState {
  final List<ImeiTransactionModel> listImeiTransaction;

  GetImeiTransactionSuccess({
    required ProductState state,
    required this.listImeiTransaction,
    required super.pageInfo,
  }) : super(
          filterImeiHistory: state.filterImeiHistory,
          listImeiHistory: state.listImeiHistory,
        );
}

final class GetTradeinTransactionSuccess extends ProductState {
  final List<TradeInTransactionModel> listTradeinTransaction;

  GetTradeinTransactionSuccess({
    required ProductState state,
    required this.listTradeinTransaction,
  }) : super(
          pageInfo: state.pageInfo,
          filterImeiHistory: state.filterImeiHistory,
          listImeiHistory: state.listImeiHistory,
        );
}

/// start imei fifo
final class OnLoadingGetProductImei extends ProductState {
  OnLoadingGetProductImei({
    required ProductState state,
  }) : super(
          pageInfo: state.pageInfo,
          filterImeiHistory: state.filterImeiHistory,
          listImeiHistory: state.listImeiHistory,
        );
}

final class GetProductImeiDataSuccess extends ProductState {
  final ProductImeiModel? obsoleteImei;
  final List<ProductImeiModel>? productListImei;
  final List<ProductImeiModel>? productsImeiSearchText;

  GetProductImeiDataSuccess({
    required ProductState state,
    required this.obsoleteImei,
    required this.productListImei,
    required this.productsImeiSearchText,
  }) : super(
          pageInfo: state.pageInfo,
          filterImeiHistory: state.filterImeiHistory,
          listImeiHistory: state.listImeiHistory,
        );
}

/// end imei fifo

/// start reason select imei
final class OnLoadingGetReasonSelectImei extends ProductState {
  OnLoadingGetReasonSelectImei({
    required ProductState state,
  }) : super(
          pageInfo: state.pageInfo,
          filterImeiHistory: state.filterImeiHistory,
          listImeiHistory: state.listImeiHistory,
        );
}

final class GetReasonSelectImeiSuccess extends ProductState {
  final List<String> reasons;

  GetReasonSelectImeiSuccess({
    required ProductState state,
    required this.reasons,
  }) : super(
          pageInfo: state.pageInfo,
          filterImeiHistory: state.filterImeiHistory,
          listImeiHistory: state.listImeiHistory,
        );
}
