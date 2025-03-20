import 'dart:async';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../../data/datasources/local_data/impl/local_storage_impl.dart';
import '../../../data/datasources/local_data/local_data.dart';
import '../../base/di_module.dart';
import '../injection/injection.dart';

class LocalDataSourceModule extends DIModule {
  @override
  Future<void> provides() async {
    getIt
      ..registerLazySingleton(() => const FlutterSecureStorage(
          aOptions: AndroidOptions(encryptedSharedPreferences: true)))
      ..registerLazySingleton<LocalStorage>(() =>
          LocalStorageImpl(secureStorage: getIt.get<FlutterSecureStorage>()))
      ..registerLazySingleton<UserStorage>(() => UserStorageImpl())
      ..registerLazySingleton<DraftingStorage>(() => DraftingStorageImpl());
  }
}
