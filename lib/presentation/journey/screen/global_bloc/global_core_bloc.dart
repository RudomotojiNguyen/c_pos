import 'dart:async';

import 'package:c_pos/common/extensions/extension.dart';
import 'package:c_pos/presentation/journey/screen/login/bloc/auth_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../common/constants/app_constants.dart';
import '../../../../common/di/injection/injection.dart';
import '../../../../common/enum/enum.dart';
import '../../../../data/models/auth_model.dart';
import '../../../../data/models/base_enum_model.dart';
import '../../../../data/repository/order_repository.dart';
import '../../../mixins/logger_helper.dart';

part 'global_core_event.dart';
part 'global_core_state.dart';

class GlobalCoreBloc extends Bloc<GlobalCoreEvent, GlobalCoreState> {
  final OrderRepository orderRepository;

  final LoggerHelper _loggerHelper = LoggerHelper();

  GlobalCoreBloc({
    required this.orderRepository,
  }) : super(const GlobalCoreInitial(
          orderStatus: [],
          cancelStatus: [],
          orderSource: [],
          orderType: [],
        )) {
    /// Xử lý sự kiện lấy trạng thái đơn hàng
    on<GetOrderStatusEvent>(_onGetOrderStatus);

    /// Xử lý sự kiện lấy nguồn đơn
    on<GetOrderSourceEvent>(_onGetOrderSource);

    /// Xử lý sự kiện lấy loại đơn
    on<GetOrderTypeEvent>(_onGetOrderType);
  }

  FutureOr<void> _onGetOrderType(
      GetOrderTypeEvent event, Emitter<GlobalCoreState> emit) async {
    try {
      final res = DataConstants.orderType;
      emit(GetOrderTypeSuccess(
        state: state,
        orderType: res,
      ));
    } catch (e) {
      _loggerHelper.logError(message: 'GetOrderTypeEvent', obj: e);
    }
  }

  FutureOr<void> _onGetOrderStatus(
      GetOrderStatusEvent event, Emitter<GlobalCoreState> emit) async {
    try {
      final AuthBloc authBloc = getIt.get<AuthBloc>();
      final AuthModel? userInfo = authBloc.state.userInfo;

      List<BaseEnumModel> res = [];

      if (userInfo != null) {
        switch (userInfo.getJob) {
          //CR
          case XJobTitle.qlCskh:
          case XJobTitle.cskh:
          case XJobTitle.ctvCskh:
            res = DataConstants.orderStatusCr;
            break;

          //SHOP
          case XJobTitle.asm:
          case XJobTitle.ql:
          case XJobTitle.tl:
          case XJobTitle.ktbh:
          case XJobTitle.tvbh:
          case XJobTitle.ktpm:
          case XJobTitle.tdkh:
          case XJobTitle.ktpc:
            res = DataConstants.orderStatusShop;
            break;

          //DP
          case XJobTitle.dp:
          case XJobTitle.qlDp:
            res = DataConstants.orderStatusDp;
            break;

          // còn lại
          default:
            res = DataConstants.orderStatus;
            break;
        }
      }

      emit(GetOrderStatusSuccess(
        state: state,
        orderStatus: res,
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
