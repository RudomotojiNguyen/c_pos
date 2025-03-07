import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../common/enum/enum.dart';
import '../../../../../data/models/filter/base_loading_info_model.dart';
import '../../../../../data/models/filter/order_filter_model.dart';
import '../../../../../data/models/order_model.dart';
import '../../../../../data/models/store_model.dart';
import '../../../../../data/repository/order_repository.dart';
import '../../../../mixins/logger_helper.dart';

part 'order_event.dart';
part 'order_state.dart';

class OrderBloc extends Bloc<OrderEvent, OrderState> {
  final OrderRepository orderRepository;
  final LoggerHelper loggerHelper = LoggerHelper();

  OrderBloc({required this.orderRepository})
      : super(const OrderInitial(
          orders: [],
          loadingInfo: BaseLoadingInfoModel(),
          orderFilter: OrderFilterModel(),
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
      final res = await orderRepository.getOrderDetail(event.orderId);
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
            type: event.type,
            time: event.time,
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

      final res = await _getOrders(
        page: 1,
        limit: state.loadingInfo.limit,
        searchValue: state.orderFilter.searchValue,
        orderType: state.orderFilter.getOrderTypeValue,
        storeId: state.orderFilter.getStoreId,
        timeId: state.orderFilter.getTimeValue,
        type: state.orderFilter.getSearchTypeValue,
        status: state.orderFilter.getStatusValue,
      );

      emit(GetOrderSuccess(
        state: state,
        orders: res,
        loadingInfo: state.loadingInfo.copyWith(
          currentPage: 1,
          sizeDate: res.length,
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
      int page = state.loadingInfo.getNextPage;
      emit(UpdateLoadMore(state: state));

      final res = await _getOrders(
        page: page,
        limit: state.loadingInfo.limit,
        searchValue: state.orderFilter.searchValue,
        orderType: state.orderFilter.getOrderTypeValue,
        storeId: state.orderFilter.getStoreId,
        timeId: state.orderFilter.getTimeValue,
        type: state.orderFilter.getSearchTypeValue,
        status: state.orderFilter.getStatusValue,
      );

      emit(GetOrderSuccess(
        state: state,
        orders: [...state.orders, ...res],
        loadingInfo: state.loadingInfo.copyWith(
          sizeDate: res.length,
          currentPage: page,
        ),
      ));
    } catch (e) {
      loggerHelper.logError(message: 'UpdateSearchTypeEvent', obj: e);
    }
  }

  ///
  Future<List<OrderModel>> getOrders({
    required int page,
    required int size,
    required String id,
  }) async {
    try {
      final res = await _getOrders(
          page: 1,
          limit: size,
          searchValue: id,
          type: SearchType.orderId.getValue);
      return res;
    } catch (e) {
      rethrow;
    }
  }

  Future<List<OrderModel>> _getOrders({
    required int limit,
    required int page,
    String? searchValue,
    int? orderType,
    int? storeId,
    int? timeId,
    int? type,
    int? status,
  }) async {
    return await orderRepository.getOrders(
      page: page,
      size: limit,
      param: searchValue,
      orderType: orderType,
      storeId: storeId,
      timeId: timeId,
      type: type,
      status: status,
    );
  }
}
