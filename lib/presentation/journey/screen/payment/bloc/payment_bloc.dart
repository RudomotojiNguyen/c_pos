import 'dart:async';

import 'package:c_pos/common/extensions/extension.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../common/enum/enum.dart';
import '../../../../../data/models/accountant_model.dart';
import '../../../../../data/models/enum_model.dart';
import '../../../../../data/models/installment_accounting_model.dart';
import '../../../../../data/repository/payment_repositories.dart';
import '../../../../mixins/logger_helper.dart';
import '../../login/bloc/auth_bloc.dart';

part 'payment_event.dart';
part 'payment_state.dart';

class PaymentBloc extends Bloc<PaymentEvent, PaymentState> {
  final PaymentRepositories paymentRepositories;
  final AuthBloc authBloc;
  final LoggerHelper _loggerHelper = LoggerHelper();

  PaymentBloc({required this.paymentRepositories, required this.authBloc})
      : super(const PaymentInitial(
            cashAccountants: [],
            transferAccountants: [],
            creditAccountants: [],
            installmentAccountants: [],
            paymentMethodsEnum: [])) {
    on<GetCashAccountsEvent>(_onGetCashAccountants);
    on<GetTransferAccountsEvent>(_onGetTransferAccounts);
    on<GetCreditAccountsEvent>(_onGetCreditAccounts);
    on<GetInstallmentAccountsEvent>(_onGetInstallmentAccounts);
    on<GetPaymentEnumEvent>(_onGetPaymentEnum);
  }

  FutureOr<void> _onGetCashAccountants(
      GetCashAccountsEvent event, Emitter<PaymentState> emit) async {
    try {
      emit(IsLoading(state: state, isLoading: true));
      final res = await paymentRepositories.getAccountantsByCash(
          storeId: authBloc.state.userInfo!.getStoreId);
      emit(UpdateCashAccountant(state: state, cashAccountants: res));
    } catch (e) {
      _loggerHelper.logError(message: 'GetCashAccountsEvent', obj: e);
    } finally {
      emit(IsLoading(state: state, isLoading: false));
    }
  }

  FutureOr<void> _onGetTransferAccounts(
      GetTransferAccountsEvent event, Emitter<PaymentState> emit) async {
    try {
      emit(IsLoading(state: state, isLoading: true));
      final res = await paymentRepositories.getAccountantsByTransfer(
        storeId: authBloc.state.userInfo!.getStoreId,
        moduleType: event.cartType.getModuleType,
      );
      emit(UpdateTransferAccountant(state: state, transferAccountants: res));
    } catch (e) {
      _loggerHelper.logError(message: 'GetTransferAccountsEvent', obj: e);
    } finally {
      emit(IsLoading(state: state, isLoading: false));
    }
  }

  FutureOr<void> _onGetCreditAccounts(
      GetCreditAccountsEvent event, Emitter<PaymentState> emit) async {
    try {
      emit(IsLoading(state: state, isLoading: true));
      final res = await paymentRepositories.getAccountantsByCredit(
        storeId: authBloc.state.userInfo!.getStoreId,
        moduleType: event.cartType.getModuleType,
      );
      emit(UpdateCreditAccountant(state: state, creditAccountants: res));
    } catch (e) {
      _loggerHelper.logError(message: 'GetCreditAccountsEvent', obj: e);
    } finally {
      emit(IsLoading(state: state, isLoading: false));
    }
  }

  FutureOr<void> _onGetInstallmentAccounts(
      GetInstallmentAccountsEvent event, Emitter<PaymentState> emit) async {
    try {
      emit(IsLoading(state: state, isLoading: true));
      final res = await paymentRepositories.getInstallmentAccounts();
      emit(UpdateInstallmentAccountant(
          state: state, installmentAccountants: res));
    } catch (e) {
      _loggerHelper.logError(message: 'GetInstallmentAccountsEvent', obj: e);
    } finally {
      emit(IsLoading(state: state, isLoading: false));
    }
  }

  FutureOr<void> _onGetPaymentEnum(
      GetPaymentEnumEvent event, Emitter<PaymentState> emit) async {
    try {
      emit(IsLoading(state: state, isLoading: true));
      final res = await paymentRepositories.getPaymentMethods();
      emit(UpdatePaymentEnum(state: state, paymentMethodsEnum: res));
    } catch (e) {
      _loggerHelper.logError(message: 'GetPaymentEnumEvent', obj: e);
    } finally {
      emit(IsLoading(state: state, isLoading: false));
    }
  }

  List<AccountantModel> searchCashAccountant({String? value}) {
    final currentValue = (value ?? '').toStrSearch;
    final result = state.cashAccountants
        .where(
          (element) => element.getName.toStrSearch.contains(currentValue),
        )
        .toList();
    return result.isEmpty ? state.cashAccountants : result;
  }

  List<AccountantModel> searchCreditAccountant({String? value}) {
    final currentValue = (value ?? '').toStrSearch;
    final result = state.creditAccountants
        .where(
          (element) => element.getName.toStrSearch.contains(currentValue),
        )
        .toList();
    return result.isEmpty ? state.creditAccountants : result;
  }

  List<AccountantModel> searchTransferAccountant({String? value}) {
    final currentValue = (value ?? '').toStrSearch;
    final result = state.transferAccountants
        .where(
          (element) => element.getName.toStrSearch.contains(currentValue),
        )
        .toList();
    return result.isEmpty ? state.transferAccountants : result;
  }

  List<InstallmentAccountingModel> searchInstallmentAccountant(
      {String? value}) {
    final currentValue = (value ?? '').toStrSearch;
    final result = state.installmentAccountants
        .where(
          (element) => element.getName.toStrSearch.contains(currentValue),
        )
        .toList();
    return result.isEmpty ? state.installmentAccountants : result;
  }
}
