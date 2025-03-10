import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../common/enum/enum.dart';
import '../../../../../data/models/customer_model.dart';
import '../../../../../data/models/customer_type_model.dart';
import '../../../../../data/repository/customer_repository.dart';
import '../../../../mixins/logger_helper.dart';
import '../../../../widgets/widgets.dart';

part 'customer_event.dart';
part 'customer_state.dart';

class CustomerBloc extends Bloc<CustomerEvent, CustomerState> {
  final CustomerRepository customerRepository;
  final LoggerHelper _loggerHelper = LoggerHelper();

  CustomerBloc({
    required this.customerRepository,
  }) : super(const CustomerInitial(
            customers: [],
            currentPage: 1,
            limit: 10,
            isLoading: false,
            isLoadMore: false,
            canLoadMore: true)) {
    /// tìm khách hàng bằng SDT
    on<GetCustomerByPhoneEvent>(_onGetCustomers);

    /// tìm khách hàng bằng id
    on<GetCustomerByIdEvent>(_onGetCustomerInfo);

    /// thay đổi text ->
    on<OnchangeTextEvent>(_onChangeText);

    /// lấy mã OTP để check DMEM hoặc dùng điểm
    on<GetOTPEvent>(_onGetOTP);

    /// check mã OTP cho DMEM hoặc  điểm
    on<CheckOTPEvent>(_onCheckOTP);
  }

  FutureOr<void> _onCheckOTP(
      CheckOTPEvent event, Emitter<CustomerState> emit) async {
    try {
      XToast.loading();
      emit(UpdateIsLoading(state: state, isLoading: true));
      if (event.type == DiscountMemberType.dMem) {
        await customerRepository.checkOTPUseDMem(
            customerId: event.customerId, otpCode: event.otpCode);
        emit(CheckOTPSuccess(state: state, amount: 0, point: 0));
      }
      if (event.type == DiscountMemberType.point) {
        final res = await customerRepository.checkOTPUsePoint(
            customerId: event.customerId,
            otpCode: event.otpCode,
            pointUse: event.pointUse ?? 0);
        emit(CheckOTPSuccess(
            state: state, amount: res, point: event.pointUse ?? 0));
      }
    } catch (e) {
      XToast.showNegativeMessage(message: e.toString());
      _loggerHelper.logError(message: 'CheckOTPEvent', obj: e);
    } finally {
      XToast.closeAllLoading();
      emit(UpdateIsLoading(state: state, isLoading: false));
    }
  }

  FutureOr<void> _onGetOTP(
      GetOTPEvent event, Emitter<CustomerState> emit) async {
    try {
      XToast.loading();
      emit(UpdateIsLoading(state: state, isLoading: true));
      if (event.type == DiscountMemberType.dMem) {
        final res = await customerRepository.getCustomerOTPToUseDMem(
            phoneNumber: event.customerPhone, isCheckBlackList: 1);
        XToast.showPositiveSuccess(
            message: 'Mã OTP đã được gửi tới ${event.customerPhone}');
        emit(GetOTPSuccess(state: state, otp: res.$1, customerInfo: res.$2));
      }
      if (event.type == DiscountMemberType.point && event.customerId != null) {
        final res = await customerRepository.getCustomerOTPToChangePoint(
            customerId: event.customerId!, pointUse: event.point ?? 0);
        XToast.showPositiveSuccess(
            message: 'Mã OTP đã được gửi tới ${event.customerPhone}');
        emit(GetOTPSuccess(state: state, otp: res.$1));
      }
    } catch (e) {
      XToast.showWarningMessage(message: e.toString());
      _loggerHelper.logError(message: 'GetOTPEvent', obj: e);
    } finally {
      XToast.closeAllLoading();
      emit(UpdateIsLoading(state: state, isLoading: false));
    }
  }

  FutureOr<void> _onChangeText(
      OnchangeTextEvent event, Emitter<CustomerState> emit) async {
    emit(UpdateIsLoading(state: state, isLoading: true));
    Future.delayed(const Duration(seconds: 1));
    emit(UpdateIsLoading(state: state, isLoading: false));
  }

  FutureOr<void> _onGetCustomerInfo(
      GetCustomerByIdEvent event, Emitter<CustomerState> emit) async {
    try {
      emit(UpdateIsLoading(state: state, isLoading: true));
      final res = await customerRepository.getCustomerInfoById(
          customerId: event.customerId);
      emit(UpdateIsLoading(state: state, isLoading: false));
      emit(GetCustomerDetailSuccess(state: state, customer: res));
    } catch (e) {
      _loggerHelper.logError(message: 'GetCustomerByIdEvent', obj: e);
      emit(UpdateIsLoading(state: state, isLoading: false));
    }
  }

  FutureOr<void> _onGetCustomers(
      GetCustomerByPhoneEvent event, Emitter<CustomerState> emit) async {
    try {
      emit(UpdateIsLoading(state: state, isLoading: true));
      final res = await getCustomers(
          page: 1, size: state.limit, phoneNumber: event.phone);
      emit(UpdateIsLoading(state: state, isLoading: false));
      emit(GetCustomersSuccess(
        state: state,
        customers: res,
        currentPage: 1,
        canLoadMore: res.length >= state.limit,
      ));
    } catch (e) {
      _loggerHelper.logError(message: 'GetCustomerByPhoneEvent', obj: e);
      emit(UpdateIsLoading(state: state, isLoading: false));
    }
  }

  Future<List<CustomerModel>> getCustomers({
    required int page,
    required int size,
    required String phoneNumber,
  }) async {
    try {
      final res = await customerRepository.getCustomers(
          page: 1, size: state.limit, phoneNumber: phoneNumber);
      return res;
    } catch (e) {
      rethrow;
    }
  }
}
