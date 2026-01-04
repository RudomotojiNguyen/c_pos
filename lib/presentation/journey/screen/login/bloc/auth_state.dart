part of 'auth_bloc.dart';

@immutable
sealed class AuthState extends Equatable {
  final AuthModel? userInfo;
  final CompanyModel? userCompany;
  final StoreModel? currentUserStore;

  const AuthState({
    this.userInfo,
    this.userCompany,
    this.currentUserStore,
  });

  @override
  List<Object?> get props => [userInfo, userCompany, currentUserStore];

  int get getUserId => userInfo?.getUserId ?? -1;

  int get getUserStoreId => userInfo?.getStoreId ?? -1;

  String get getUserStoreName => userInfo?.getStoreName ?? '';

  /// lưu lại sau
  int? get getUserCompanyId => userCompany?.id;
}

final class AuthInitial extends AuthState {}

final class LoginSuccess extends AuthState {
  const LoginSuccess({required AuthState state, required super.userInfo});
}

final class GetProfileSuccess extends AuthState {
  const GetProfileSuccess({
    required AuthState state,
    required super.userInfo,
  });
}

final class LogoutSuccess extends AuthState {
  const LogoutSuccess({required AuthState state})
      : super(userInfo: null, userCompany: null, currentUserStore: null);
}

final class ChangePassLoading extends AuthState {
  ChangePassLoading({required AuthState state})
      : super(
            userInfo: state.userInfo,
            userCompany: state.userCompany,
            currentUserStore: state.currentUserStore);
}

final class ChangePassSuccess extends AuthState {
  ChangePassSuccess({required AuthState state})
      : super(
            userInfo: state.userInfo,
            userCompany: state.userCompany,
            currentUserStore: state.currentUserStore);
}

final class ChangePassError extends AuthState {
  ChangePassError({required AuthState state})
      : super(
            userInfo: state.userInfo,
            userCompany: state.userCompany,
            currentUserStore: state.currentUserStore);
}

final class UpdateCurrentUserStoreSuccess extends AuthState {
  UpdateCurrentUserStoreSuccess(
      {required AuthState state, required super.currentUserStore})
      : super(
          userInfo: state.userInfo,
          userCompany: state.userCompany,
        );
}

final class UpdateCurrentUserCompanySuccess extends AuthState {
  UpdateCurrentUserCompanySuccess(
      {required AuthState state, required super.userCompany})
      : super(
            userInfo: state.userInfo, currentUserStore: state.currentUserStore);
}
