part of 'payment_bloc.dart';

@immutable
sealed class PaymentState extends Equatable {
  final List<AccountantModel> cashAccountants;
  final List<AccountantModel> transferAccountants;
  final List<AccountantModel> creditAccountants;
  final List<InstallmentAccountingModel> installmentAccountants;
  final List<EnumModel> paymentMethodsEnum;

  const PaymentState({
    required this.cashAccountants,
    required this.transferAccountants,
    required this.creditAccountants,
    required this.installmentAccountants,
    required this.paymentMethodsEnum,
  });

  @override
  List<Object?> get props => [
        cashAccountants,
        transferAccountants,
        creditAccountants,
        installmentAccountants,
        paymentMethodsEnum,
      ];
}

final class PaymentInitial extends PaymentState {
  const PaymentInitial(
      {required super.cashAccountants,
      required super.transferAccountants,
      required super.creditAccountants,
      required super.installmentAccountants,
      required super.paymentMethodsEnum});
}

final class IsLoading extends PaymentState {
  final bool isLoading;

  IsLoading({
    required PaymentState state,
    required this.isLoading,
  }) : super(
          transferAccountants: state.transferAccountants,
          creditAccountants: state.creditAccountants,
          installmentAccountants: state.installmentAccountants,
          paymentMethodsEnum: state.paymentMethodsEnum,
          cashAccountants: state.cashAccountants,
        );
}

final class UpdateCashAccountant extends PaymentState {
  UpdateCashAccountant({
    required PaymentState state,
    required super.cashAccountants,
  }) : super(
          transferAccountants: state.transferAccountants,
          creditAccountants: state.creditAccountants,
          installmentAccountants: state.installmentAccountants,
          paymentMethodsEnum: state.paymentMethodsEnum,
        );
}

final class UpdateInstallmentAccountant extends PaymentState {
  UpdateInstallmentAccountant({
    required PaymentState state,
    required super.installmentAccountants,
  }) : super(
          transferAccountants: state.transferAccountants,
          creditAccountants: state.creditAccountants,
          cashAccountants: state.cashAccountants,
          paymentMethodsEnum: state.paymentMethodsEnum,
        );
}

final class UpdateCreditAccountant extends PaymentState {
  UpdateCreditAccountant({
    required PaymentState state,
    required super.creditAccountants,
  }) : super(
          transferAccountants: state.transferAccountants,
          installmentAccountants: state.installmentAccountants,
          paymentMethodsEnum: state.paymentMethodsEnum,
          cashAccountants: state.cashAccountants,
        );
}

final class UpdateTransferAccountant extends PaymentState {
  UpdateTransferAccountant({
    required PaymentState state,
    required super.transferAccountants,
  }) : super(
          creditAccountants: state.creditAccountants,
          installmentAccountants: state.installmentAccountants,
          paymentMethodsEnum: state.paymentMethodsEnum,
          cashAccountants: state.cashAccountants,
        );
}

final class UpdatePaymentEnum extends PaymentState {
  UpdatePaymentEnum({
    required PaymentState state,
    required super.paymentMethodsEnum,
  }) : super(
          creditAccountants: state.creditAccountants,
          installmentAccountants: state.installmentAccountants,
          transferAccountants: state.transferAccountants,
          cashAccountants: state.cashAccountants,
        );
}
