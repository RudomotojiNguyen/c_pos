part of '../auth_repository.dart';

class AuthRepositoryImpl extends AuthRepository {
  final AuthServices authServices;

  AuthRepositoryImpl({
    required this.authServices,
  });

  @override
  Future<AuthModel?> login(
      {required String username, required String password}) {
    return authServices.login(username: username, password: password);
  }
}
