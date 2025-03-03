import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../../../common/constants/app_constants.dart';
import '../local_storage.dart';

class LocalStorageImpl extends LocalStorage {
  final FlutterSecureStorage secureStorage;

  LocalStorageImpl({required this.secureStorage});

  @override
  Future<void> deleteAll() {
    return secureStorage.deleteAll();
  }

  @override
  Future<void> deleteKey({required String key}) {
    return secureStorage.delete(key: key);
  }

  @override
  Future<String?> read({required String key}) {
    return secureStorage.read(key: key);
  }

  @override
  Future<Map<String, String>> readAll() {
    return secureStorage.readAll();
  }

  @override
  Future<void> write({required String key, required String value}) {
    return secureStorage.write(key: key, value: value);
  }

  @override
  Future<String?> getAccessToken() {
    return secureStorage.read(key: CacheKeys.token);
  }

  @override
  Future<void> setAccessToken({String? token}) {
    return secureStorage.write(key: CacheKeys.token, value: token);
  }

  @override
  Future<void> deleteAccessToken() async {
    return secureStorage.delete(key: CacheKeys.token);
  }

  @override
  Future<void> deleteRefreshToken() {
    return secureStorage.delete(key: CacheKeys.refreshToken);
  }

  @override
  Future<String?> getRefreshToken() {
    return secureStorage.read(key: CacheKeys.refreshToken);
  }

  @override
  Future<void> setRefreshToken({String? token}) {
    return secureStorage.write(key: CacheKeys.refreshToken, value: token);
  }
}
