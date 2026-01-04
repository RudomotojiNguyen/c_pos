import 'package:c_pos/common/configs/box.dart';
import 'package:c_pos/data/datasources/local_data/local_data.dart';
import 'package:c_pos/gen/gen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:isar/isar.dart';

import '../../../../common/configs/configurations.dart';
import '../../../../common/constants/go_router.dart';
import '../../../../common/di/injection/injection.dart';
import '../../../../common/extensions/extension.dart';
import '../../../../common/utils/database_utils.dart';
import '../../../../data/datasources/local_db/local_db.dart';
import '../../../common_bloc/supervisor_bloc.dart';
import '../../../utils/utils.dart';
import '../../router.dart';
import '../login/bloc/auth_bloc.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final AuthBloc _authBloc = getIt.get<AuthBloc>();
  final Configurations configurations = getIt.get<Configurations>();

  @override
  void initState() {
    super.initState();
    _initConfig();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      bloc: _authBloc,
      listener: (context, state) {
        if (state is GetProfileSuccess) {
          MainRouter.instance
              .pushReplace(context, routeName: RouteName.mainCore);
        }
        if (state is LogoutSuccess) {
          MainRouter.instance.pushReplace(context, routeName: RouteName.login);
        }
      },
      child: SafeArea(
        child: Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Assets.svg.imgLogo.svg(width: 240.sp),
                BoxSpacer.s32,
                Text(
                  'Đang tải dữ liệu bạn chờ chút nhé!',
                  style: AppFont.t.s(16).w500,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  ///
  /// METHOD
  ///

  _initConfig() async {
    if (configurations.isProduct) {
      /// nếu là production thì message không in ra
      debugPrint = (String? message, {int? wrapWidth}) {};
    }

    await _initDatabase();

    await SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.manual,
      overlays: [SystemUiOverlay.bottom, SystemUiOverlay.top],
    );

    ///set thiết bị luôn ở chế độ dọc
    await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    if (!configurations.isProduct) {
      ///nếu không phải là production thì log data khi call bloc
      Bloc.observer = SupervisorBloc();
    }

    ///
    _authBloc.add(GetUserProfileEvent());
  }

  _initDatabase() async {
    /// khởi tạo isar để lưu trữ user
    try {
      if (!kIsWeb) {
        /// nếu không phải web th khởi tạo DB
        await DatabaseUtil.initDatabase();
      }

      final dir = await Utils.getAppDocumentDirectory();
      Isar isar = await Isar.open(
        [
          UserTableSchema,
          CustomerTableSchema,
          DraftingInvoiceTableSchema,
          ProductTableSchema,
          PaymentMethodTableSchema,
        ],
        directory: dir,
      );

      /// lấy và set địa chỉ lưu trữ
      await getIt.get<UserStorage>().initUserLocalDb(isar);
      await getIt.get<DraftingStorage>().initDraftingLocalDb(isar);
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
