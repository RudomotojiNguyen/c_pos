import 'dart:async';

import 'package:c_pos/common/extensions/extension.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:c_pos/data/models/models.dart';
import '../../../../../data/services/services.dart';
import '../../../../mixins/logger_helper.dart';
import '../../../../widgets/widgets.dart';
import '../../login/bloc/auth_bloc.dart';

part 'store_event.dart';
part 'store_state.dart';

class StoreBloc extends Bloc<StoreEvent, StoreState> {
  final StoreServices storeServices;
  final AuthBloc authBloc;
  final LoggerHelper loggerHelper = LoggerHelper();

  StoreBloc({required this.storeServices, required this.authBloc})
      : super(StoreInitial(
            stores: const [],
            storesOfUser: const [],
            userStoresCanChange: const [],
            exchangeHistory: const [],
            pageInfo: PageInfoEntity())) {
    on<GetStoreEvent>(_onGetStore);
    on<GetUserStoreCanChangeEvent>(_onGetUserStoreCanChange);
    on<ChangeUserStoreEvent>(_onChangeUserStore);
    on<GetExchangeHistoryEvent>(_onGetExchangeHistory);
    on<GetMoreExchangeHistoryEvent>(_onGetMoreExchangeHistory);
    on<CreateTicketExchangeEvent>(_onCreateTicketExchange);
    on<GetStoresByUserEvent>(_onGetStoresByUser);
  }

  FutureOr<void> _onGetStoresByUser(
      GetStoresByUserEvent event, Emitter<StoreState> emit) async {
    try {
      emit(GetStoresByUserLoading(state: state));
      final res = await storeServices.getStoresByUser();
      emit(GetStoresByUserSuccess(state: state, storesOfUser: res));
    } catch (e) {
      loggerHelper.logError(message: 'GetStoresByUserEvent', obj: e);
      emit(GetStoresByUserSuccess(state: state, storesOfUser: const []));
    }
  }

  FutureOr<void> _onCreateTicketExchange(
      CreateTicketExchangeEvent event, Emitter<StoreState> emit) async {
    try {
      XToast.loading();
      final res = await storeServices.createSwitchStore(
        employeeId: authBloc.state.getUserId,
        currentStoreId: authBloc.state.getUserStoreId,
        targetStoreId: event.targetStoreId,
        description: event.description,
      );
      if (res) {
        emit(CreateTicketExchangeSuccess(state: state));
      } else {
        XToast.showNegativeMessage(message: 'Tạo không thành công');
      }
    } catch (e) {
      XToast.closeAllLoading();
      XToast.showNegativeMessage(message: e.toString());
      loggerHelper.logError(message: 'CreateTicketExchangeEvent', obj: e);
    }
  }

  FutureOr<void> _onGetMoreExchangeHistory(
      GetMoreExchangeHistoryEvent event, Emitter<StoreState> emit) async {
    try {
      if (state is GetExchangeHistoryLoadMore ||
          !state.pageInfo.checkCanLoadMore) {
        return;
      }

      emit(GetExchangeHistoryLoadMore(state: state));
      int page = state.currentPage + 1;
      List<HistoryChangeStoreModel> data = state.exchangeHistory;
      final res = await storeServices.getHistoriesChangeStore(
          page: page, pageSize: state.limit);

      data.addAll(res);
      emit(GetExchangeHistorySuccess(
          state: state,
          exchangeHistory: data,
          pageInfo: state.pageInfo.copyWith(
            page: page,
            itemCount: res.length,
          )));
    } catch (e) {
      loggerHelper.logError(message: 'GetMoreExchangeHistoryEvent', obj: e);
    }
  }

  FutureOr<void> _onGetExchangeHistory(
      GetExchangeHistoryEvent event, Emitter<StoreState> emit) async {
    try {
      emit(GetExchangeHistoryLoading(state: state));
      final res = await storeServices.getHistoriesChangeStore(
          page: state.currentPage, pageSize: state.limit);
      emit(GetExchangeHistorySuccess(
          state: state,
          exchangeHistory: res,
          pageInfo: state.pageInfo.copyWith(
            page: 1,
            itemCount: res.length,
          )));
    } catch (e) {
      loggerHelper.logError(message: 'GetExchangeHistoryEvent', obj: e);
    }
  }

  FutureOr<void> _onChangeUserStore(
      ChangeUserStoreEvent event, Emitter<StoreState> emit) async {
    try {
      XToast.loading();
      final res = await storeServices.changeStore(storeId: event.targetStoreId);
      if (res) {
        emit(ChangeUserStoreSuccess(state: state));
      }
    } catch (e) {
      loggerHelper.logError(message: 'ChangeUserStoreEvent', obj: e);
    }
  }

  FutureOr<void> _onGetUserStoreCanChange(
      GetUserStoreCanChangeEvent event, Emitter<StoreState> emit) async {
    try {
      emit(GetUserStoreCanChangeLoading(state: state));
      final res = await storeServices.getApproveStores();
      emit(
          GetUserStoreCanChangeSuccess(state: state, userStoresCanChange: res));
    } catch (e) {
      loggerHelper.logError(message: 'GetUserStoreCanChangeEvent', obj: e);
    }
  }

  FutureOr<void> _onGetStore(
      GetStoreEvent event, Emitter<StoreState> emit) async {
    try {
      final res = await storeServices.getStores();
      emit(GetStoreSuccess(state: state, stores: res));
    } catch (e) {
      loggerHelper.logError(message: 'GetStore', obj: e);
    }
  }

  Future<List<StoreModel>> suggestionsCallback(String pattern) async {
    List<StoreModel> stores = state.stores;

    if (stores.isEmpty) {
      add(GetStoreEvent());
      final res = await storeServices.getStores();
      stores = res;
    }
    List<StoreModel> res =
        await _onFilterStores(stores: stores, pattern: pattern);
    return res;
  }

  Future<List<StoreModel>> suggestionsUserCallback(String pattern) async {
    List<StoreModel> stores = state.storesOfUser;

    if (stores.isEmpty) {
      add(GetStoresByUserEvent());
      final res = await storeServices.getStoresByUser();
      stores = res;
    }
    List<StoreModel> res =
        await _onFilterStores(stores: stores, pattern: pattern);
    return res;
  }

  Future<List<StoreModel>> _onFilterStores(
      {required List<StoreModel> stores, required String pattern}) async {
    return stores.where((store) {
      final nameLower =
          store.getName.toLowerCase().removeUtf8.split(' ').join('');
      final patternLower = pattern.toLowerCase().removeUtf8.split(' ').join('');
      return nameLower.contains(patternLower);
    }).toList();
  }
}
