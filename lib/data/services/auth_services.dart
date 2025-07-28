import '../datasources/remote/api_remote.dart';
import '../models/auth_model.dart';

part 'impl/auth_services_impl.dart';

abstract class AuthServices {
  Future<AuthModel?> login({
    required String username,
    required String password,
  });
}
