part of '../auth_services.dart';

class AuthServicesImpl implements AuthServices {
  final AuthApi authApi;

  AuthServicesImpl({required this.authApi});

  @override
  Future<AuthModel?> login(
      {required String username, required String password}) async {
    final res = await authApi.login({
      "username": username,
      "password": password,
    });
    if (res.data != null) {
      return AuthModel.fromJson(res.data!);
    }
    return null;
  }
}
