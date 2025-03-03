part of '../user_repositories.dart';

class UserRepositoriesImpl implements UserRepositories {
  final UserServices userServices;

  UserRepositoriesImpl({required this.userServices});

  @override
  Future<bool> changePass(
      {required String oldPassword, required String newPassword}) {
    return userServices.changePass({
      'password': oldPassword,
      'newPassword': newPassword,
    });
  }

  @override
  Future<void> registerTokenDevice({required String token}) {
    return userServices.registerTokenDevice({'token': token});
  }

  @override
  Future<bool> resetPassword(
      {required String username, required String password}) {
    return userServices.resetPassword({
      'username': username,
      'password': password,
    });
  }
}
