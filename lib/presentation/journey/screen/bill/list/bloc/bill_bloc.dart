import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../common/enum/enum.dart';
import '../../../../../../data/models/bill_model.dart';
import '../../../../../../data/models/filter/base_loading_info_model.dart';
import '../../../../../../data/models/filter_bill_model.dart';
import '../../../../../../data/models/store_model.dart';
import '../../../../../../data/repository/bill_repository.dart';
import '../../../../../mixins/logger_helper.dart';
import '../../../login/bloc/auth_bloc.dart';

part 'bill_event.dart';
part 'bill_state.dart';

class BillBloc extends Bloc<BillEvent, BillState> {
  final BillRepository billRepository;
  final AuthBloc authBloc;
  final LoggerHelper loggerHelper = LoggerHelper();

  BillBloc({
    required this.billRepository,
    required this.authBloc,
  }) : super(const BillInitial(
          bills: [],
          loadingInfo: BaseLoadingInfoModel(),
          filterInfo: FilterBillModel(),
        )) {
    /// Xử lý sự kiện GetBillListEvent để lấy danh sách hóa đơn
    on<GetBillListEvent>(_onGetBillList);

    /// Xử lý sự kiện GetMoreBillListEvent để lấy thêm danh sách hóa đơn
    on<GetMoreBillListEvent>(_onGetMoreBillList);

    /// Xử lý sự kiện FilterBillEvent để lọc danh sách hóa đơn theo tiêu chí
    on<FilterBillEvent>(_onFilter);

    /// Xử lý sự kiện UpdateSearchTypeEvent để cập nhật loại tìm kiếm
    on<UpdateSearchTypeEvent>(_updateSearchType);

    /// Xử lý sự kiện SetFilterDefaultEvent để đặt lại bộ lọc về mặc định
    on<SetFilterDefaultEvent>(_onSetFilterDefault);

    /// Xử lý sự kiện thay đổi giá trị nhập vào
    on<UpdateSearchTextEvent>(_onUpdateSearchText);

    /// Xử lý sự kiện GetBillDetailEvent để lấy chi tiết hoá đơn
    on<GetBillDetailEvent>(_onGetBillDetail);
  }

  FutureOr<void> _onUpdateSearchText(
      UpdateSearchTextEvent event, Emitter<BillState> emit) async {
    try {
      emit(FilterBillSuccess(
        state: state,
        filterInfo:
            state.filterInfo.updateSearchText(searchValue: event.searchText),
      ));
    } catch (e) {
      loggerHelper.logError(message: 'SetFilterDefaultEvent', obj: e);
    }
  }

  FutureOr<void> _onSetFilterDefault(
      SetFilterDefaultEvent event, Emitter<BillState> emit) async {
    try {
      emit(FilterBillSuccess(
        state: state,
        filterInfo: const FilterBillModel(),
      ));
    } catch (e) {
      loggerHelper.logError(message: 'SetFilterDefaultEvent', obj: e);
    }
  }

  FutureOr<void> _onFilter(
      FilterBillEvent event, Emitter<BillState> emit) async {
    try {
      emit(FilterBillSuccess(
        state: state,
        filterInfo: state.filterInfo.copyWith(
          searchValue: event.searchValue,
          type: event.type,
          store: event.store,
          searchType: event.searchType,
        ),
      ));
    } catch (e) {
      loggerHelper.logError(message: 'FilterBill', obj: e);
    }
  }

  FutureOr<void> _onGetBillList(
      GetBillListEvent event, Emitter<BillState> emit) async {
    try {
      emit(UpdateLoading(state: state));
      final res = await _getBills(
        page: 1,
        size: state.loadingInfo.limit,
        storeId: state.filterInfo.getStoreId,
        search: state.filterInfo.searchValue,
        searchType: state.filterInfo.getSearchType,
        type: state.filterInfo.getType,
      );
      emit(GetBillSuccess(
        state: state,
        bills: res,
        loadingInfo: state.loadingInfo.copyWith(
          currentPage: 1,
          sizeDate: res.length,
        ),
      ));
    } catch (e) {
      loggerHelper.logError(message: 'GetBillListEvent', obj: e);
    }
  }

  FutureOr<void> _onGetMoreBillList(
      GetMoreBillListEvent event, Emitter<BillState> emit) async {
    try {
      if (state is UpdateLoadMore || !state.loadingInfo.canLoadMore) {
        return;
      }

      int page = state.loadingInfo.getNextPage;
      emit(UpdateLoadMore(state: state));
      final res = await _getBills(
        page: page,
        size: state.loadingInfo.limit,
        storeId: state.filterInfo.getStoreId,
        search: state.filterInfo.searchValue,
        searchType: state.filterInfo.getSearchType,
        type: state.filterInfo.getType,
      );
      if (res.isNotEmpty) {
        emit(GetBillSuccess(
          state: state,
          bills: [...state.bills, ...res],
          loadingInfo: state.loadingInfo.copyWith(
            currentPage: page,
            sizeDate: res.length,
          ),
        ));
      }
    } catch (e) {
      loggerHelper.logError(message: 'GetMoreBillListEvent', obj: e);
    }
  }

  FutureOr<void> _updateSearchType(
      UpdateSearchTypeEvent event, Emitter<BillState> emit) {
    try {
      emit(UpdateSearchTypeSuccess(
        state: state,
        filterInfo:
            state.filterInfo.updateSearchType(searchType: event.searchType),
      ));
    } catch (e) {
      loggerHelper.logError(message: 'UpdateSearchTypeEvent', obj: e);
    }
  }

  ///
  Future<List<BillModel>> getBills({
    required int page,
    required int size,
    required String id,
  }) async {
    try {
      final res = await _getBills(
        page: 1,
        size: size,
        search: id,
        searchType: SearchType.billId.getValue,
      );
      return res;
    } catch (e) {
      rethrow;
    }
  }

  Future<List<BillModel>> _getBills({
    required int page,
    required int size,
    int? storeId,
    int? type,
    int? searchType,
    String? search,
  }) async {
    return await billRepository.getBills(
      page: page,
      size: size,
      storeId: storeId ?? authBloc.state.userInfo!.getStoreId,
      search: search,
      searchType: searchType,
      type: type,
    );
  }

  Future<void> _onGetBillDetail(
      GetBillDetailEvent event, Emitter<BillState> emit) async {
    try {
      emit(UpdateLoading(state: state));
      final res = await billRepository.getBillDetail(
        billId: event.billId,
      );
      emit(GetBillDetailSuccess(state: state, billDetail: res));
    } catch (error) {
      emit(GetDataError(state: state));
      loggerHelper.logError(message: 'GetBillDetailError', obj: error);
    }
  }
}
