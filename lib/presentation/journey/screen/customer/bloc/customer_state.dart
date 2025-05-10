part of 'customer_bloc.dart';

@immutable
sealed class CustomerState extends Equatable {
  final List<CustomerModel> customers;
  final PageInfoEntity pageInfo;

  const CustomerState({
    required this.customers,
    required this.pageInfo,
  });

  @override
  List<Object?> get props => [
        customers,
        pageInfo,
      ];
}

final class CustomerInitial extends CustomerState {
  const CustomerInitial({
    required super.customers,
    required super.pageInfo,
  });
}

/// start get customers
final class GetCustomersSuccess extends CustomerState {
  const GetCustomersSuccess({
    required CustomerState state,
    required super.customers,
    required super.pageInfo,
  }) : super();
}

final class IsLoadingGetCustomers extends CustomerState {
  IsLoadingGetCustomers({
    required CustomerState state,
  }) : super(
          customers: state.customers,
          pageInfo: state.pageInfo,
        );
}

/// end get customers

final class UpdateIsLoading extends CustomerState {
  UpdateIsLoading({required CustomerState state})
      : super(
          customers: state.customers,
          pageInfo: state.pageInfo,
        );
}

final class GetCustomerStatisticSuccess extends CustomerState {
  final CustomerTypeModel? customerType;

  GetCustomerStatisticSuccess({
    required CustomerState state,
    this.customerType,
  }) : super(
          customers: state.customers,
          pageInfo: state.pageInfo,
        );
}

final class GetOTPSuccess extends CustomerState {
  final String otp;
  final CustomerModel? customerInfo;

  GetOTPSuccess({
    required CustomerState state,
    required this.otp,
    this.customerInfo,
  }) : super(
          customers: state.customers,
          pageInfo: state.pageInfo,
        );
}

final class CheckOTPSuccess extends CustomerState {
  final double amount;
  final int point;

  CheckOTPSuccess({
    required CustomerState state,
    required this.amount,
    required this.point,
  }) : super(
          customers: state.customers,
          pageInfo: state.pageInfo,
        );
}

/// start customer detail
final class GetCustomerDetailSuccess extends CustomerState {
  final CustomerModel customer;

  GetCustomerDetailSuccess({
    required CustomerState state,
    required this.customer,
  }) : super(
          customers: state.customers,
          pageInfo: state.pageInfo,
        );
}

final class IsLoadingCustomerDetail extends CustomerState {
  IsLoadingCustomerDetail({required CustomerState state})
      : super(
          customers: state.customers,
          pageInfo: state.pageInfo,
        );
}

/// end
