part of 'voucher_bloc.dart';

sealed class VoucherEvent {}

final class GetVoucherEvent extends VoucherEvent {
  final String productId;
  final double productAmount;
  final int? storeId;
  final String? customerPhone;

  GetVoucherEvent({
    required this.productId,
    required this.productAmount,
    this.storeId,
    this.customerPhone,
  });
}
