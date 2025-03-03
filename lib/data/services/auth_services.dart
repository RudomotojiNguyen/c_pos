import '../datasources/remote/auth_api.dart';
import '../models/auth_model.dart';

part 'impl/auth_services_impl.dart';

abstract class AuthServices {
  Future<AuthModel?> login({
    required String username,
    required String password,
  });
}
