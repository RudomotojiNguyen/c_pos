part of 'voucher_bloc.dart';

sealed class VoucherState extends Equatable {
  const VoucherState();

  @override
  List<Object> get props => [];
}

final class VoucherInitial extends VoucherState {}

/// start get voucher
final class GetVoucherLoading extends VoucherState {
  const GetVoucherLoading({required VoucherState state}) : super();
}

final class UpdateVouchersSuccess extends VoucherState {
  final List<VoucherModel> vouchers;
  const UpdateVouchersSuccess(
      {required VoucherState state, required this.vouchers})
      : super();
}

final class UpdateVouchersError extends VoucherState {
  final String error;
  const UpdateVouchersError({required VoucherState state, required this.error})
      : super();
}

/// end get voucher
