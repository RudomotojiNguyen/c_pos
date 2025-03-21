import 'package:c_pos/common/di/injection/injection.dart';

import '../../../data/datasources/local_data/local_storage.dart';
import '../../../data/datasources/local_data/user_storage.dart';
import '../../../data/repository/affiliate_commission_repositories.dart';
import '../../../data/repository/auth_repository.dart';
import '../../../data/repository/bill_repository.dart';
import '../../../data/repository/category_repository.dart';
import '../../../data/repository/customer_repository.dart';
import '../../../data/repository/order_repository.dart';
import '../../../data/repository/product_repository.dart';
import '../../../data/repository/stock_repository.dart';
import '../../../data/repository/store_repository.dart';
import '../../../data/repository/support_repositories.dart';
import '../../../data/repository/user_repositories.dart';
import '../../../presentation/journey/screen/bill/list/bloc/bill_bloc.dart';
import '../../../presentation/journey/screen/category/bloc/category_bloc.dart';
import '../../../presentation/journey/screen/commission/bloc/affiliate_bloc.dart';
import '../../../presentation/journey/screen/customer/bloc/customer_bloc.dart';
import '../../../presentation/journey/screen/global_bloc/global_core_bloc.dart';
import '../../../presentation/journey/screen/login/bloc/auth_bloc.dart';
import '../../../presentation/journey/screen/order/bloc/order_bloc.dart';
import '../../../presentation/journey/screen/product/bloc/product_bloc.dart';
import '../../../presentation/journey/screen/setting/bloc/setting_bloc.dart';
import '../../../presentation/journey/screen/stock/bloc/stock_bloc.dart';
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
          ))
      ..registerFactory(
          () => AffiliateBloc(getIt.get<AffiliateCommissionRepositories>()))
      ..registerFactory(() => BillBloc(
            billRepository: getIt.get<BillRepository>(),
            authBloc: getIt.get<AuthBloc>(),
          ))
      ..registerFactory(() =>
          CustomerBloc(customerRepository: getIt.get<CustomerRepository>()))
      ..registerFactory(
          () => OrderBloc(orderRepository: getIt.get<OrderRepository>()))
      ..registerFactory(() => ProductBloc(getIt.get<ProductRepository>()))
      ..registerFactory(() => StockBloc(
            productRepository: getIt.get<ProductRepository>(),
            stockRepository: getIt.get<StockRepository>(),
          ))
      ..registerLazySingleton(() => CategoryBloc(
            categoryRepository: getIt.get<CategoryRepository>(),
          ));
  }
}
