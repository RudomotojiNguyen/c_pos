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
import '../../../data/services/address_services.dart';
import '../../../data/services/affiliate_commission_services.dart';
import '../../../data/services/auth_services.dart';
import '../../../data/services/bill_services.dart';
import '../../../data/services/category_service.dart';
import '../../../data/services/coupon_services.dart';
import '../../../data/services/customer_services.dart';
import '../../../data/services/employee_services.dart';
import '../../../data/services/order_services.dart';
import '../../../data/services/payment_services.dart';
import '../../../data/services/product_services.dart';
import '../../../data/services/stock_services.dart';
import '../../../data/services/store_services.dart';
import '../../../data/services/user_services.dart';
import '../../../data/services/warranty_services.dart';
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
      ..registerLazySingleton<AffiliateCommissionRepositories>(() =>
          AffiliateCommissionRepositoriesImpl(
              affiliateCommissionServices:
                  getIt.get<AffiliateCommissionServices>()))
      ..registerLazySingleton<BillRepository>(
          () => BillRepositoryImpl(billServices: getIt.get<BillServices>()))
      ..registerLazySingleton<CustomerRepository>(() => CustomerRepositoryImpl(
          customerServices: getIt.get<CustomerServices>()))
      ..registerLazySingleton<ProductRepository>(() =>
          ProductRepositoryImpl(productServices: getIt.get<ProductServices>()))
      ..registerLazySingleton<StockRepository>(
          () => StockRepositoryImpl(stockServices: getIt.get<StockServices>()))
      ..registerLazySingleton<CategoryRepository>(() => CategoryRepositoryImpl(
          categoryServices: getIt.get<CategoryServices>()))
      ..registerLazySingleton<EmployeeRepositories>(() =>
          EmployeeRepositoriesImpl(
              employeeServices: getIt.get<EmployeeServices>()))
      ..registerLazySingleton<WarrantyRepositories>(() =>
          WarrantyRepositoriesImpl(
              warrantyServices: getIt.get<WarrantyServices>()))
      ..registerLazySingleton<CouponRepository>(() =>
          CouponRepositoryImpl(couponServices: getIt.get<CouponServices>()))
      ..registerLazySingleton<PaymentRepositories>(() =>
          PaymentRepositoriesImpl(
              paymentServices: getIt.get<PaymentServices>()))
      ..registerLazySingleton<AddressRepositories>(() =>
          AddressRepositoriesImpl(
              addressServices: getIt.get<AddressServices>()));
  }
}
