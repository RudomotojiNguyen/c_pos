part of '../user_services.dart';

class UserServicesImpl implements UserServices {
  final UserApi userApi;

  UserServicesImpl({required this.userApi});

  @override
  Future<bool> changePass(Map<String, dynamic> params) {
    return userApi.changePass(params).then((value) => value.checkIsSuccess);
  }

  @override
  Future<void> registerTokenDevice(Map<String, dynamic> params) {
    return userApi.registerTokenDevice(params);
  }

  @override
  Future<bool> resetPassword(Map<String, dynamic> params) {
    return userApi.resetPassword(params).then((value) => value.checkIsSuccess);
  }
}
