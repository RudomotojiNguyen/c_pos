import 'package:c_pos/common/extensions/string_extensions.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../common/constants/go_router.dart';
import '../../common/di/injection/injection.dart';
import '../../common/utils/navigator_service.dart';
import '../../data/datasources/local_data/local_storage.dart';
import 'package:c_pos/data/models/models.dart';
import '../utils/utils.dart';
import '../widgets/widgets.dart';
import 'screen/bill/detail/bill_detail.dart';
import 'screen/bill/list/bills_screen.dart';
import 'screen/commission/overview/affiliate_commission_screen.dart';
import 'screen/customer/customer_history/customer_history_screen.dart';
import 'screen/customer/detail/customer_detail_screen.dart';
import 'screen/customer/list_customer/customers_screen.dart';
import 'screen/drafting_invoice/detail/drafting_detail_screen.dart';
import 'screen/drafting_invoice/list/drafts_screen.dart';
import 'screen/imei_history/detail/imei_detail_screen.dart';
import 'screen/imei_history/search_list/product_imei_history_screen.dart';
import 'screen/login/login_screen.dart';
import 'screen/main/main_screen.dart';
import 'screen/order/detail/order_detail_screen.dart';
import 'screen/order/list/order_list_screen.dart';
import 'screen/product/product_screen.dart';
import 'screen/search/search_screen.dart';
import 'screen/splash/splash_screen.dart';
import 'screen/trade_in/trade_in_list/trade_ins_screen.dart';

class MainRouter {
  // Constructor được đánh dấu là private để ngăn việc khởi tạo ngoài lớp
  MainRouter._();

  // Static instance duy nhất của MainRouter
  static final MainRouter _instance = MainRouter._();

  // Getter để lấy instance duy nhất của MainRouter
  static MainRouter get instance => _instance;

  late final GoRouter _router;

  GoRouter get router => _router;

  BuildContext? get ctx => _router.routerDelegate.navigatorKey.currentContext;

  GoRouter initRouter({List<NavigatorObserver>? observers}) {
    _router = GoRouter(
      initialLocation: RouteName.splash,
      observers: observers,
      navigatorKey: NavigatorService.instance.navigatorKey,
      routes: [
        GoRoute(
          path: RouteName.mainCore,
          name: RouteName.mainCore,
          builder: (BuildContext context, GoRouterState state) =>
              const MainScreen(),
          routes: [
            GoRoute(
              path: RouteName.search,
              name: RouteName.search,
              builder: (BuildContext context, GoRouterState state) =>
                  const SearchScreen(),
            ),
            GoRoute(
              path: RouteName.affiliateCommission,
              name: RouteName.affiliateCommission,
              builder: (BuildContext context, GoRouterState state) =>
                  const AffiliateCommissionScreen(),
            ),
            GoRoute(
                path: RouteName.drafts,
                name: RouteName.drafts,
                builder: (BuildContext context, GoRouterState state) {
                  String id = state.uri.queryParameters['draftId'] ?? '';
                  if (id.isNotNullOrEmpty) {
                    return DraftingDetailScreen(id: id);
                  }
                  return const DraftsScreen();
                }),
            GoRoute(
              path: RouteName.bills,
              name: RouteName.bills,
              builder: (BuildContext context, GoRouterState state) {
                String billId = state.uri.queryParameters['billId'] ?? '';
                if (billId.isNotNullOrEmpty) {
                  return BillDetail(billId: billId);
                } else {
                  return const BillsScreen();
                }
              },
            ),
            GoRoute(
              path: RouteName.orders,
              name: RouteName.orders,
              builder: (BuildContext context, GoRouterState state) {
                String orderId = state.uri.queryParameters['orderId'] ?? '';
                if (orderId.isNotNullOrEmpty) {
                  return OrderDetailScreen(orderId: orderId);
                } else {
                  return const OrderListScreen();
                }
              },
            ),
            GoRoute(
              path: RouteName.productDetail,
              name: RouteName.productDetail,
              builder: (BuildContext context, GoRouterState state) =>
                  const ProductDetailScreen(),
            ),
            GoRoute(
              path: RouteName.customer,
              name: RouteName.customer,
              builder: (BuildContext context, GoRouterState state) {
                String customerId =
                    state.uri.queryParameters['customerId'] ?? '';
                if (customerId.isNotNullOrEmpty) {
                  return CustomerHistoryScreen(
                      customerId: int.parse(customerId));
                } else {
                  return const CustomersScreen();
                }
              },
            ),
            GoRoute(
              path: RouteName.customerUpdate,
              name: RouteName.customerUpdate,
              builder: (BuildContext context, GoRouterState state) {
                final data = state.uri.queryParameters;

                if (data.containsKey('customerId')) {
                  final String customerId = data['customerId'] ?? '0';
                  return CustomerDetailScreen(
                      customerId: int.parse(customerId));
                }

                return const CustomersScreen();
              },
            ),
            GoRoute(
                path: RouteName.imeiHistory,
                name: RouteName.imeiHistory,
                builder: (BuildContext context, GoRouterState state) {
                  String imei = state.uri.queryParameters['imei'] ?? '';
                  if (imei.isNotNullOrEmpty) {
                    return ImeiDetailScreen(imei: imei);
                  } else {
                    return const ProductImeiHistoryScreen();
                  }
                }),

            GoRoute(
              path: RouteName.tradeIn,
              name: RouteName.tradeIn,
              builder: (BuildContext context, GoRouterState state) =>
                  const TradeInsScreen(),
            ),
            // GoRoute(
            //   path: RouteName.stock,
            //   name: RouteName.stock,
            //   builder: (BuildContext context, GoRouterState state) =>
            //       const ManageStockScreen(),
            // ),
          ],
        ),
        GoRoute(
          path: RouteName.login,
          name: RouteName.login,
          builder: (BuildContext context, GoRouterState state) =>
              const LoginScreen(),
        ),
        GoRoute(
          path: RouteName.splash,
          name: RouteName.splash,
          builder: (BuildContext context, GoRouterState state) =>
              const SplashScreen(),
        ),
      ],
      // errorBuilder: (context, GoRouterState state) =>
      //     ErrorScreen(exception: state.error),
      redirect: (context, state) async {
        final coreToken = await getIt.get<LocalStorage>().getAccessToken();
        if (Utils.checkDataIsNullOrEmpty(coreToken)) {
          return RouteName.login;
        } else {
          return null;
        }
      },
      // urlPathStrategy: UrlPathStrategy.path,
    );

    return router;
  }

  Future<dynamic> pushNamed(
    BuildContext context, {
    String routeName = '/',
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, dynamic> queryParameters = const <String, dynamic>{},
    Object? extra,
  }) async {
    if (kIsWeb) {
      return context.goNamed(routeName,
          pathParameters: pathParameters,
          queryParameters: queryParameters,
          extra: extra);
    } else {
      return await context.pushNamed(routeName,
          queryParameters: queryParameters,
          extra: extra,
          pathParameters: pathParameters);
    }
  }

  Future<dynamic> goNamed(
    BuildContext context, {
    String routeName = '/',
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, dynamic> queryParameters = const <String, dynamic>{},
    Object? extra,
  }) async {
    return context.goNamed(
      routeName,
      pathParameters: pathParameters,
      queryParameters: queryParameters,
      extra: extra,
    );
  }

  Future<dynamic> pushReplace(
    BuildContext context, {
    String routeName = '/',
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, dynamic> queryParameters = const <String, dynamic>{},
    Object? extra,
  }) async {
    if (kIsWeb) {
      return context.goNamed(routeName,
          pathParameters: pathParameters,
          queryParameters: queryParameters,
          extra: extra);
    } else {
      return context.pushReplacementNamed(routeName,
          queryParameters: queryParameters,
          extra: extra,
          pathParameters: pathParameters);
    }
  }

  Future<dynamic> popUtil(
    BuildContext context, {
    String routeName = '/',
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, dynamic> queryParameters = const <String, dynamic>{},
    Object? extra,
  }) async {
    if (kIsWeb) {
      return context.goNamed(routeName);
    } else {
      final router = GoRouter.of(context);
      final GoRouterDelegate delegate = router.routerDelegate;
      List<String?> routes = delegate.currentConfiguration.routes
          .map((e) => (e as GoRoute).name)
          .toList();
      routes = routes.reversed.toList();

      /// nếu như trong stack có route name muốn tới thì pop tới đó
      /// còn nếu không thì pop về main sau đó chuyển tới đó
      if (routes.contains(routeName)) {
        for (var i = 0; i < routes.length; i++) {
          if (routes[i] == routeName) break;
          context.pop();
        }
      } else {
        // todo: check lại chỗ này nên đi về đâu
        // for (var i = 0; i < routes.length; i++) {
        //   if (routes[i] == RouteName.main) break;
        //   context.pop();
        // }

        context.pushNamed(routeName,
            queryParameters: queryParameters,
            extra: extra,
            pathParameters: pathParameters);
      }
    }
  }

  pop(BuildContext context, {dynamic result}) {
    if (context.canPop()) {
      return context.pop(result);
    }
  }

  navigateToPreviewAssets(
    BuildContext context, {
    required List<GalleryItemModel> galleries,
    required int initialIndex,
  }) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PreviewAssetsWidget(
          backgroundDecoration: const BoxDecoration(color: Colors.black),
          initialIndex: initialIndex,
          galleries: galleries,
        ),
      ),
    );
  }

  /// Checks if a given route name exists in the current navigation stack.
  ///
  /// Returns `true` if the route is found, `false` otherwise.
  ///
  /// Example:
  /// bool isInStack = MainRouter.instance.isRouteInStack(context, RouteName.productDetail);
  bool isRouteInStack(BuildContext context, String routeName) {
    final router = GoRouter.of(context);
    final GoRouterDelegate delegate = router.routerDelegate;

    // The currentConfiguration holds the list of GoRouteMatch objects
    // representing the current stack.
    final currentRoutes = delegate.currentConfiguration.routes;

    // Iterate through the routes to check if any route's name matches.
    for (final route in currentRoutes) {
      if (route is GoRoute && route.name == routeName) {
        return true;
      }
    }
    return false;
  }
}
