import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../mixins/logger_helper.dart';

part 'main_event.dart';
part 'main_state.dart';

enum TabIndex { tool, profile, home, chart }

class MainBloc extends Bloc<MainEvent, MainState> {
  final LoggerHelper _loggerHelper = LoggerHelper();

  MainBloc() : super(const MainInitial(tabIndex: TabIndex.tool)) {
    /// Xử lý sự kiện thay đổi tab
    on<ChangeTabEvent>(_onChangeTab);
  }

  Future<void> _onChangeTab(
      ChangeTabEvent event, Emitter<MainState> emit) async {
    try {
      emit(UpdateInTabSelect(state: state, tabIndex: event.tabIndex));
    } catch (e) {
      _loggerHelper.logError(message: 'ChangeTabEvent', obj: e);
    }
  }
}
