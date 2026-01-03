import 'dart:async';

import 'package:c_pos/common/extensions/extension.dart';
import 'package:c_pos/presentation/journey/screen/login/bloc/auth_bloc.dart';
import 'package:collection/collection.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../common/constants/app_constants.dart';
import '../../../../common/di/injection/injection.dart';
import '../../../../common/enum/enum.dart';
import 'package:c_pos/data/models/models.dart';
import '../../../../data/datasources/local_data/local_storage.dart';
import '../../../../data/models/company_model.dart';
import '../../../../data/services/services.dart';
import '../../../mixins/logger_helper.dart';

part 'global_core_event.dart';
part 'global_core_state.dart';

class GlobalCoreBloc extends Bloc<GlobalCoreEvent, GlobalCoreState> {
  final OrderServices orderServices;
  final CompanyServices companyServices;
  final AuthBloc authBloc;
  final LocalStorage localStorage;

  final LoggerHelper _loggerHelper = LoggerHelper();

  GlobalCoreBloc({
    required this.orderServices,
    required this.companyServices,
    required this.authBloc,
    required this.localStorage,
  }) : super(const GlobalCoreInitial(
          orderStatus: [],
          cancelStatus: [],
          orderSource: [],
          orderType: [],
          companies: [],
        )) {
    /// Xử lý sự kiện lấy trạng thái đơn hàng
    on<GetOrderStatusEvent>(_onGetOrderStatus);

    /// Xử lý sự kiện lấy nguồn đơn
    on<GetOrderSourceEvent>(_onGetOrderSource);

    /// Xử lý sự kiện lấy loại đơn
    on<GetOrderTypeEvent>(_onGetOrderType);

    /// Xử lý sự kiện lấy danh sách công ty
    on<GetUserCompaniesEvent>(_onGetUserCompanies);
  }

  FutureOr<void> _onGetUserCompanies(
      GetUserCompaniesEvent event, Emitter<GlobalCoreState> emit) async {
    try {
      final res = await companyServices.getCompanies();
      emit(GetUserCompaniesSuccess(
        state: state,
        companies: res,
      ));
      if (res.isEmpty) return;

      /// todo: lấy thành công thì cập nhật authbloc

      final companyId = await localStorage.getCompanyId();

      /// nếu có company id thì cập nhật authbloc
      if (companyId.isNotNullOrEmpty) {
        final company =
            res.firstWhereOrNull((company) => company.id == companyId?.toInt());
        if (company != null) {
          authBloc.add(UpdateCurrentUserCompanyEvent(company: company));
          return;
        }
      }

      /// nếu không có company id thì cập nhật authbloc
      final userCurrentCompany = res.firstWhereOrNull(
          (company) => company.id == authBloc.state.getUserCompanyId);

      if (userCurrentCompany != null) {
        authBloc
            .add(UpdateCurrentUserCompanyEvent(company: userCurrentCompany));
        return;
      } else {
        authBloc.add(UpdateCurrentUserCompanyEvent(company: res.first));
        return;
      }
    } catch (e) {
      _loggerHelper.logError(message: 'GetUserCompaniesEvent', obj: e);
    }
  }

  FutureOr<void> _onGetOrderType(
      GetOrderTypeEvent event, Emitter<GlobalCoreState> emit) async {
    try {
      final res = DataConstants.orderType;
      emit(GetOrderTypeSuccess(
        state: state,
        orderType: res,
      ));
    } catch (e) {
      _loggerHelper.logError(message: 'GetOrderTypeEvent', obj: e);
    }
  }

  FutureOr<void> _onGetOrderStatus(
      GetOrderStatusEvent event, Emitter<GlobalCoreState> emit) async {
    try {
      final AuthBloc authBloc = getIt.get<AuthBloc>();
      final AuthModel? userInfo = authBloc.state.userInfo;

      List<BaseEnumModel> res = [];

      if (userInfo != null) {
        switch (userInfo.getJob) {
          //CR
          case XJobTitle.qlCskh:
          case XJobTitle.cskh:
          case XJobTitle.ctvCskh:
            res = DataConstants.orderStatusCr;
            break;

          //SHOP
          case XJobTitle.asm:
          case XJobTitle.ql:
          case XJobTitle.tl:
          case XJobTitle.ktbh:
          case XJobTitle.tvbh:
          case XJobTitle.ktpm:
          case XJobTitle.tdkh:
          case XJobTitle.ktpc:
            res = DataConstants.orderStatusShop;
            break;

          //DP
          case XJobTitle.dp:
          case XJobTitle.qlDp:
            res = DataConstants.orderStatusDp;
            break;

          // còn lại
          default:
            res = DataConstants.orderStatus;
            break;
        }
      }

      emit(GetOrderStatusSuccess(
        state: state,
        orderStatus: res,
      ));
    } catch (e) {
      _loggerHelper.logError(message: 'GetOrderStatusEvent', obj: e);
    }
  }

  FutureOr<void> _onGetOrderSource(
      GetOrderSourceEvent event, Emitter<GlobalCoreState> emit) async {
    try {
      final res = await orderServices.getOrderSource();
      emit(GetOrderSourceSuccess(
        state: state,
        orderSource: res,
      ));
    } catch (e) {
      _loggerHelper.logError(message: 'GetOrderSourceEvent', obj: e);
    }
  }

  ///
  /// METHOD
  ///
  Future<List<BaseEnumModel>> searchOrderSource(String? value) async {
    try {
      final currentValue = (value ?? '').toStrSearch;
      final result = state.orderSource
          .where(
            (element) => element.getName.toStrSearch.contains(currentValue),
          )
          .toList();
      return result.isEmpty ? state.orderSource : result;
    } catch (e) {
      return [];
    }
  }

  Future<List<BaseEnumModel>> searchOrderType(String? value) async {
    try {
      final currentValue = (value ?? '').toStrSearch;
      final result = state.orderType
          .where(
            (element) => element.getName.toStrSearch.contains(currentValue),
          )
          .toList();
      return result.isEmpty ? state.orderType : result;
    } catch (e) {
      return [];
    }
  }

  Future<List<BaseEnumModel>> searchOrderStatus(String? value) async {
    try {
      final currentValue = (value ?? '').toStrSearch;
      final result = state.orderStatus
          .where(
            (element) => element.getName.toStrSearch.contains(currentValue),
          )
          .toList();
      return result.isEmpty ? state.orderStatus : result;
    } catch (e) {
      return [];
    }
  }
}
