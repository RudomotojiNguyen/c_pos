import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../mixins/logger_helper.dart';

part 'setting_event.dart';
part 'setting_state.dart';

class SettingBloc extends Bloc<SettingEvent, SettingState> {
  // final SettingRepository settingRepository;
  final LoggerHelper loggerHelper = LoggerHelper();

  SettingBloc() : super(const SettingInitial()) {
    on<GetAppSettingEvent>(_onGetAppSetting);
    on<GetFeatureFlagEvent>(_onGetFeatureFlag);
  }

  FutureOr<void> _onGetAppSetting(
      GetAppSettingEvent event, Emitter<SettingState> emit) async {
    try {
      // emit(GetAppSettingLoading(state: state));
      // final res = await settingRepository.getSettingLinks();
      // emit(GetAppSettingSuccess(state: state, appSettingModel: res));
    } catch (e) {
      loggerHelper.logError(message: 'GetAppSetting', obj: e);
    } finally {
      //
    }
  }

  FutureOr<void> _onGetFeatureFlag(
      GetFeatureFlagEvent event, Emitter<SettingState> emit) async {
    try {
      // final res = await settingRepository.getFeatureFlag();
      // emit(GetFeatureFlagSuccess(
      //     state: state, userFeatureFlag: initialize(res)));
    } catch (e) {
      loggerHelper.logError(message: 'GetFeatureFlag', obj: e);
    } finally {
      //
    }
  }

  // CHuyển trừ string thành dạng set
  // Set<XFeatureFlagEnum> initialize(List<String> initialFlags) {
  //   Set<XFeatureFlagEnum> enabledFlags = {};

  //   for (var element in initialFlags) {
  //     enabledFlags.add(element.getXFeatureFlag);
  //   }

  //   return enabledFlags;
  // }

  // kiểm tra xem feature flag có được bật không
  // bool isFeatureEnabled(String flagName) {
  //   return state.userFeatureFlag.contains(flagName);
  // }
}
