import '../../../data/repository/auth_repository.dart';
import '../../../data/repository/order_repository.dart';
import '../../../data/repository/store_repository.dart';
import '../../../data/repository/support_repositories.dart';
import '../../../data/repository/user_repositories.dart';
import '../../../data/services/auth_services.dart';
import '../../../data/services/order_services.dart';
import '../../../data/services/store_services.dart';
import '../../../data/services/support_services.dart';
import '../../../data/services/user_services.dart';
import '../../base/di_module.dart';
import '../injection/injection.dart';

class RepositoryModule extends DIModule {
  @override
  Future<void> provides() async {
    getIt
      ..registerLazySingleton<AuthRepository>(
          () => AuthRepositoryImpl(authServices: getIt.get<AuthServices>()))
      ..registerLazySingleton<UserRepositories>(
          () => UserRepositoriesImpl(userServices: getIt.get<UserServices>()))
      ..registerLazySingleton<StoreRepository>(
          () => StoreRepositoryImpl(storeServices: getIt.get<StoreServices>()))
      ..registerLazySingleton<OrderRepository>(
          () => OrderRepositoryImpl(orderServices: getIt.get<OrderServices>()))
      ..registerLazySingleton<SupportRepositories>(() =>
          SupportRepositoriesImpl(
              supportServices: getIt.get<SupportServices>()));
  }
}
