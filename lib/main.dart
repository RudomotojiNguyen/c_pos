import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'common/configs/configurations.dart';
import 'common/di/injection/injection.dart';
import 'common/utils/database_utils.dart';
import 'presentation/common_bloc/supervisor_bloc.dart';
import 'presentation/journey/app.dart';
import 'presentation/widgets/widgets.dart';

Future<void> main() async {
  /// khởi tạo binding
  WidgetsFlutterBinding.ensureInitialized();

  /// Determine which Firebase options to use based on the flavor
  // final firebaseOptions = switch (appFlavor) {
  //   'prod' => prod.DefaultFirebaseOptions.currentPlatform,
  //   'stag' => stg.DefaultFirebaseOptions.currentPlatform,
  //   'dev' => dev.DefaultFirebaseOptions.currentPlatform,
  //   _ => throw UnsupportedError('Invalid flavor: $appFlavor'),
  // };

  /// khởi tạo firebase
  // await Firebase.initializeApp(options: firebaseOptions);

  /// khởi tạo các dependency injection và set môi trường
  await Injection.inject();

  Configurations configurations = getIt.get<Configurations>();

  if (!kIsWeb) {
    /// nếu không phải web th khởi tạo DB
    await DatabaseUtil.initDatabase();
  }

  await SystemChrome.setEnabledSystemUIMode(
    SystemUiMode.manual,
    overlays: [SystemUiOverlay.bottom, SystemUiOverlay.top],
  );

  if (configurations.isProduct) {
    /// nếu là production thì message không in ra
    debugPrint = (String? message, {int? wrapWidth}) {};

    /// lắng nghe lỗi bằng firebase crashlytic
    // getIt.get<CrashlyticsServices>().listeningCrash();
  }

  ///set thiết bị luôn ở chế độ dọc
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  if (!configurations.isProduct) {
    ///nếu không phải là production thì log data khi call bloc
    Bloc.observer = SupervisorBloc();
  }

  ///lấy và set địa chỉ lưu trữ
  // final dir = await Utils.getAppDocumentDirectory();
  // await getIt.get<CartStorage>().initStorage(dir);

  // if (configurations.isProduct) {
  //   // await SentryFlutter.init(
  //   //   (options) {
  //   //     options.dsn = AppConstant.dsnSentry;
  //   //     options.tracesSampleRate = 1.0;
  //   //     options.enableUserInteractionTracing = true;
  //   //   },
  //   // );
  //   runApp(
  //     DefaultAssetBundle(
  //       bundle: SentryAssetBundle(enableStructuredDataTracing: true),
  //       child: SentryUserInteractionWidget(child: const MainRunner()),
  //     ),
  //   );
  // } else {
  runApp(const MainRunner());
  // }
}

class MainRunner extends StatelessWidget {
  const MainRunner({super.key});

  @override
  Widget build(BuildContext context) {
    ///kiểm tra và set size cho các màn hình
    return const XResponsive(
      small: ScreenUtilInit(
        designSize: Size(300, 649),
        minTextAdapt: true,
        splitScreenMode: true,
        child: MainApp(),
      ),
      normal: ScreenUtilInit(
        // designSize: const Size(375, 812),
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
