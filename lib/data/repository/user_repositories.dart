import '../services/user_services.dart';

part 'impl/user_repositories_impl.dart';

abstract class UserRepositories {
  Future<void> registerTokenDevice({required String token});

  Future<bool> changePass({
    required String oldPassword,
    required String newPassword,
  });

  Future<bool> resetPassword({
    required String username,
    required String password,
  });
}
