import 'package:c_pos/common/di/injection/injection.dart';
import 'package:c_pos/presentation/journey/screen/drafting_invoice/detail/bloc/drafting_invoice_bloc.dart';

import '../../../data/datasources/local_data/local_data.dart';
import '../../../data/repository/address_repositories.dart';
import '../../../data/repository/affiliate_commission_repositories.dart';
import '../../../data/repository/auth_repository.dart';
import '../../../data/repository/bill_repository.dart';
import '../../../data/repository/category_repository.dart';
import '../../../data/repository/coupon_repository.dart';
import '../../../data/repository/customer_repository.dart';
import '../../../data/repository/employee_repositories.dart';
import '../../../data/repository/order_repository.dart';
import '../../../data/repository/payment_repositories.dart';
import '../../../data/repository/product_repository.dart';
import '../../../data/repository/stock_repository.dart';
import '../../../data/repository/store_repository.dart';
import '../../../data/repository/user_repositories.dart';
import '../../../data/repository/warranty_repositories.dart';
import '../../../presentation/journey/screen/address/bloc/address_bloc.dart';
import '../../../presentation/journey/screen/bill/list/bloc/bill_bloc.dart';
import '../../../presentation/journey/screen/category/bloc/category_bloc.dart';
import '../../../presentation/journey/screen/commission/bloc/affiliate_bloc.dart';
import '../../../presentation/journey/screen/coupon/bloc/coupon_bloc.dart';
import '../../../presentation/journey/screen/customer/bloc/customer_bloc.dart';
import '../../../presentation/journey/screen/drafting_invoice/list/bloc/drafting_invoices_bloc.dart';
import '../../../presentation/journey/screen/employee/bloc/employee_bloc.dart';
import '../../../presentation/journey/screen/global_bloc/global_core_bloc.dart';
import '../../../presentation/journey/screen/login/bloc/auth_bloc.dart';
import '../../../presentation/journey/screen/order/bloc/order_bloc.dart';
import '../../../presentation/journey/screen/payment/bloc/payment_bloc.dart';
import '../../../presentation/journey/screen/product/bloc/product_bloc.dart';
import '../../../presentation/journey/screen/scan/bloc/scan_bloc.dart';
import '../../../presentation/journey/screen/search/bloc/search_product_bloc.dart';
import '../../../presentation/journey/screen/setting/bloc/setting_bloc.dart';
import '../../../presentation/journey/screen/stock/bloc/stock_bloc.dart';
import '../../../presentation/journey/screen/store/bloc/store_bloc.dart';
import '../../../presentation/journey/screen/warranty/bloc/warranty_bloc.dart';
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
          draftingStorage: getIt.get<DraftingStorage>()))
      ..registerLazySingleton(() => StoreBloc(
          storeRepository: getIt.get<StoreRepository>(),
          authBloc: getIt.get<AuthBloc>()))
      ..registerLazySingleton(() => SettingBloc())
      ..registerLazySingleton(
          () => GlobalCoreBloc(orderRepository: getIt.get<OrderRepository>()))
      ..registerFactory(
          () => AffiliateBloc(getIt.get<AffiliateCommissionRepositories>()))
      ..registerFactory(() => BillBloc(
          billRepository: getIt.get<BillRepository>(),
          authBloc: getIt.get<AuthBloc>()))
      ..registerFactory(() =>
          CustomerBloc(customerRepository: getIt.get<CustomerRepository>()))
      ..registerFactory(
          () => OrderBloc(orderRepository: getIt.get<OrderRepository>()))
      ..registerFactory(() => ProductBloc(getIt.get<ProductRepository>()))
      ..registerFactory(() => StockBloc(
          productRepository: getIt.get<ProductRepository>(),
          stockRepository: getIt.get<StockRepository>()))
      ..registerLazySingleton(() =>
          CategoryBloc(categoryRepository: getIt.get<CategoryRepository>()))
      ..registerLazySingleton(() => DraftingInvoiceBloc(
            draftingStorage: getIt.get<DraftingStorage>(),
            productRepository: getIt.get<ProductRepository>(),
            billRepository: getIt.get<BillRepository>(),
            orderRepository: getIt.get<OrderRepository>(),
          ))
      ..registerLazySingleton(() =>
          DraftingInvoicesBloc(draftingStorage: getIt.get<DraftingStorage>()))
      ..registerFactory(() => EmployeeBloc(getIt.get<EmployeeRepositories>()))
      ..registerFactory(() => WarrantyBloc(getIt.get<WarrantyRepositories>()))
      ..registerFactory(() => CouponBloc(
          authBloc: getIt.get<AuthBloc>(),
          couponRepository: getIt.get<CouponRepository>()))
      ..registerFactory(() => PaymentBloc(
          paymentRepositories: getIt.get<PaymentRepositories>(),
          authBloc: getIt.get<AuthBloc>()))
      ..registerFactory(() => SearchProductBloc(
            productRepository: getIt.get<ProductRepository>(),
            stockRepository: getIt.get<StockRepository>(),
          ))
      ..registerFactory(() => ScanBloc())
      ..registerFactory(() =>
          AddressBloc(addressRepositories: getIt.get<AddressRepositories>()));
  }
}
