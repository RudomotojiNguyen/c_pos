part of 'customer_bloc.dart';

@immutable
sealed class CustomerState extends Equatable {
  final List<CustomerModel> customers;
  final int currentPage;
  final int limit;
  final bool isLoading;
  final bool isLoadMore;
  final bool canLoadMore;

  const CustomerState({
    required this.customers,
    required this.currentPage,
    required this.limit,
    required this.isLoading,
    required this.isLoadMore,
    required this.canLoadMore,
  });

  @override
  List<Object?> get props => [
        customers,
        currentPage,
        limit,
        isLoading,
        isLoadMore,
        canLoadMore,
      ];
}

final class CustomerInitial extends CustomerState {
  const CustomerInitial({
    required super.customers,
    required super.currentPage,
    required super.limit,
    required super.isLoading,
    required super.isLoadMore,
    required super.canLoadMore,
  });
}

final class GetCustomersSuccess extends CustomerState {
  GetCustomersSuccess({
    required CustomerState state,
    required super.customers,
    required super.currentPage,
    required super.canLoadMore,
    int? limit,
  }) : super(
          limit: limit ?? state.limit,
          isLoading: state.isLoading,
          isLoadMore: state.isLoadMore,
        );
}

final class UpdateIsLoading extends CustomerState {
  UpdateIsLoading({required CustomerState state, required super.isLoading})
      : super(
          limit: state.limit,
          currentPage: state.currentPage,
          canLoadMore: state.canLoadMore,
          isLoadMore: state.isLoadMore,
          customers: state.customers,
        );
}

final class GetCustomerStatisticSuccess extends CustomerState {
  final CustomerTypeModel? customerType;

  GetCustomerStatisticSuccess({required CustomerState state, this.customerType})
      : super(
          isLoading: state.isLoading,
          limit: state.limit,
          currentPage: state.currentPage,
          canLoadMore: state.canLoadMore,
          isLoadMore: state.isLoadMore,
          customers: state.customers,
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
          isLoading: state.isLoading,
          limit: state.limit,
          currentPage: state.currentPage,
          canLoadMore: state.canLoadMore,
          isLoadMore: state.isLoadMore,
          customers: state.customers,
        );
}

final class GetWarrantyOTPSuccess extends CustomerState {
  final String otp;

  GetWarrantyOTPSuccess({required CustomerState state, required this.otp})
      : super(
          isLoading: state.isLoading,
          limit: state.limit,
          currentPage: state.currentPage,
          canLoadMore: state.canLoadMore,
          isLoadMore: state.isLoadMore,
          customers: state.customers,
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
          isLoading: state.isLoading,
          limit: state.limit,
          currentPage: state.currentPage,
          canLoadMore: state.canLoadMore,
          isLoadMore: state.isLoadMore,
          customers: state.customers,
        );
}

final class GetCustomerDetailSuccess extends CustomerState {
  final CustomerModel customer;

  GetCustomerDetailSuccess({
    required CustomerState state,
    required this.customer,
  }) : super(
          limit: state.limit,
          currentPage: state.currentPage,
          canLoadMore: state.canLoadMore,
          isLoadMore: state.isLoadMore,
          customers: state.customers,
          isLoading: state.isLoading,
        );
}
