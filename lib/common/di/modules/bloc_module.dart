import 'package:c_pos/common/di/injection/injection.dart';
import 'package:c_pos/presentation/journey/screen/drafting_invoice/detail/bloc/drafting_invoice_bloc.dart';

import '../../../data/datasources/local_data/local_data.dart';
import '../../../data/services/services.dart';
import '../../../presentation/journey/screen/address/bloc/address_bloc.dart';
import '../../../presentation/journey/screen/bill/list/bloc/bill_bloc.dart';
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
import '../../../presentation/journey/screen/search_product/bloc/search_product_bloc.dart';
import '../../../presentation/journey/screen/setting/bloc/setting_bloc.dart';
import '../../../presentation/journey/screen/stock/bloc/stock_bloc.dart';
import '../../../presentation/journey/screen/store/bloc/store_bloc.dart';
import '../../../presentation/journey/screen/trade_in/bloc/trade_in_bloc.dart';
import '../../../presentation/journey/screen/voucher/bloc/voucher_bloc.dart';
import '../../base/di_module.dart';

class BlocModule extends DIModule {
  @override
  Future<void> provides() async {
    getIt
      ..registerLazySingleton(() => AuthBloc(
          authServices: getIt.get<AuthServices>(),
          localStorage: getIt.get<LocalStorage>(),
          userStorage: getIt.get<UserStorage>(),
          userServices: getIt.get<UserServices>(),
          draftingStorage: getIt.get<DraftingStorage>()))
      ..registerLazySingleton(() => StoreBloc(
          storeServices: getIt.get<StoreServices>(),
          authBloc: getIt.get<AuthBloc>()))
      ..registerLazySingleton(() => SettingBloc())
      ..registerLazySingleton(
          () => GlobalCoreBloc(orderServices: getIt.get<OrderServices>()))
      ..registerFactory(
          () => AffiliateBloc(getIt.get<AffiliateCommissionServices>()))
      ..registerFactory(() => BillBloc(
          billServices: getIt.get<BillServices>(),
          authBloc: getIt.get<AuthBloc>()))
      ..registerFactory(
          () => CustomerBloc(customerServices: getIt.get<CustomerServices>()))
      ..registerFactory(
          () => OrderBloc(orderServices: getIt.get<OrderServices>()))
      ..registerFactory(() => ProductBloc(getIt.get<ProductServices>()))
      ..registerFactory(() => StockBloc(
          productServices: getIt.get<ProductServices>(),
          stockServices: getIt.get<StockServices>()))
      ..registerLazySingleton(() => DraftingInvoiceBloc(
            draftingStorage: getIt.get<DraftingStorage>(),
            productServices: getIt.get<ProductServices>(),
            billServices: getIt.get<BillServices>(),
            orderServices: getIt.get<OrderServices>(),
            tradeInServices: getIt.get<TradeInServices>(),
          ))
      ..registerLazySingleton(() =>
          DraftingInvoicesBloc(draftingStorage: getIt.get<DraftingStorage>()))
      ..registerLazySingleton(() => EmployeeBloc(getIt.get<EmployeeServices>()))
      ..registerFactory(() => CouponBloc(
          authBloc: getIt.get<AuthBloc>(),
          couponServices: getIt.get<CouponServices>()))
      ..registerFactory(() => PaymentBloc(
          paymentServices: getIt.get<PaymentServices>(),
          authBloc: getIt.get<AuthBloc>()))
      ..registerFactory(() =>
          SearchProductBloc(productServices: getIt.get<ProductServices>()))
      ..registerFactory(
        () => TradeInBloc(tradeInServices: getIt.get<TradeInServices>()),
      )
      ..registerFactory(() => ScanBloc())
      ..registerFactory(
          () => VoucherBloc(voucherServices: getIt.get<VoucherServices>()))
      ..registerFactory(
          () => AddressBloc(addressServices: getIt.get<AddressServices>()));
  }
}
