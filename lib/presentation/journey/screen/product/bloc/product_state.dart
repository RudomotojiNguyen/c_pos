part of 'product_bloc.dart';

sealed class ProductState extends Equatable {
  final List<ImeiHistoryModel> listImeiHistory;
  final BaseLoadingInfoModel baseLoadingInfo;
  final FilterImeiHistoryModel filterImeiHistory;

  const ProductState({
    required this.listImeiHistory,
    required this.baseLoadingInfo,
    required this.filterImeiHistory,
  });

  @override
  List<Object?> get props => [
        listImeiHistory,
        baseLoadingInfo,
      ];
}

final class ProductInitial extends ProductState {
  const ProductInitial({
    required super.listImeiHistory,
    required super.baseLoadingInfo,
    required super.filterImeiHistory,
  });
}

final class UpdateFilterSuccess extends ProductState {
  UpdateFilterSuccess({
    required ProductState state,
    required super.filterImeiHistory,
  }) : super(
          listImeiHistory: state.listImeiHistory,
          baseLoadingInfo: state.baseLoadingInfo,
        );
}

final class GetDataImeiHistorySuccess extends ProductState {
  GetDataImeiHistorySuccess({
    required ProductState state,
    required super.listImeiHistory,
    required super.baseLoadingInfo,
  }) : super(
          filterImeiHistory: state.filterImeiHistory,
        );
}

final class IsLoading extends ProductState {
  IsLoading({
    required ProductState state,
  }) : super(
          baseLoadingInfo: state.baseLoadingInfo,
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
  }) : super(
          baseLoadingInfo: state.baseLoadingInfo,
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
          baseLoadingInfo: state.baseLoadingInfo,
          filterImeiHistory: state.filterImeiHistory,
          listImeiHistory: state.listImeiHistory,
        );
}
