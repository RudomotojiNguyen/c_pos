import '../datasources/remote/api_remote.dart';

part 'impl/user_services_impl.dart';

abstract class UserServices {
  Future<void> registerTokenDevice(Map<String, dynamic> params);

  Future<bool> changePass({
    required String oldPassword,
    required String newPassword,
  });

  Future<bool> resetPassword(Map<String, dynamic> params);
}
