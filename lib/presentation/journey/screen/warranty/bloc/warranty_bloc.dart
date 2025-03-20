import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../data/models/store_model.dart';
import '../../../../../data/models/suggest_note_model.dart';
import '../../../../../data/models/warranty_model.dart';
import '../../../../../data/repository/warranty_repositories.dart';
import '../../../../mixins/logger_helper.dart';

part 'warranty_event.dart';
part 'warranty_state.dart';

class WarrantyBloc extends Bloc<WarrantyEvent, WarrantyState> {
  final WarrantyRepositories warrantyRepositories;
  final LoggerHelper _loggerHelper = LoggerHelper();

  WarrantyBloc(this.warrantyRepositories)
      : super(const WarrantyInitial(
          page: 1,
          limit: 10,
          warrantiesNote: [],
          canLoadMore: true,
          warranties: [],
        )) {
    /// lấy danh sách ghi chú bảo hành
    on<GetSuggestNoteEvent>(_onGetSuggestNote);

    /// search ghi chú bảo hành
    on<SearchSuggestNoteEvent>(_onSearchSuggestNote);

    /// cập nhật bộ filter
    on<UpdateFilterEvent>(_onUpdateFilter);

    /// lấy danh sách yêu cầu bảo hành
    on<GetWarrantiesEvent>(_onGetWarranties);

    /// lấy thêm yêu cầu bảo hành
    on<GetMoreWarrantiesEvent>(_onGetMoreWarranties);

    /// chi tiếeetsyeeu cầu bảo hành
    on<GetWarrantyDetailEvent>(_onGetWarrantyDetail);
  }

  FutureOr<void> _onGetWarrantyDetail(
      GetWarrantyDetailEvent event, Emitter<WarrantyState> emit) async {
    try {
      emit(UpdateIsLoading(state: state));
      if (event.detail != null) {
        emit(GetWarrantyDetailSuccess(state: state, warranty: event.detail!));
      } else {
        // emit(GetWarrantyDetailSuccess(state: state));
      }
    } catch (e) {
      _loggerHelper.logError(message: 'GetWarrantyDetailEvent', obj: e);
    }
  }

  FutureOr<void> _onGetMoreWarranties(
      GetMoreWarrantiesEvent event, Emitter<WarrantyState> emit) async {
    try {
      if (!state.canLoadMore) {
        return;
      }

      int newPage = state.page + 1;

      final res = await warrantyRepositories
          .getWarrantyList(page: newPage, limit: state.limit, storeIds: []);

      List<WarrantyModel> warranties = state.warranties;
      warranties.addAll(res);

      emit(UpdateListWarrantiesSuccess(
        state: state,
        warranties: warranties,
        canLoadMore: res.length >= state.limit,
        newPage: newPage,
      ));
    } catch (e) {
      _loggerHelper.logError(message: 'GetMoreWarrantiesEvent', obj: e);
    }
  }

  FutureOr<void> _onGetWarranties(
      GetWarrantiesEvent event, Emitter<WarrantyState> emit) async {
    try {
      emit(UpdateIsLoading(state: state));
      final res = await warrantyRepositories
          .getWarrantyList(page: 1, limit: state.limit, storeIds: []);
      emit(UpdateListWarrantiesSuccess(
        state: state,
        warranties: res,
        canLoadMore: res.length >= state.limit,
        newPage: 1,
      ));
    } catch (e) {
      _loggerHelper.logError(message: 'GetWarrantiesEvent', obj: e);
    }
  }

  FutureOr<void> _onUpdateFilter(
      UpdateFilterEvent event, Emitter<WarrantyState> emit) async {
    try {
      emit(UpdateFilterSuccess(state: state, newStore: event.store));
    } catch (e) {
      _loggerHelper.logError(message: 'UpdateFilterEvent', obj: e);
    }
  }

  FutureOr<void> _onSearchSuggestNote(
      SearchSuggestNoteEvent event, Emitter<WarrantyState> emit) async {
    try {
      emit(UpdateIsLoading(state: state));
      final res = await warrantyRepositories.getWarrantyInfo(
          page: 1, size: state.limit, name: event.name);
      emit(GetSuggestNoteSuccess(
        state: state,
        warrantiesNote: res,
        page: 1,
        canLoadMore: res.length >= state.limit,
      ));
    } catch (e) {
      _loggerHelper.logError(message: 'GetSuggestNoteEvent', obj: e);
    }
  }

  FutureOr<void> _onGetSuggestNote(
      GetSuggestNoteEvent event, Emitter<WarrantyState> emit) async {
    try {
      emit(UpdateIsLoading(state: state));
      final res = await warrantyRepositories.getWarrantyInfo(
          page: 1, size: state.limit);
      emit(GetSuggestNoteSuccess(
        state: state,
        warrantiesNote: res,
        page: 1,
        canLoadMore: res.length >= state.limit,
      ));
    } catch (e) {
      _loggerHelper.logError(message: 'GetSuggestNoteEvent', obj: e);
    }
  }
}
