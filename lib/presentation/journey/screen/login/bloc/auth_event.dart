part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}

class LoginEvent extends AuthEvent {
  final String username;
  final String password;

  LoginEvent({
    required this.username,
    required this.password,
  });
}

class LogoutEvent extends AuthEvent {}

class GetUserProfileEvent extends AuthEvent {}

class ChangePasswordEvent extends AuthEvent {
  final String password;
  final String newPassword;

  ChangePasswordEvent({required this.password, required this.newPassword});
}
