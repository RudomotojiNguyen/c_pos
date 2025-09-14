import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../common/enum/enum.dart';
import 'package:c_pos/data/models/models.dart';
import '../../../../../../data/services/services.dart';
import '../../../../../mixins/logger_helper.dart';
import '../../../login/bloc/auth_bloc.dart';

part 'bill_event.dart';
part 'bill_state.dart';

class BillBloc extends Bloc<BillEvent, BillState> {
  final BillServices billServices;
  final AuthBloc authBloc;
  final LoggerHelper loggerHelper = LoggerHelper();

  BillBloc({
    required this.billServices,
    required this.authBloc,
  }) : super(BillInitial(
          bills: const [],
          pageInfo: PageInfoEntity(),
          filterInfo: const FilterBillModel(),
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
      final PaginatedResponse<BillModel> res = await _getBills(
        page: 1,
        size: state.pageInfo.getLimit,
        storeIds: state.filterInfo.getStoreIds,
        searchValue: state.filterInfo.searchValue,
        type: state.filterInfo.searchType,
      );
      emit(GetBillSuccess(
        state: state,
        bills: res.items,
        pageInfo: state.pageInfo.copyWith(
          page: 1,
          itemCount: res.totalPages,
        ),
      ));
    } catch (e) {
      loggerHelper.logError(message: 'GetBillListEvent', obj: e);
    }
  }

  FutureOr<void> _onGetMoreBillList(
      GetMoreBillListEvent event, Emitter<BillState> emit) async {
    try {
      if (state is UpdateLoadMore || !state.pageInfo.checkCanLoadMore) {
        return;
      }

      int page = state.pageInfo.getNextPage;
      emit(UpdateLoadMore(state: state));
      final res = await _getBills(
        page: page,
        size: state.pageInfo.getLimit,
        storeIds: state.filterInfo.getStoreIds,
        searchValue: state.filterInfo.searchValue,
        type: state.filterInfo.searchType,
      );
      if (res.items.isNotEmpty) {
        emit(GetBillSuccess(
          state: state,
          bills: [...state.bills, ...res.items],
          pageInfo: state.pageInfo.copyWith(
            page: page,
            itemCount: res.totalPages,
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
  Future<PaginatedResponse<BillModel>> _getBills({
    required int page,
    required int size,
    List<int>? storeIds,
    String? searchValue,
    SearchType type = SearchType.phoneNumber,
  }) async {
    return await billServices.getBills(
      page: page,
      size: size,
      storeIds: storeIds,
      billNumber: type == SearchType.billId ? searchValue : null,
      orderId: type == SearchType.orderId ? searchValue : null,
      customerPhoneSearch: type == SearchType.phoneNumber ? searchValue : null,
      productSearch: type == SearchType.product ? searchValue : null,
      imeiSearch: type == SearchType.imei ? searchValue : null,
      searchCoupon: null,
      employeeId: null,
    );
  }

  Future<void> _onGetBillDetail(
      GetBillDetailEvent event, Emitter<BillState> emit) async {
    try {
      emit(UpdateLoading(state: state));
      final res = await billServices.getBillDetail(
        billId: event.billId,
      );
      emit(GetBillDetailSuccess(state: state, billDetail: res));
    } catch (error) {
      emit(GetDataError(state: state));
      loggerHelper.logError(message: 'GetBillDetailError', obj: error);
    }
  }
}
