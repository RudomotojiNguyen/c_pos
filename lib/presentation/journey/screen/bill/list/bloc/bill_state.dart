part of 'bill_bloc.dart';

@immutable
sealed class BillState extends Equatable {
  final List<BillModel> bills;

  final BaseLoadingInfoModel loadingInfo;
  final FilterBillModel filterInfo;

  final BillModel? billDetail;
  final bool? isLoading;

  const BillState({
    required this.bills,
    required this.loadingInfo,
    required this.filterInfo,
    this.billDetail,
    this.isLoading,
  });

  @override
  List<Object?> get props => [
        bills,
        loadingInfo,
        filterInfo,
        billDetail,
        isLoading,
      ];
}

final class BillInitial extends BillState {
  const BillInitial({
    required super.bills,
    required super.loadingInfo,
    required super.filterInfo,
  });
}

final class GetBillSuccess extends BillState {
  GetBillSuccess({
    required BillState state,
    required super.bills,
    required super.loadingInfo,
    bool? canLoadMore,
  }) : super(
          filterInfo: state.filterInfo,
        );
}

final class UpdateLoading extends BillState {
  UpdateLoading({
    required BillState state,
  }) : super(
          bills: state.bills,
          loadingInfo: state.loadingInfo,
          filterInfo: state.filterInfo,
        );
}

final class UpdateLoadMore extends BillState {
  UpdateLoadMore({
    required BillState state,
  }) : super(
          bills: state.bills,
          loadingInfo: state.loadingInfo,
          filterInfo: state.filterInfo,
        );
}

final class FilterBillSuccess extends BillState {
  FilterBillSuccess({
    required BillState state,
    required super.filterInfo,
  }) : super(
          bills: state.bills,
          loadingInfo: state.loadingInfo,
        );
}

final class UpdateSearchTypeSuccess extends BillState {
  UpdateSearchTypeSuccess({
    required BillState state,
    required super.filterInfo,
  }) : super(
          bills: state.bills,
          loadingInfo: state.loadingInfo,
        );
}

final class GetBillDetailSuccess extends BillState {
  GetBillDetailSuccess({
    required BillState state,
    required super.billDetail,
  }) : super(
          isLoading: state.isLoading,
          bills: state.bills,
          loadingInfo: state.loadingInfo,
          filterInfo: state.filterInfo,
        );
}

final class GetDataError extends BillState {
  GetDataError({
    required BillState state,
  }) : super(
    isLoading: state.isLoading,
    bills: state.bills,
    loadingInfo: state.loadingInfo,
    filterInfo: state.filterInfo,
  );
}
