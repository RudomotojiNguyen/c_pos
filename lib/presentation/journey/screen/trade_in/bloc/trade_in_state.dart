part of 'trade_in_bloc.dart';

@immutable
sealed class TradeInState extends Equatable {
  final List<TradeInModel> tradeIns;

  final PageInfoEntity pageInfoEntity;
  final FilterTradeInModel filterInfo;
  final List<TradeInProgramCriteriaGroupModel> tradeInProgramCriteriaGroup;

  const TradeInState({
    required this.tradeIns,
    required this.pageInfoEntity,
    required this.filterInfo,
    required this.tradeInProgramCriteriaGroup,
  });

  @override
  List<Object?> get props => [
        tradeIns,
        filterInfo,
        pageInfoEntity,
        tradeInProgramCriteriaGroup,
      ];
}

final class TradeInInitial extends TradeInState {
  const TradeInInitial({
    required super.tradeIns,
    required super.filterInfo,
    required super.pageInfoEntity,
    required super.tradeInProgramCriteriaGroup,
  });
}

final class IsCriteriaLoading extends TradeInState {
  IsCriteriaLoading({required TradeInState state})
      : super(
          tradeIns: state.tradeIns,
          pageInfoEntity: state.pageInfoEntity,
          filterInfo: state.filterInfo,
          tradeInProgramCriteriaGroup: state.tradeInProgramCriteriaGroup,
        );
}

final class IsLoadMore extends TradeInState {
  IsLoadMore({required TradeInState state})
      : super(
          tradeIns: state.tradeIns,
          pageInfoEntity: state.pageInfoEntity,
          filterInfo: state.filterInfo,
          tradeInProgramCriteriaGroup: state.tradeInProgramCriteriaGroup,
        );
}

final class GetTradeInDataSuccess extends TradeInState {
  GetTradeInDataSuccess({
    required TradeInState state,
    required super.tradeIns,
    required super.pageInfoEntity,
  }) : super(
          filterInfo: state.filterInfo,
          tradeInProgramCriteriaGroup: state.tradeInProgramCriteriaGroup,
        );
}

final class UpdateFilterSuccess extends TradeInState {
  UpdateFilterSuccess({
    required TradeInState state,
    required super.filterInfo,
  }) : super(
          tradeIns: state.tradeIns,
          pageInfoEntity: state.pageInfoEntity,
          tradeInProgramCriteriaGroup: state.tradeInProgramCriteriaGroup,
        );
}

final class UpdateDefaultFilterSuccess extends TradeInState {
  UpdateDefaultFilterSuccess({
    required TradeInState state,
    required super.filterInfo,
  }) : super(
          tradeIns: state.tradeIns,
          pageInfoEntity: state.pageInfoEntity,
          tradeInProgramCriteriaGroup: state.tradeInProgramCriteriaGroup,
        );
}

/// Detail data
final class GetTradeInDetailSuccess extends TradeInState {
  final TradeInModel tradeIndDetail;

  GetTradeInDetailSuccess(
      {required TradeInState state, required this.tradeIndDetail})
      : super(
          tradeIns: state.tradeIns,
          pageInfoEntity: state.pageInfoEntity,
          filterInfo: state.filterInfo,
          tradeInProgramCriteriaGroup: state.tradeInProgramCriteriaGroup,
        );
}

final class GetImageVerifySuccess extends TradeInState {
  final List<ImageDetailModel> images;

  GetImageVerifySuccess({required TradeInState state, required this.images})
      : super(
          tradeIns: state.tradeIns,
          pageInfoEntity: state.pageInfoEntity,
          filterInfo: state.filterInfo,
          tradeInProgramCriteriaGroup: state.tradeInProgramCriteriaGroup,
        );
}

final class GetDetailError extends TradeInState {
  GetDetailError({required TradeInState state})
      : super(
          tradeIns: state.tradeIns,
          pageInfoEntity: state.pageInfoEntity,
          filterInfo: state.filterInfo,
          tradeInProgramCriteriaGroup: state.tradeInProgramCriteriaGroup,
        );
}

final class SearchProductsSuccess extends TradeInState {
  final List<ProductModel> products;

  SearchProductsSuccess({
    required TradeInState state,
    required this.products,
  }) : super(
          tradeIns: state.tradeIns,
          pageInfoEntity: state.pageInfoEntity,
          filterInfo: state.filterInfo,
          tradeInProgramCriteriaGroup: state.tradeInProgramCriteriaGroup,
        );
}

final class GetProgramCriteriaSuccess extends TradeInState {
  GetProgramCriteriaSuccess({
    required TradeInState state,
    required super.tradeInProgramCriteriaGroup,
  }) : super(
          tradeIns: state.tradeIns,
          pageInfoEntity: state.pageInfoEntity,
          filterInfo: state.filterInfo,
        );
}

final class GetProgramCriteriaError extends TradeInState {
  GetProgramCriteriaError({
    required TradeInState state,
  }) : super(
          tradeIns: state.tradeIns,
          pageInfoEntity: state.pageInfoEntity,
          filterInfo: state.filterInfo,
          tradeInProgramCriteriaGroup: [],
        );
}
