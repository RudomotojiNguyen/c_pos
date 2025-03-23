import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:isar/isar.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

import 'common/configs/configurations.dart';
import 'common/constants/app_constants.dart';
import 'common/di/injection/injection.dart';
import 'common/utils/database_utils.dart';
import 'data/datasources/local_data/local_data.dart';
import 'data/datasources/local_db/local_db.dart';
import 'presentation/common_bloc/supervisor_bloc.dart';
import 'presentation/journey/app.dart';
import 'presentation/utils/utils.dart';
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

  /// khởi tạo isar để lưu trữ user
  final dir = await Utils.getAppDocumentDirectory();
  Isar isar = await Isar.open(
    [
      UserTableSchema,
      DraftingInvoiceTableSchema,
      CustomerTableSchema,
      ProductTableSchema,
      PaymentMethodTableSchema,
    ],
    directory: dir,
  );

  /// lấy và set địa chỉ lưu trữ
  await getIt.get<UserStorage>().initUserLocalDb(isar);
  await getIt.get<DraftingStorage>().initDraftingLocalDb(isar);

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
