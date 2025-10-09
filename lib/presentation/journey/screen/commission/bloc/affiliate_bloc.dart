import 'dart:async';

import 'package:c_pos/common/extensions/extension.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:c_pos/data/models/models.dart';
import '../../../../../data/models/reward_product_check_model.dart';
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
    /// cập nhật filter
    on<UpdateFilterEvent>(_onUpdateFilter);

    /// lấy danh sách hoa hồng
    on<GetRewardEvent>(_onGetReward);

    /// lấy danh sách chi tiết hoa hồng
    on<GetCommissionDetailEvent>(_onGetCommissionDetail);

    /// kiểm tra xem sản phẩm có được cấu hình hoa hồng không
    on<CheckCommissionEvent>(_onCheckCommission);

    /// xóa sản phẩm
    on<ClearProductEvent>(_onClearProduct);
  }

  FutureOr<void> _onClearProduct(
      ClearProductEvent event, Emitter<AffiliateState> emit) async {
    if (state is GetCommissionDetailLoading ||
        (state is GetProductRewardSuccess &&
            (state as GetProductRewardSuccess).rewardProductCheck.isEmpty)) {
      return;
    }
    emit(GetCommissionDetailLoading(state: state));
    emit(GetProductRewardSuccess(state: state, rewardProductCheck: const []));
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

  FutureOr<void> _onCheckCommission(
      CheckCommissionEvent event, Emitter<AffiliateState> emit) async {
    try {
      emit(GetCommissionDetailLoading(state: state));
      //
      final res = await affiliateCommissionServices.checkCommission(
        productId: event.productId,
        storeId: event.storeId,
        month: event.month,
        year: event.year,
      );
      //
      emit(GetProductRewardSuccess(state: state, rewardProductCheck: res));
    } catch (e) {
      _loggerHelper.logError(message: 'CheckCommissionEvent', obj: e);
      emit(GetProductRewardSuccess(state: state, rewardProductCheck: const []));
    }
  }
}
