import 'dart:async';

import 'package:c_pos/common/extensions/extension.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../data/models/base_enum_model.dart';
import '../../../../data/models/ticket_type_model.dart';
import '../../../../data/repository/order_repository.dart';
import '../../../../data/repository/support_repositories.dart';
import '../../../mixins/logger_helper.dart';

part 'global_core_event.dart';
part 'global_core_state.dart';

class GlobalCoreBloc extends Bloc<GlobalCoreEvent, GlobalCoreState> {
  final OrderRepository orderRepository;
  final SupportRepositories supportRepositories;

  final LoggerHelper _loggerHelper = LoggerHelper();

  GlobalCoreBloc({
    required this.orderRepository,
    required this.supportRepositories,
  }) : super(const GlobalCoreInitial(
          orderStatus: [],
          ticketType: [],
          cancelStatus: [],
          orderSource: [],
          orderType: [],
        )) {
    /// Xử lý sự kiện lấy trạng thái đơn hàng
    on<GetOrderStatusEvent>(_onGetOrderStatus);

    /// Xử lý sự kiện lấy nguồn đơn
    on<GetOrderSourceEvent>(_onGetOrderSource);

    /// Xử lý sự kiện lấy loại vé
    on<GetTicketTypeEvent>(_onGetTicketType);
  }

  FutureOr<void> _onGetTicketType(
      GetTicketTypeEvent event, Emitter<GlobalCoreState> emit) async {
    try {
      final res = await supportRepositories.getTicketTypes();
      emit(GetTicketTypeSuccess(state: state, ticketType: res));
    } catch (e) {
      _loggerHelper.logError(message: 'GetTicketTypeEvent', obj: e);
    }
  }

  FutureOr<void> _onGetOrderStatus(
      GetOrderStatusEvent event, Emitter<GlobalCoreState> emit) async {
    try {
      final res = await orderRepository.getOrderEnum();
      emit(GetOrderStatusSuccess(
        state: state,
        orderStatus: res.status ?? [],
        cancelStatus: res.cancelStatus ?? [],
        orderType: res.orderType ?? [],
      ));
    } catch (e) {
      _loggerHelper.logError(message: 'GetOrderStatusEvent', obj: e);
    }
  }

  FutureOr<void> _onGetOrderSource(
      GetOrderSourceEvent event, Emitter<GlobalCoreState> emit) async {
    try {
      final res = await orderRepository.getOrderSource();
      emit(GetOrderSourceSuccess(
        state: state,
        orderSource: res,
      ));
    } catch (e) {
      _loggerHelper.logError(message: 'GetOrderSourceEvent', obj: e);
    }
  }

  ///
  /// METHOD
  ///
  Future<List<BaseEnumModel>> searchOrderSource(String? value) async {
    try {
      final currentValue = (value ?? '').toStrSearch;
      final result = state.orderSource
          .where(
            (element) => element.getName.toStrSearch.contains(currentValue),
          )
          .toList();
      return result.isEmpty ? state.orderSource : result;
    } catch (e) {
      return [];
    }
  }

  Future<List<BaseEnumModel>> searchOrderType(String? value) async {
    try {
      final currentValue = (value ?? '').toStrSearch;
      final result = state.orderType
          .where(
            (element) => element.getName.toStrSearch.contains(currentValue),
          )
          .toList();
      return result.isEmpty ? state.orderType : result;
    } catch (e) {
      return [];
    }
  }

  Future<List<BaseEnumModel>> searchOrderStatus(String? value) async {
    try {
      final currentValue = (value ?? '').toStrSearch;
      final result = state.orderStatus
          .where(
            (element) => element.getName.toStrSearch.contains(currentValue),
          )
          .toList();
      return result.isEmpty ? state.orderStatus : result;
    } catch (e) {
      return [];
    }
  }
}
