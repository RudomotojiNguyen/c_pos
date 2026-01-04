import 'package:c_pos/common/enum/enum.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

import 'common/configs/configurations.dart';
import 'common/constants/app_constants.dart';
import 'common/di/injection/injection.dart';
import 'presentation/journey/app.dart';
import 'presentation/widgets/widgets.dart';

import 'firebase_options.dart' as prod;
import 'firebase_options_dev.dart' as dev;
import 'firebase_options_stag.dart' as stg;

Future<void> main() async {
  /// khởi tạo binding
  WidgetsFlutterBinding.ensureInitialized();

  /// khởi tạo các dependency injection và set môi trường
  await Injection.inject();

  Configurations configurations = getIt.get<Configurations>();

  /// Determine which Firebase options to use based on the flavor
  final firebaseOptions = switch (configurations.getEnvironment) {
    XEnvironment.prod => prod.DefaultFirebaseOptions.currentPlatform,
    XEnvironment.stag => stg.DefaultFirebaseOptions.currentPlatform,
    XEnvironment.dev => dev.DefaultFirebaseOptions.currentPlatform,
  };

  /// khởi tạo firebase
  await Firebase.initializeApp(options: firebaseOptions);

  if (configurations.isProduct) {
    await SentryFlutter.init(
      (options) {
        options.dsn = AppConstants.dsnSentry;
        options.tracesSampleRate = 1.0;
        options.enableUserInteractionTracing = true;
      },
      appRunner: () => runApp(
        SentryWidget(
          child: const MainRunner(),
        ),
      ),
    );
  } else {
    runApp(const MainRunner());
  }
}

class MainRunner extends StatelessWidget {
  const MainRunner({super.key});

  @override
  Widget build(BuildContext context) {
    return const XResponsive(
      small: ScreenUtilInit(
        designSize: Size(300, 649),
        minTextAdapt: true,
        splitScreenMode: true,
        child: MainApp(),
      ),
      normal: ScreenUtilInit(
        designSize: Size(390, 844),
        minTextAdapt: true,
        splitScreenMode: true,
        child: MainApp(),
      ),
      large: ScreenUtilInit(
        designSize: Size(834, 1112),
        minTextAdapt: true,
        splitScreenMode: true,
        child: MainApp(),
      ),
      extraLarge: ScreenUtilInit(
        designSize: Size(1024, 1366),
        minTextAdapt: true,
        splitScreenMode: true,
        child: MainApp(),
      ),
    );
  }
}
