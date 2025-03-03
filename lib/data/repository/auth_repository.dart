import '../models/auth_model.dart';
import '../services/auth_services.dart';

part 'impl/auth_repository_impl.dart';

abstract class AuthRepository {
  Future<AuthModel?> login({
    required String username,
    required String password,
  });
}
