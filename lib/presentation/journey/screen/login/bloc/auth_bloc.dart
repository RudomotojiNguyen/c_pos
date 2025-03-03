import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../../../../data/datasources/local_data/local_storage.dart';
import '../../../../../data/models/auth_model.dart';
import '../../../../../data/repository/auth_repository.dart';
import '../../../../../data/repository/user_repositories.dart';
import '../../../../mixins/logger_helper.dart';
import '../../../../widgets/widgets.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository authRepository;
  final UserRepositories userRepositories;
  final LocalStorage localStorage;
  // final UserLocalDataSource userLocalDataSource;
  // final CartStorage cartStorage;
  final LoggerHelper _loggerHelper = LoggerHelper();

  AuthBloc({
    required this.authRepository,
    required this.userRepositories,
    required this.localStorage,
    // required this.userLocalDataSource,
    // required this.cartStorage,
  }) : super(AuthInitial()) {
    on<LoginEvent>(_onLogin);
    on<LogoutEvent>(_onLogout);
    on<GetUserProfileEvent>(_onGetUserProfile);
    on<ChangePasswordEvent>(_onChangePassword);
  }

  FutureOr<void> _onChangePassword(
      ChangePasswordEvent event, Emitter<AuthState> emit) async {
    try {
      emit(ChangePassLoading(state: state));
      await userRepositories.changePass(
          oldPassword: event.password, newPassword: event.newPassword);
      emit(ChangePassSuccess(state: state));
    } catch (e) {
      _loggerHelper.logError(message: 'ChangePasswordEvent', obj: e);
      XToast.showNegativeMessage(message: e.toString());
      emit(ChangePassError(state: state));
    }
  }

  FutureOr<void> _onGetUserProfile(
      GetUserProfileEvent event, Emitter<AuthState> emit) async {
    try {
      // final users = await userLocalDataSource.getAll();
      // final token = await localStorage.getAccessToken();
      // if (token.isNullOrEmpty) {
      //   emit(LogoutSuccess(state: state));
      //   return;
      // }
      // if (users?.isNotEmpty ?? false) {
      //   final UserTable userStorage = users!.first;
      //   final AuthModel auth = AuthModel(
      //     userId: userStorage.id,
      //     storeId: userStorage.storeId,
      //     storeName: userStorage.storeName,
      //     employeeId: userStorage.employeeId,
      //     isActive: 1,
      //     accessToken: token,
      //     jobTitleId: userStorage.jobTitleId,
      //     employee: userStorage,
      //   );
      //   emit(GetProfileSuccess(state: state, userInfo: auth));
      // } else {
      //   await Future.wait([
      //     localStorage.deleteAccessToken(),
      //     userLocalDataSource.deleteAll(),
      //     cartStorage.clearCart(),
      //   ]);
      //   emit(LogoutSuccess(state: state));
      // }
    } catch (e) {
      _loggerHelper.logError(message: 'GetUserProfileEvent', obj: e);
      // await Future.wait([
      //   localStorage.deleteAccessToken(),
      //   userLocalDataSource.deleteAll(),
      //   cartStorage.clearCart(),
      // ]);
      // emit(LogoutSuccess(state: state));
    }
  }

  FutureOr<void> _onLogin(LoginEvent event, Emitter<AuthState> emit) async {
    try {
      XToast.loading();
      final res = await authRepository.login(
          username: event.username, password: event.password);
      if (res != null) {
        await localStorage.setAccessToken(token: res.accessToken);
        // await userLocalDataSource.insertOrUpdateItem(
        //     (res.employeeId ?? '').toString(),
        //     (res.employee ?? EmployeeModel())
        //         .copyWith(storeName: res.storeName));
        XToast.closeAllLoading();
        emit(LoginSuccess(state: state, userInfo: res));
      }
    } catch (e) {
      _loggerHelper.logError(message: 'LoginEvent', obj: e);
      XToast.closeAllLoading();
    }
  }

  FutureOr<void> _onLogout(LogoutEvent event, Emitter<AuthState> emit) async {
    try {
      XToast.loading();

      await Future.wait([
        localStorage.deleteAccessToken(),
        // userLocalDataSource.deleteAll(),
        // cartStorage.clearCart(),
      ]);

      emit(LogoutSuccess(state: state));
    } catch (e) {
      _loggerHelper.logError(message: 'LogoutEvent', obj: e);
    } finally {
      XToast.closeAllLoading();
    }
  }

  ///
  ///
  ///

  Future<AuthModel?> onLogin(
      {required String username, required String password}) async {
    final res =
        await authRepository.login(username: username, password: password);

    if (res != null) {
      await Future.wait([
        localStorage.setAccessToken(token: res.accessToken),
        // userLocalDataSource.insertOrUpdateItem(
        //     (res.employeeId ?? '').toString(),
        //     (res.employee ?? EmployeeModel())
        //         .copyWith(storeName: res.storeName)),
      ]);
      add(GetUserProfileEvent());
    }

    return res;
  }
}
