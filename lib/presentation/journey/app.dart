import 'package:bot_toast/bot_toast.dart';
import 'package:c_pos/presentation/journey/router.dart';
import 'package:c_pos/presentation/mixins/dialog_mixins.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:toastification/toastification.dart';

import '../../common/di/injection/injection.dart';
import '../../common/extensions/extension.dart';
import '../../common/utils/navigator_service.dart';
import '../common_bloc/network/internet_bloc.dart';
import '../theme/light_theme.dart';
import 'screen/main/bloc/main_bloc.dart';

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  MainAppState createState() => MainAppState();
}

class MainAppState extends State<MainApp> with DialogHelper {
  final _botToastBuilder = BotToastInit();
  late final GoRouter router;
  final InternetBloc internetBloc = getIt.get<InternetBloc>();

  DateTime? lastPressed; // Lưu thời điểm nhấn nút "Back" lần cuối

  @override
  void initState() {
    super.initState();

    ///khởi tạo các url
    router = MainRouter.instance.initRouter(
      observers: [
        BotToastNavigatorObserver(),
        // SentryNavigatorObserver(),
      ],
    );

    // Đăng ký callback sau khi widget đã được dựng xong
    WidgetsBinding.instance.addPostFrameCallback((_) {
      internetBloc.add(InternetCheckRequested());
    });
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) {
          // Nếu hành động pop được thực hiện
          debugPrint("Pop allowed with result: $result");
          return; // Kết thúc xử lý, pop sẽ được thực hiện
        } else {
          // Nếu pop bị từ chối
          final now = DateTime.now();
          const maxDuration = Duration(seconds: 2);

          if (lastPressed == null ||
              now.difference(lastPressed!) > maxDuration) {
            lastPressed = now;
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  "Nhấn lần nữa để thoát ứng dụng",
                  style: AppFont.t.s(12),
                ),
                duration: maxDuration,
              ),
            );
          } else {
            // Người dùng đã nhấn lần thứ hai, cho phép thoát
            Navigator.of(context).pop(true);
          }
        }
      },
      child: BlocListener<InternetBloc, InternetState>(
        bloc: internetBloc,
        listener: (context, state) {
          if (state is InternetDisconnected && !mounted) {
            showInternetDisconnect(context);
          }
        },
        child: BlocProvider(
          create: (context) => MainBloc(),
          child: ToastificationWrapper(
            child: MaterialApp.router(
              localizationsDelegates: const [
                // AppLocalizations.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              locale: const Locale('vi'),
              supportedLocales: const [
                Locale('vi'),
              ],
              routeInformationParser: router.routeInformationParser,
              routerDelegate: router.routerDelegate,
              routeInformationProvider: router.routeInformationProvider,
              title: 'C-Pos',
              theme: LightTheme().build(),
              debugShowCheckedModeBanner: false,
              builder: _botToastBuilder,
              scaffoldMessengerKey:
                  NavigatorService.instance.scaffoldMessengerState,
            ),
          ),
        ),
      ),
    );
  }
}
