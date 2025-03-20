part of 'coupon_bloc.dart';

@immutable
sealed class CouponEvent {}

final class SearchCouponEvent extends CouponEvent {
  final String? code;
  final int? customerId;
  final List<ProductTable> products;

  SearchCouponEvent({
    this.code,
    this.customerId,
    required this.products,
  });
}

final class CheckCouponEvent extends CouponEvent {
  final String code;
  final int? customerId;
  final List<ProductTable> products;

  CheckCouponEvent({
    required this.code,
    this.customerId,
    required this.products,
  });
}
