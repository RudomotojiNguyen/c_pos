import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:c_pos/common/extensions/extension.dart';
import 'package:c_pos/data/models/employee_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../../../../data/datasources/local_data/local_storage.dart';
import '../../../../../data/datasources/local_data/user_storage.dart';
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
  final UserStorage userStorage;
  // final CartStorage cartStorage;
  final LoggerHelper _loggerHelper = LoggerHelper();

  AuthBloc({
    required this.authRepository,
    required this.userRepositories,
    required this.localStorage,
    required this.userStorage,
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
      final user = await userStorage.getUser();
      final token = await localStorage.getAccessToken();
      if (token.isNullOrEmpty) {
        emit(LogoutSuccess(state: state));
        return;
      }

      if (user != null) {
        final auth = AuthModel(
          userId: user.userId,
          storeId: user.storeId,
          storeName: user.storeName,
          employeeId: user.employeeId,
          isActive: user.isActive,
          accessToken: token,
          jobTitleId: user.jobTitleId,
          employee: EmployeeModel(
            id: user.employeeId,
            code: user.userCode,
            fullName: user.fullName,
            storeName: user.storeName,
          ),
        );
        emit(GetProfileSuccess(state: state, userInfo: auth));
      } else {
        await Future.wait([
          localStorage.deleteAccessToken(),
          userStorage.deleteUser(user),
        ]);
        emit(LogoutSuccess(state: state));
      }
    } catch (e) {
      final user = await userStorage.getUser();
      _loggerHelper.logError(message: 'GetUserProfileEvent', obj: e);
      await Future.wait([
        localStorage.deleteAccessToken(),
        userStorage.deleteUser(user),
      ]);
      emit(LogoutSuccess(state: state));
    }
  }

  FutureOr<void> _onLogin(LoginEvent event, Emitter<AuthState> emit) async {
    try {
      XToast.loading();
      final res = await authRepository.login(
          username: event.username, password: event.password);
      if (res != null) {
        await Future.wait([
          localStorage.setAccessToken(token: res.accessToken),
          userStorage.saveUser(res.convertToUserTable),
        ]);
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
      final user = await userStorage.getUser();
      await Future.wait([
        localStorage.deleteAccessToken(),
        userStorage.deleteUser(user),
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
        userStorage.saveUser(res.convertToUserTable),
      ]);
      add(GetUserProfileEvent());
    }

    return res;
  }
}
