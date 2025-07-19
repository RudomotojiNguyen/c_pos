part of 'global_core_bloc.dart';

@immutable
sealed class GlobalCoreState extends Equatable {
  final List<BaseEnumModel> orderStatus;
  final List<BaseEnumModel> cancelStatus;
  final List<BaseEnumModel> orderType;
  final List<BaseEnumModel> orderSource;

  const GlobalCoreState({
    required this.orderStatus,
    required this.orderSource,
    required this.cancelStatus,
    required this.orderType,
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
        );
}
