part of 'order_bloc.dart';

@immutable
sealed class OrderState extends Equatable {
  final List<OrderModel> orders;

  final BaseLoadingInfoModel loadingInfo;
  final OrderFilterModel orderFilter;

  const OrderState({
    required this.orders,
    required this.orderFilter,
    required this.loadingInfo,
  });

  @override
  List<Object?> get props => [
        orders,
        loadingInfo,
        orderFilter,
      ];
}

final class OrderInitial extends OrderState {
  const OrderInitial({
    required super.orders,
    required super.loadingInfo,
    required super.orderFilter,
  });
}

final class GetOrderSuccess extends OrderState {
  GetOrderSuccess({
    required OrderState state,
    required super.orders,
    required super.loadingInfo,
  }) : super(
          orderFilter: state.orderFilter,
        );
}

final class UpdateLoading extends OrderState {
  UpdateLoading({
    required OrderState state,
  }) : super(
          orders: state.orders,
          loadingInfo: state.loadingInfo,
          orderFilter: state.orderFilter,
        );
}

final class UpdateLoadMore extends OrderState {
  UpdateLoadMore({
    required OrderState state,
  }) : super(
          orders: state.orders,
          loadingInfo: state.loadingInfo,
          orderFilter: state.orderFilter,
        );
}

final class UpdateSearchTypeSuccess extends OrderState {
  UpdateSearchTypeSuccess({
    required OrderState state,
    required super.orderFilter,
  }) : super(
          orders: state.orders,
          loadingInfo: state.loadingInfo,
        );
}

final class FilterOrderSuccess extends OrderState {
  FilterOrderSuccess({
    required OrderState state,
    required super.orderFilter,
  }) : super(
          orders: state.orders,
          loadingInfo: state.loadingInfo,
        );
}

final class GetOrderDetailSuccess extends OrderState {
  final OrderModel orderDetail;

  GetOrderDetailSuccess({
    required OrderState state,
    required this.orderDetail,
  }) : super(
          orders: state.orders,
          loadingInfo: state.loadingInfo,
          orderFilter: state.orderFilter,
        );
}

final class GetDataError extends OrderState {
  GetDataError({
    required OrderState state,
  }) : super(
          orders: state.orders,
          loadingInfo: state.loadingInfo,
          orderFilter: state.orderFilter,
        );
}
