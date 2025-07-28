import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../common/enum/enum.dart';
import 'package:c_pos/data/models/models.dart';
import '../../../../../data/services/services.dart';
import '../../../../mixins/logger_helper.dart';

part 'order_event.dart';
part 'order_state.dart';

class OrderBloc extends Bloc<OrderEvent, OrderState> {
  final OrderServices orderServices;
  final LoggerHelper loggerHelper = LoggerHelper();

  OrderBloc({required this.orderServices})
      : super(OrderInitial(
          orders: const [],
          pageInfo: PageInfoEntity(),
          orderFilter: const OrderFilterModel(),
        )) {
    /// lấy danh sách đơn hàng
    on<GetOrderEvent>(_onGetOrder);

    /// lấy thêm đone
    on<GetMoreOrderEvent>(_onGetMoreOrder);

    /// cập nhật search text
    on<UpdateSearchTypeEvent>(_updateSearchType);

    /// cập nhật filter
    on<FilterOrderEvent>(_onFilter);

    /// đặt filter mặc định
    on<SetDefaultFilterEvent>(_onSetDefaultFilter);

    /// lấy thông tin chi tiết đơn
    on<GetOrderDetailEvent>(_onGetOrderDetail);
  }

  FutureOr<void> _onGetOrderDetail(
      GetOrderDetailEvent event, Emitter<OrderState> emit) async {
    try {
      emit(UpdateLoading(state: state));
      final res = await orderServices.getOrderDetail(event.orderId);
      emit(GetOrderDetailSuccess(state: state, orderDetail: res));
    } catch (e) {
      emit(GetDataError(state: state));
      loggerHelper.logError(message: 'GetOrderDetailEvent', obj: e);
    }
  }

  FutureOr<void> _onSetDefaultFilter(
      SetDefaultFilterEvent event, Emitter<OrderState> emit) async {
    try {
      emit(FilterOrderSuccess(
        state: state,
        orderFilter: const OrderFilterModel(),
      ));
    } catch (e) {
      loggerHelper.logError(message: 'FilterOrderEvent', obj: e);
    }
  }

  FutureOr<void> _onFilter(
      FilterOrderEvent event, Emitter<OrderState> emit) async {
    try {
      emit(FilterOrderSuccess(
          state: state,
          orderFilter: state.orderFilter.copyWidth(
            status: event.status,
            employee: event.employee,
            fromDay: event.fromDay,
            toDay: event.toDay,
            searchValue: event.searchValue,
            store: event.store,
            searchType: event.searchType,
          )));
    } catch (e) {
      loggerHelper.logError(message: 'FilterOrderEvent', obj: e);
    }
  }

  FutureOr<void> _onGetOrder(
      GetOrderEvent event, Emitter<OrderState> emit) async {
    try {
      emit(UpdateLoading(state: state));

      final PaginatedResponse<OrderModel> res = await _getOrders(
        page: 1,
        limit: state.pageInfo.getLimit,
        createdBy: state.orderFilter.getCreatedBy,
        searchStores: state.orderFilter.getStores,
        searchPhone: state.orderFilter.getSearchValueByPhone,
        orderId: state.orderFilter.getSearchValueByOrderId,
        searchFromDay: state.orderFilter.getSearchFromDay,
        searchToDay: state.orderFilter.getSearchToDay,
        searchStatuses: state.orderFilter.getStatuses,
      );

      emit(GetOrderSuccess(
        state: state,
        orders: res.items,
        pageInfo: state.pageInfo.copyWith(
          page: 1,
          itemCount: res.items.length,
        ),
      ));
    } catch (e) {
      loggerHelper.logError(message: 'GetOrderEvent', obj: e);
    }
  }

  FutureOr<void> _updateSearchType(
      UpdateSearchTypeEvent event, Emitter<OrderState> emit) async {
    emit(UpdateSearchTypeSuccess(
      state: state,
      orderFilter: state.orderFilter.updateSearchType(
        searchType: event.searchType,
      ),
    ));
  }

  FutureOr<void> _onGetMoreOrder(
      GetMoreOrderEvent event, Emitter<OrderState> emit) async {
    try {
      if (state is UpdateLoading || state is UpdateLoadMore) {
        return;
      }
      int page = state.pageInfo.getNextPage;
      emit(UpdateLoadMore(state: state));

      final res = await _getOrders(
        page: page,
        limit: state.pageInfo.getLimit,
        createdBy: state.orderFilter.getCreatedBy,
        searchStores: state.orderFilter.getStores,
        searchPhone: state.orderFilter.getSearchValueByPhone,
        orderId: state.orderFilter.getSearchValueByOrderId,
        searchFromDay: state.orderFilter.getSearchFromDay,
        searchToDay: state.orderFilter.getSearchToDay,
        searchStatuses: state.orderFilter.getStatuses,
      );

      emit(GetOrderSuccess(
        state: state,
        orders: [...state.orders, ...res.items],
        pageInfo: state.pageInfo.copyWith(
          page: page,
          itemCount: res.items.length,
        ),
      ));
    } catch (e) {
      loggerHelper.logError(message: 'UpdateSearchTypeEvent', obj: e);
    }
  }

  ///

  Future<PaginatedResponse<OrderModel>> _getOrders({
    required int limit,
    required int page,
    String? orderId,
    int? createdBy,
    List<StoreModel>? searchStores,
    List<int>? searchStatuses,
    String? searchPhone,
    String? searchFromDay,
    String? searchToDay,
  }) async {
    return await orderServices.getOrders(
      page: page,
      size: limit,
      createdBy: createdBy,
      searchStores: searchStores,
      searchStatuses: searchStatuses,
      searchPhone: searchPhone,
      searchFromDay: searchFromDay,
      searchToDay: searchToDay,
      tabName: 'all',
      orderId: orderId,
    );
  }
}
