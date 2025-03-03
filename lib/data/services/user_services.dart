import '../datasources/remote/user_api.dart';

part 'impl/user_services_impl.dart';

abstract class UserServices {
  Future<void> registerTokenDevice(Map<String, dynamic> params);

  Future<bool> changePass(Map<String, dynamic> params);

  Future<bool> resetPassword(Map<String, dynamic> params);
}
