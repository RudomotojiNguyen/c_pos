part of 'affiliate_bloc.dart';

sealed class AffiliateEvent {}

final class UpdateFilterEvent extends AffiliateEvent {
  final DateTime fromDate;
  final DateTime toDate;

  UpdateFilterEvent({
    required this.fromDate,
    required this.toDate,
  });
}

final class GetRewardEvent extends AffiliateEvent {}

final class GetCommissionDetailEvent extends AffiliateEvent {
  final DateTime fromDate;
  final DateTime toDate;
  final int roleId;
  final List<int> ids;

  GetCommissionDetailEvent({
    required this.ids,
    required this.roleId,
    required this.toDate,
    required this.fromDate,
  });
}
