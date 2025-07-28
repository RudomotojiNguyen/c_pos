import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

import '../../../../../data/datasources/local_db/local_db.dart';
import 'package:c_pos/data/models/models.dart';
import '../../../../../data/services/services.dart';
import '../../../../mixins/logger_helper.dart';
import '../../../../widgets/widgets.dart';
import '../../login/bloc/auth_bloc.dart';

part 'coupon_event.dart';
part 'coupon_state.dart';

class CouponBloc extends Bloc<CouponEvent, CouponState> {
  final CouponServices couponServices;
  final AuthBloc authBloc;
  final LoggerHelper _loggerHelper = LoggerHelper();

  CouponBloc({
    required this.couponServices,
    required this.authBloc,
  }) : super(const CouponInitial(coupons: [])) {
    on<SearchCouponEvent>(_onSearchCoupon);
    on<CheckCouponEvent>(_onCheckCoupon);
  }

  FutureOr<void> _onSearchCoupon(
      SearchCouponEvent event, Emitter<CouponState> emit) async {
    try {
      emit(IsLoading(state: state));
      final res = await couponServices.searchCoupon(
        code: event.code,
        storeId: authBloc.state.userInfo!.getStoreId,
        products: event.products,
        applyChanel: 1,
        page: 1,
        size: 5,
        customerId: event.customerId,
      );
      emit(UpdateCoupons(state: state, coupons: res));
    } catch (e) {
      _loggerHelper.logError(message: 'SearchCouponEvent', obj: e);
    }
  }

  FutureOr<void> _onCheckCoupon(
      CheckCouponEvent event, Emitter<CouponState> emit) async {
    try {
      emit(IsLoading(state: state));
      final res = await couponServices.checkCoupon(
        couponCode: event.code,
        storeId: authBloc.state.userInfo!.getStoreId,
        listProduct: event.products,
        customerId: event.customerId,
      );

      emit(UpdateDiscountAmount(state: state, discountAmount: res));
    } catch (e) {
      _loggerHelper.logError(message: 'CheckCouponEvent', obj: e);
      XToast.showNegativeMessage(message: e.toString());
      emit(UpdateDiscountAmount(state: state, discountAmount: null));
    }
  }
}
