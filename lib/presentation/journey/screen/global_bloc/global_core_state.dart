part of 'global_core_bloc.dart';

@immutable
sealed class GlobalCoreState extends Equatable {
  final List<BaseEnumModel> orderStatus;
  final List<BaseEnumModel> cancelStatus;
  final List<BaseEnumModel> orderType;
  final List<BaseEnumModel> orderSource;
  final List<CompanyModel> companies;

  const GlobalCoreState({
    required this.orderStatus,
    required this.orderSource,
    required this.cancelStatus,
    required this.orderType,
    required this.companies,
  });

  @override
  List<Object?> get props =>
      [orderStatus, orderSource, cancelStatus, orderType];
}

final class GlobalCoreInitial extends GlobalCoreState {
  const GlobalCoreInitial({
    required super.orderStatus,
    required super.orderSource,
    required super.cancelStatus,
    required super.orderType,
    required super.companies,
  });
}

final class GetOrderSourceSuccess extends GlobalCoreState {
  GetOrderSourceSuccess({
    required GlobalCoreState state,
    required super.orderSource,
  }) : super(
          orderStatus: state.orderStatus,
          cancelStatus: state.cancelStatus,
          orderType: state.orderType,
          companies: state.companies,
        );
}

final class GetOrderTypeSuccess extends GlobalCoreState {
  GetOrderTypeSuccess({
    required GlobalCoreState state,
    required super.orderType,
  }) : super(
          orderStatus: state.orderStatus,
          cancelStatus: state.cancelStatus,
          orderSource: state.orderSource,
          companies: state.companies,
        );
}

final class GetOrderStatusSuccess extends GlobalCoreState {
  GetOrderStatusSuccess({
    required GlobalCoreState state,
    required super.orderStatus,
  }) : super(
          orderSource: state.orderSource,
          orderType: state.orderType,
          cancelStatus: state.cancelStatus,
          companies: state.companies,
        );
}

final class GetUserCompaniesSuccess extends GlobalCoreState {
  GetUserCompaniesSuccess({
    required GlobalCoreState state,
    required super.companies,
  }) : super(
          orderStatus: state.orderStatus,
          orderSource: state.orderSource,
          orderType: state.orderType,
          cancelStatus: state.cancelStatus,
        );
}
