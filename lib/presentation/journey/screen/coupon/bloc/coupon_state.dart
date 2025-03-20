part of 'coupon_bloc.dart';

@immutable
sealed class CouponState extends Equatable {
  final List<CouponModel> coupons;
  final double? discountAmount;

  const CouponState({
    required this.coupons,
    this.discountAmount,
  });

  @override
  List<Object?> get props => [coupons, discountAmount];
}

final class CouponInitial extends CouponState {
  const CouponInitial({required super.coupons});
}

final class IsLoading extends CouponState {
  IsLoading({required CouponState state}) : super(coupons: state.coupons);
}

final class UpdateCoupons extends CouponState {
  const UpdateCoupons({required CouponState state, required super.coupons})
      : super();
}

final class UpdateDiscountAmount extends CouponState {
  UpdateDiscountAmount(
      {required CouponState state, required super.discountAmount})
      : super(coupons: state.coupons);
}
