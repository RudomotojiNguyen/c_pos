import '../../../data/datasources/remote/api_remote.dart';
import '../../../data/services/services.dart';
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
      ..registerLazySingleton<AffiliateCommissionServices>(() =>
          AffiliateCommissionServicesImpl(
              commissionApi: getIt.get<CommissionApi>()))
      ..registerLazySingleton<BillServices>(
          () => BillServicesImpl(billApi: getIt.get<BillApi>()))
      ..registerLazySingleton<CustomerServices>(
          () => CustomerServicesImpl(customerApi: getIt.get<CustomerApi>()))
      ..registerLazySingleton<ProductServices>(
          () => ProductServicesImpl(productApi: getIt.get<ProductApi>()))
      ..registerLazySingleton<StockServices>(
          () => StockServicesImpl(stockApi: getIt.get<StockApi>()))
      ..registerLazySingleton<CategoryServices>(
          () => CategoryServicesImpl(categoryApi: getIt.get<CategoryApi>()))
      ..registerLazySingleton<EmployeeServices>(
          () => EmployeeServicesImpl(employeeApi: getIt.get<EmployeeApi>()))
      ..registerLazySingleton<CouponServices>(
          () => CouponServicesImpl(couponApi: getIt.get<CouponApi>()))
      ..registerLazySingleton<PaymentServices>(
          () => PaymentServicesImpl(paymentApi: getIt.get<PaymentApi>()))
      ..registerLazySingleton<AddressServices>(
          () => AddressServicesImpl(addressApi: getIt.get<AddressApi>()))
      ..registerLazySingleton<VoucherServices>(
          () => VoucherServicesImpl(voucherApi: getIt.get<VoucherApi>()))
      ..registerLazySingleton<TradeInServices>(() => TradeInServicesImpl(
          tradeInApi: getIt.get<TradeInApi>(), fileApi: getIt.get<FileApi>()));
  }
}
