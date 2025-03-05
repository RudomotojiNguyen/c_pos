import 'package:c_pos/common/di/injection/injection.dart';

import '../../../data/datasources/local_data/local_storage.dart';
import '../../../data/datasources/local_data/user_storage.dart';
import '../../../data/repository/auth_repository.dart';
import '../../../data/repository/order_repository.dart';
import '../../../data/repository/store_repository.dart';
import '../../../data/repository/support_repositories.dart';
import '../../../data/repository/user_repositories.dart';
import '../../../presentation/journey/screen/global_bloc/global_core_bloc.dart';
import '../../../presentation/journey/screen/login/bloc/auth_bloc.dart';
import '../../../presentation/journey/screen/setting/bloc/setting_bloc.dart';
import '../../../presentation/journey/screen/store/bloc/store_bloc.dart';
import '../../base/di_module.dart';

class BlocModule extends DIModule {
  @override
  Future<void> provides() async {
    getIt
      ..registerLazySingleton(() => AuthBloc(
            authRepository: getIt.get<AuthRepository>(),
            localStorage: getIt.get<LocalStorage>(),
            userStorage: getIt.get<UserStorage>(),
            userRepositories: getIt.get<UserRepositories>(),
          ))
      ..registerLazySingleton(() => StoreBloc(
            storeRepository: getIt.get<StoreRepository>(),
            authBloc: getIt.get<AuthBloc>(),
          ))
      ..registerLazySingleton(() => SettingBloc())
      ..registerLazySingleton(() => GlobalCoreBloc(
            supportRepositories: getIt.get<SupportRepositories>(),
            orderRepository: getIt.get<OrderRepository>(),
          ));
  }
}
