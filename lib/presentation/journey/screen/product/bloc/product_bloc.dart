import 'dart:async';

import 'package:c_pos/common/enum/enum.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../data/models/filter/base_loading_info_model.dart';
import '../../../../../data/models/filter/filter_imei_history_model.dart';
import '../../../../../data/models/imei_history_model.dart';
import '../../../../../data/models/imei_transaction_model.dart';
import '../../../../../data/models/store_model.dart';
import '../../../../../data/models/trade_in_transaction_model.dart';
import '../../../../../data/repository/product_repository.dart';
import '../../../../mixins/logger_helper.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductRepository productRepository;
  final LoggerHelper _loggerHelper = LoggerHelper();

  ProductBloc(this.productRepository)
      : super(const ProductInitial(
          baseLoadingInfo: BaseLoadingInfoModel(),
          filterImeiHistory: FilterImeiHistoryModel(),
          listImeiHistory: [],
        )) {
    /// tìm imei
    on<GetImeiHistoryEvent>(_onGetImeiHistory);

    /// lấy thêm imei
    on<GetMoreImeiHistoryEvent>(_onGetMoreImeiHistory);

    /// cập nhật bộ filter imei
    on<UpdateImeiFilterEvent>(_onUpdateFilter);

    /// đặt lại mặc định bộ filter imei
    on<SetDefaultImeiFilterEvent>(_onSetDefaultImeiFilter);

    /// lấy lịch sử giao dịch của imei
    on<GetImeiTransactionEvent>(_onGetImeiTransaction);

    /// lấy lịch sử thu cũ của imei
    on<GetImeiTradeinTransactionEvent>(_onGetImeiTradeinTransaction);
  }

  FutureOr<void> _onGetImeiTransaction(
      GetImeiTransactionEvent event, Emitter<ProductState> emit) async {
    try {
      emit(IsLoading(state: state));
      final res =
          await productRepository.getImeiHistoryTransaction(imei: event.imei);

      emit(GetImeiTransactionSuccess(state: state, listImeiTransaction: res));
    } catch (e) {
      _loggerHelper.logError(message: 'GetImeiTransactionEvent', obj: e);
    }
  }

  FutureOr<void> _onGetImeiTradeinTransaction(
      GetImeiTradeinTransactionEvent event, Emitter<ProductState> emit) async {
    try {
      emit(IsLoading(state: state));
      final res =
          await productRepository.getImeiTradeinTransaction(imei: event.imei);

      emit(GetTradeinTransactionSuccess(
          state: state, listTradeinTransaction: res));
    } catch (e) {
      _loggerHelper.logError(message: 'GetImeiTradeinTransactionEvent', obj: e);
    }
  }

  FutureOr<void> _onGetImeiHistory(
      GetImeiHistoryEvent event, Emitter<ProductState> emit) async {
    try {
      emit(IsLoading(state: state));

      final res = await productRepository.getImeiHistory(
        page: 1,
        size: state.baseLoadingInfo.limit,
        search: state.filterImeiHistory.search,
        storeId: state.filterImeiHistory.store?.id,
        statusImei: state.filterImeiHistory.imeiStatus.getValue,
      );

      emit(
        GetDataImeiHistorySuccess(
          state: state,
          listImeiHistory: res,
          baseLoadingInfo: state.baseLoadingInfo.copyWith(
            currentPage: 1,
            sizeDate: res.length,
          ),
        ),
      );
    } catch (e) {
      _loggerHelper.logError(message: 'GetImeiHistoryEvent', obj: e);
    }
  }

  FutureOr<void> _onGetMoreImeiHistory(
      GetMoreImeiHistoryEvent event, Emitter<ProductState> emit) async {
    try {
      if (state is GetDataImeiHistorySuccess) {
        final page = state.baseLoadingInfo.currentPage + 1;
        final res = await productRepository.getImeiHistory(
          page: page,
          size: state.baseLoadingInfo.limit,
          search: state.filterImeiHistory.search,
          storeId: state.filterImeiHistory.store?.id,
          statusImei: state.filterImeiHistory.imeiStatus.getValue,
        );
        final data = state.listImeiHistory;
        data.addAll(res);

        emit(
          GetDataImeiHistorySuccess(
            state: state,
            listImeiHistory: data,
            baseLoadingInfo: state.baseLoadingInfo.copyWith(
              currentPage: page,
              sizeDate: res.length,
            ),
          ),
        );
      }
    } catch (e) {
      _loggerHelper.logError(message: 'GetMoreImeiHistoryEvent', obj: e);
    }
  }

  FutureOr<void> _onUpdateFilter(
      UpdateImeiFilterEvent event, Emitter<ProductState> emit) async {
    try {
      emit(UpdateFilterSuccess(
        state: state,
        filterImeiHistory: state.filterImeiHistory.copyWith(
          imeiStatus: event.imeiStatus,
          store: event.store,
          search: event.search,
        ),
      ));
    } catch (e) {
      _loggerHelper.logError(message: 'UpdateFilterEvent', obj: e);
    }
  }

  FutureOr<void> _onSetDefaultImeiFilter(
      SetDefaultImeiFilterEvent event, Emitter<ProductState> emit) async {
    try {
      emit(UpdateFilterSuccess(
          state: state, filterImeiHistory: const FilterImeiHistoryModel()));
    } catch (e) {
      _loggerHelper.logError(message: 'SetDefaultImeiFilterEvent', obj: e);
    }
  }
}
