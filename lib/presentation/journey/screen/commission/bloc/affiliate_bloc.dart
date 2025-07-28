import 'dart:async';

import 'package:c_pos/common/extensions/extension.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:c_pos/data/models/models.dart';
import '../../../../../data/services/services.dart';
import '../../../../mixins/logger_helper.dart';

part 'affiliate_event.dart';
part 'affiliate_state.dart';

class AffiliateBloc extends Bloc<AffiliateEvent, AffiliateState> {
  final AffiliateCommissionServices affiliateCommissionServices;
  final LoggerHelper _loggerHelper = LoggerHelper();

  AffiliateBloc(this.affiliateCommissionServices)
      : super(AffiliateInitial(
            fromDate: DateTime(DateTime.now().year, DateTime.now().month, 1),
            toDate: DateTime.now())) {
    on<UpdateFilterEvent>(_onUpdateFilter);
    on<GetRewardEvent>(_onGetReward);
    on<GetCommissionDetailEvent>(_onGetCommissionDetail);
  }

  FutureOr<void> _onGetCommissionDetail(
      GetCommissionDetailEvent event, Emitter<AffiliateState> emit) async {
    try {
      emit(GetCommissionDetailLoading(state: state));
      //
      final res = await affiliateCommissionServices.getCommissionDetailByCate(
        fromDate: event.fromDate.formatDateTime(),
        toDate: event.toDate.formatDateTime(),
        ids: event.ids,
        roleId: event.roleId,
      );
      //
      emit(GetCommissionDetailSuccess(state: state, detail: res));
    } catch (e) {
      _loggerHelper.logError(message: 'GetCommissionDetailEvent', obj: e);
      emit(GetCommissionDetailSuccess(state: state, detail: null));
    }
  }

  FutureOr<void> _onUpdateFilter(
      UpdateFilterEvent event, Emitter<AffiliateState> emit) async {
    try {
      emit(UpdateFilterSuccess(fromDate: event.fromDate, toDate: event.toDate));
    } catch (e) {
      _loggerHelper.logError(message: 'UpdateFilterEvent', obj: e);
    }
  }

  FutureOr<void> _onGetReward(
      GetRewardEvent event, Emitter<AffiliateState> emit) async {
    try {
      emit(IsLoading(state: state));

      final res = await affiliateCommissionServices.getCommissionDetail(
          fromDate: state.fromDate.formatDateTime(),
          toDate: state.toDate.formatDateTime());

      RewardReportModel detail = res.formatListDetail();

      emit(GetDetailSuccess(state: state, detail: detail));
    } catch (e) {
      _loggerHelper.logError(message: 'GetRewardEvent', obj: e);
      emit(GetDetailError(state: state));
    }
  }
}
