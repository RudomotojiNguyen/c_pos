part of 'order_bloc.dart';

@immutable
sealed class OrderState extends Equatable {
  final List<OrderModel> orders;

  final PageInfoEntity pageInfo;
  final OrderFilterModel orderFilter;

  const OrderState({
    required this.orders,
    required this.orderFilter,
    required this.pageInfo,
  });

  @override
  List<Object?> get props => [
        orders,
        pageInfo,
        orderFilter,
      ];
}

final class OrderInitial extends OrderState {
  const OrderInitial({
    required super.orders,
    required super.pageInfo,
    required super.orderFilter,
  });
}

final class GetOrderSuccess extends OrderState {
  GetOrderSuccess({
    required OrderState state,
    required super.orders,
    required super.pageInfo,
  }) : super(
          orderFilter: state.orderFilter,
        );
}

final class UpdateLoading extends OrderState {
  UpdateLoading({
    required OrderState state,
  }) : super(
          orders: state.orders,
          pageInfo: state.pageInfo,
          orderFilter: state.orderFilter,
        );
}

final class UpdateLoadMore extends OrderState {
  UpdateLoadMore({
    required OrderState state,
  }) : super(
          orders: state.orders,
          pageInfo: state.pageInfo,
          orderFilter: state.orderFilter,
        );
}

final class UpdateSearchTypeSuccess extends OrderState {
  UpdateSearchTypeSuccess({
    required OrderState state,
    required super.orderFilter,
  }) : super(
          orders: state.orders,
          pageInfo: state.pageInfo,
        );
}

final class FilterOrderSuccess extends OrderState {
  FilterOrderSuccess({
    required OrderState state,
    required super.orderFilter,
  }) : super(
          orders: state.orders,
          pageInfo: state.pageInfo,
        );
}

final class GetOrderDetailSuccess extends OrderState {
  final OrderModel orderDetail;

  GetOrderDetailSuccess({
    required OrderState state,
    required this.orderDetail,
  }) : super(
          orders: state.orders,
          pageInfo: state.pageInfo,
          orderFilter: state.orderFilter,
        );
}

final class GetDataError extends OrderState {
  GetDataError({
    required OrderState state,
  }) : super(
          orders: state.orders,
          pageInfo: state.pageInfo,
          orderFilter: state.orderFilter,
        );
}
