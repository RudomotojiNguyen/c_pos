part of 'affiliate_bloc.dart';

sealed class AffiliateState extends Equatable {
  final DateTime fromDate;
  final DateTime toDate;

  const AffiliateState({
    required this.fromDate,
    required this.toDate,
  });

  @override
  List<Object> get props => [fromDate, toDate];
}

final class AffiliateInitial extends AffiliateState {
  const AffiliateInitial({required super.fromDate, required super.toDate});
}

final class IsLoading extends AffiliateState {
  IsLoading({required AffiliateState state})
      : super(
          fromDate: state.fromDate,
          toDate: state.toDate,
        );
}

final class GetDetailError extends AffiliateState {
  GetDetailError({required AffiliateState state})
      : super(
          fromDate: state.fromDate,
          toDate: state.toDate,
        );
}

final class GetDetailSuccess extends AffiliateState {
  final RewardReportModel detail;

  GetDetailSuccess({required AffiliateState state, required this.detail})
      : super(
          fromDate: state.fromDate,
          toDate: state.toDate,
        );
}

final class UpdateFilterSuccess extends AffiliateState {
  const UpdateFilterSuccess({required super.fromDate, required super.toDate});
}

///--- start commission detail ---///
final class GetCommissionDetailSuccess extends AffiliateState {
  final CommissionDetailModel? detail;

  GetCommissionDetailSuccess(
      {required AffiliateState state, required this.detail})
      : super(
          fromDate: state.fromDate,
          toDate: state.toDate,
        );
}

final class GetCommissionDetailLoading extends AffiliateState {
  GetCommissionDetailLoading({required AffiliateState state})
      : super(
          fromDate: state.fromDate,
          toDate: state.toDate,
        );
}

///--- start commission detail ---///
