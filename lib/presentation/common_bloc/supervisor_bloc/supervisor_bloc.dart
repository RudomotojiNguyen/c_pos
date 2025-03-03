import 'package:flutter_bloc/flutter_bloc.dart';

import '../../mixins/logger_helper.dart';

class SupervisorBloc extends BlocObserver {
  final LoggerHelper loggerHelper = LoggerHelper();

  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    loggerHelper.logDebug(message: 'onEvent', obj: event);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    loggerHelper.logDebug(
        message:
            'onTransition \n-> current state: ${transition.currentState.toString()} \n-> next state: ${transition.nextState.toString()}');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    loggerHelper.logError(message: 'onError', obj: error);
    super.onError(bloc, error, stackTrace);
  }
}
