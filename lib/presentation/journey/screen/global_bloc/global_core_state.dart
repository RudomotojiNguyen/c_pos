part of 'global_core_bloc.dart';

@immutable
sealed class GlobalCoreState extends Equatable {
  final List<BaseEnumModel> orderStatus;
  final List<BaseEnumModel> cancelStatus;
  final List<BaseEnumModel> orderType;
  final List<BaseEnumModel> orderSource;
  final List<TicketTypeModel> ticketType;

  const GlobalCoreState({
    required this.orderStatus,
    required this.ticketType,
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
    required super.ticketType,
    required super.orderSource,
    required super.cancelStatus,
    required super.orderType,
  });
}

final class GetOrderStatusSuccess extends GlobalCoreState {
  GetOrderStatusSuccess({
    required GlobalCoreState state,
    required super.orderStatus,
    required super.cancelStatus,
    required super.orderType,
  }) : super(
          ticketType: state.ticketType,
          orderSource: state.orderSource,
        );
}

final class GetTicketTypeSuccess extends GlobalCoreState {
  GetTicketTypeSuccess({
    required GlobalCoreState state,
    required super.ticketType,
  }) : super(
          orderStatus: state.orderStatus,
          orderSource: state.orderSource,
          cancelStatus: state.cancelStatus,
          orderType: state.orderType,
        );
}

final class GetOrderSourceSuccess extends GlobalCoreState {
  GetOrderSourceSuccess({
    required GlobalCoreState state,
    required super.orderSource,
  }) : super(
          orderStatus: state.orderStatus,
          ticketType: state.ticketType,
          cancelStatus: state.cancelStatus,
          orderType: state.orderType,
        );
}
