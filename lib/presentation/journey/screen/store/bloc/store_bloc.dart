import 'dart:async';

import 'package:c_pos/common/extensions/extension.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../data/models/history_change_store_model.dart';
import '../../../../../data/models/response/page_info_entity.dart';
import '../../../../../data/models/store_model.dart';
import '../../../../../data/repository/store_repository.dart';
import '../../../../mixins/logger_helper.dart';
import '../../../../widgets/widgets.dart';
import '../../login/bloc/auth_bloc.dart';

part 'store_event.dart';
part 'store_state.dart';

class StoreBloc extends Bloc<StoreEvent, StoreState> {
  final StoreRepository storeRepository;
  final AuthBloc authBloc;
  final LoggerHelper loggerHelper = LoggerHelper();

  StoreBloc({required this.storeRepository, required this.authBloc})
      : super(StoreInitial(
            stores: const [],
            userStoresCanChange: const [],
            exchangeHistory: const [],
            pageInfo: PageInfoEntity())) {
    on<GetStoreEvent>(_onGetStore);
    on<GetUserStoreCanChangeEvent>(_onGetUserStoreCanChange);
    on<ChangeUserStoreEvent>(_onChangeUserStore);
    on<GetExchangeHistoryEvent>(_onGetExchangeHistory);
    on<GetMoreExchangeHistoryEvent>(_onGetMoreExchangeHistory);
    on<CreateTicketExchangeEvent>(_onCreateTicketExchange);
  }

  FutureOr<void> _onCreateTicketExchange(
      CreateTicketExchangeEvent event, Emitter<StoreState> emit) async {
    try {
      XToast.loading();
      final res = await storeRepository.createSwitchStore(
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
      final res = await storeRepository.getHistoriesChangeStore(
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
      final res = await storeRepository.getHistoriesChangeStore(
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
      final res =
          await storeRepository.changeStore(storeId: event.targetStoreId);
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
      final res = await storeRepository.getApproveStores();
      emit(
          GetUserStoreCanChangeSuccess(state: state, userStoresCanChange: res));
    } catch (e) {
      loggerHelper.logError(message: 'GetUserStoreCanChangeEvent', obj: e);
    }
  }

  FutureOr<void> _onGetStore(
      GetStoreEvent event, Emitter<StoreState> emit) async {
    try {
      final res = await storeRepository.getStores();
      emit(GetStoreSuccess(state: state, stores: res));
    } catch (e) {
      loggerHelper.logError(message: 'GetStore', obj: e);
    }
  }

  Future<List<StoreModel>> suggestionsCallback(String pattern) async {
    return state.stores.where((store) {
      final nameLower =
          store.getName.toLowerCase().removeUtf8.split(' ').join('');
      final patternLower = pattern.toLowerCase().removeUtf8.split(' ').join('');
      return nameLower.contains(patternLower);
    }).toList();
  }
}
