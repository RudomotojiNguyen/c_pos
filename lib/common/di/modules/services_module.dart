import '../../../data/datasources/remote/auth_api.dart';
import '../../../data/datasources/remote/order_api.dart';
import '../../../data/datasources/remote/store_api.dart';
import '../../../data/datasources/remote/support_api.dart';
import '../../../data/datasources/remote/user_api.dart';
import '../../../data/services/auth_services.dart';
import '../../../data/services/order_services.dart';
import '../../../data/services/store_services.dart';
import '../../../data/services/support_services.dart';
import '../../../data/services/user_services.dart';
import '../../base/di_module.dart';
import '../injection/injection.dart';

class ServicesModule extends DIModule {
  @override
  Future<void> provides() async {
    getIt
      ..registerLazySingleton<AuthServices>(
          () => AuthServicesImpl(authApi: getIt.get<AuthApi>()))
      ..registerLazySingleton<UserServices>(
          () => UserServicesImpl(userApi: getIt.get<UserApi>()))
      ..registerLazySingleton<StoreServices>(
          () => StoreServicesImpl(storeApi: getIt.get<StoreApi>()))
      ..registerLazySingleton<OrderServices>(
          () => OrderServicesImpl(orderApi: getIt.get<OrderApi>()))
      ..registerLazySingleton<SupportServices>(
          () => SupportServicesImpl(supportApi: getIt.get<SupportApi>()));
  }
}
