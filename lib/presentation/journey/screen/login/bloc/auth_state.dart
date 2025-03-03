part of 'auth_bloc.dart';

@immutable
sealed class AuthState extends Equatable {
  final AuthModel? userInfo;

  const AuthState({
    this.userInfo,
  });

  @override
  List<Object?> get props => [userInfo];

  int get getUserId => userInfo?.getUserId ?? -1;

  int get getUserStoreId => userInfo?.getStoreId ?? -1;

  String get getUserStoreName => userInfo?.getStoreName ?? '';
}

final class AuthInitial extends AuthState {}

final class LoginSuccess extends AuthState {
  const LoginSuccess({required AuthState state, required super.userInfo});
}

final class GetProfileSuccess extends AuthState {
  const GetProfileSuccess({required AuthState state, required super.userInfo});
}

final class LogoutSuccess extends AuthState {
  const LogoutSuccess({required AuthState state}) : super(userInfo: null);
}

final class ChangePassLoading extends AuthState {
  ChangePassLoading({required AuthState state})
      : super(userInfo: state.userInfo);
}

final class ChangePassSuccess extends AuthState {
  ChangePassSuccess({required AuthState state})
      : super(userInfo: state.userInfo);
}

final class ChangePassError extends AuthState {
  ChangePassError({required AuthState state}) : super(userInfo: state.userInfo);
}
