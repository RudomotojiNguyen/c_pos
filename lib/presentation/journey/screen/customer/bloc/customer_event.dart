part of 'customer_bloc.dart';

@immutable
sealed class CustomerEvent {}

final class GetCustomerByPhoneEvent extends CustomerEvent {
  final String? phone;

  GetCustomerByPhoneEvent(this.phone);
}

final class GetCustomerByIdEvent extends CustomerEvent {
  final int customerId;

  GetCustomerByIdEvent(this.customerId);
}

final class OnchangeTextEvent extends CustomerEvent {}

final class GetOTPEvent extends CustomerEvent {
  final String customerPhone;
  final int? customerId;
  final int? point;
  final DiscountMemberType type;

  GetOTPEvent({
    required this.type,
    this.customerId,
    required this.customerPhone,
    this.point,
  });
}

final class CheckOTPEvent extends CustomerEvent {
  final String otpCode;
  final int customerId;
  final int? pointUse;
  final DiscountMemberType type;

  CheckOTPEvent({
    required this.type,
    required this.otpCode,
    required this.customerId,
    this.pointUse,
  });
}

final class UpdateCustomerEvent extends CustomerEvent {
  final CustomerModel customer;

  UpdateCustomerEvent(this.customer);
}
