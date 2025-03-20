import 'dart:async';
import 'package:dio/dio.dart';

import '../../../data/datasources/remote/auth_api.dart';
import '../../../data/datasources/remote/bill_api.dart';
import '../../../data/datasources/remote/category_api.dart';
import '../../../data/datasources/remote/commission_api.dart';
import '../../../data/datasources/remote/coupon_api.dart';
import '../../../data/datasources/remote/customer_api.dart';
import '../../../data/datasources/remote/employee_api.dart';
import '../../../data/datasources/remote/order_api.dart';
import '../../../data/datasources/remote/payment_api.dart';
import '../../../data/datasources/remote/product_api.dart';
import '../../../data/datasources/remote/stock_api.dart';
import '../../../data/datasources/remote/store_api.dart';
import '../../../data/datasources/remote/support_api.dart';
import '../../../data/datasources/remote/user_api.dart';
import '../../../data/datasources/remote/warranty_api.dart';
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
      ..registerLazySingleton(() => SupportApi(dio))
      ..registerLazySingleton(() => CommissionApi(dio))
      ..registerLazySingleton(() => BillApi(dio))
      ..registerLazySingleton(() => CustomerApi(dio))
      ..registerLazySingleton(() => ProductApi(dio))
      ..registerLazySingleton(() => StockApi(dio))
      ..registerLazySingleton(() => CategoryApi(dio))
      ..registerLazySingleton(() => EmployeeApi(dio))
      ..registerLazySingleton(() => WarrantyApi(dio))
      ..registerLazySingleton(() => CouponApi(dio))
      ..registerLazySingleton(() => PaymentApi(dio));
  }
}
