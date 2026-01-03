abstract class LocalStorage {
  Future<String?> read({required String key});

  Future<void> write({required String key, required String value});

  Future<Map<String, String>> readAll();

  Future<void> deleteKey({required String key});

  Future<void> deleteAll();

  ///token
  Future<String?> getAccessToken();

  Future<void> deleteAccessToken();

  Future<void> setAccessToken({String? token});

  ///refresh token
  Future<String?> getRefreshToken();

  Future<void> deleteRefreshToken();

  Future<void> setRefreshToken({String? token});

  /// company id
  Future<String?> getCompanyId();

  Future<void> setCompanyId({String? companyId});

  Future<void> deleteCompanyId();
}
