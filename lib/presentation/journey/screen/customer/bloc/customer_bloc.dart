import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../common/enum/enum.dart';
import '../../../../../data/models/customer_model.dart';
import '../../../../../data/models/customer_type_model.dart';
import '../../../../../data/models/response/page_info_entity.dart';
import '../../../../../data/models/response/paginated_response.dart';
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
  }) : super(CustomerInitial(
          customers: const [],
          pageInfo: PageInfoEntity(),
        )) {
    /// tìm khách hàng bằng SDT
    on<GetCustomerByPhoneEvent>(_onGetCustomers);

    /// tìm khách hàng bằng id
    on<GetCustomerByIdEvent>(_onGetCustomerInfo);

    /// lấy mã OTP để check DMEM hoặc dùng điểm
    on<GetOTPEvent>(_onGetOTP);

    /// check mã OTP cho DMEM hoặc  điểm
    on<CheckOTPEvent>(_onCheckOTP);
  }

  FutureOr<void> _onCheckOTP(
      CheckOTPEvent event, Emitter<CustomerState> emit) async {
    try {
      XToast.loading();
      emit(UpdateIsLoading(state: state));
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
    }
  }

  FutureOr<void> _onGetOTP(
      GetOTPEvent event, Emitter<CustomerState> emit) async {
    try {
      XToast.loading();
      emit(UpdateIsLoading(state: state));
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
    }
  }

  FutureOr<void> _onGetCustomerInfo(
      GetCustomerByIdEvent event, Emitter<CustomerState> emit) async {
    try {
      emit(IsLoadingCustomerDetail(state: state));
      final res = await customerRepository.getCustomerInfoById(
          customerId: event.customerId);
      emit(GetCustomerDetailSuccess(state: state, customer: res));
    } catch (e) {
      _loggerHelper.logError(message: 'GetCustomerByIdEvent', obj: e);
      // TODO: handle error
    }
  }

  FutureOr<void> _onGetCustomers(
      GetCustomerByPhoneEvent event, Emitter<CustomerState> emit) async {
    try {
      emit(IsLoadingGetCustomers(state: state));
      final res = await getCustomers(
        page: 1,
        size: state.pageInfo.getLimit,
        phoneNumber: event.phone,
      );

      emit(GetCustomersSuccess(
        state: state,
        customers: res.items,
        pageInfo: state.pageInfo.copyWith(
          page: 1,
          canLoadMore: res.items.length >= state.pageInfo.getLimit,
        ),
      ));
    } catch (e) {
      _loggerHelper.logError(message: 'GetCustomerByPhoneEvent', obj: e);
      // TODO: handle error
    }
  }

  Future<PaginatedResponse<CustomerModel>> getCustomers({
    required int page,
    required int size,
    String? phoneNumber,
  }) async {
    try {
      final res = await customerRepository.getCustomers(
        page: page,
        size: size,
        phoneNumber: phoneNumber,
      );
      return res;
    } catch (e) {
      rethrow;
    }
  }
}
