import 'dart:async';
import 'package:dio/dio.dart';

import '../../../data/datasources/remote/api_remote.dart';
import '../../base/di_module.dart';
import '../../configs/configurations.dart';
import '../../network/dio_client.dart';
import '../../network/interceptor/network_interceptor.dart';
import '../injection/injection.dart';

class ApiModule extends DIModule {
  @override
  Future<void> provides() async {
    Configurations coreConfiguration = getIt.get<Configurations>();

    final dio = await DioClient.setup(
      interceptor: getIt.get<NetworkInterceptor>(),
      baseUrl: coreConfiguration.baseReadUrl,
      isProduct: coreConfiguration.isProduct,
    );

    getIt
      ..registerLazySingleton<Dio>(() => dio)
      ..registerLazySingleton(() => AuthApi(dio))
      ..registerLazySingleton(() => UserApi(dio))
      ..registerLazySingleton(() => StoreApi(dio))
      ..registerLazySingleton(() => OrderApi(dio))
      ..registerLazySingleton(() => CommissionApi(dio))
      ..registerLazySingleton(() => BillApi(dio))
      ..registerLazySingleton(() => CustomerApi(dio))
      ..registerLazySingleton(() => ProductApi(dio))
      ..registerLazySingleton(() => StockApi(dio))
      ..registerLazySingleton(() => CategoryApi(dio))
      ..registerLazySingleton(() => EmployeeApi(dio))
      ..registerLazySingleton(() => WarrantyApi(dio))
      ..registerLazySingleton(() => CouponApi(dio))
      ..registerLazySingleton(() => PaymentApi(dio))
      ..registerLazySingleton(() => AddressApi(dio))
      ..registerLazySingleton(() => TradeInApi(dio))
      ..registerLazySingleton(() => VoucherApi(dio))
      ..registerLazySingleton(() => FileApi(dio));
  }
}
