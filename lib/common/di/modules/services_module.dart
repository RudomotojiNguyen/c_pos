import '../../../data/datasources/remote/address_api.dart';
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
import '../../../data/services/support_services.dart';
import '../../../data/services/user_services.dart';
import '../../../data/services/warranty_services.dart';
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
          () => SupportServicesImpl(supportApi: getIt.get<SupportApi>()))
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
      ..registerLazySingleton<WarrantyServices>(
          () => WarrantyServicesImpl(warrantyApi: getIt.get<WarrantyApi>()))
      ..registerLazySingleton<CouponServices>(
          () => CouponServicesImpl(couponApi: getIt.get<CouponApi>()))
      ..registerLazySingleton<PaymentServices>(
          () => PaymentServicesImpl(paymentApi: getIt.get<PaymentApi>()))
      ..registerLazySingleton<AddressServices>(
          () => AddressServicesImpl(addressApi: getIt.get<AddressApi>()));
  }
}
