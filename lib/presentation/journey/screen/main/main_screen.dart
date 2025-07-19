import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../common/constants/go_router.dart';
import '../../../../common/di/injection/injection.dart';
import '../../../mixins/dialog_mixins.dart';
import '../../../widgets/widgets.dart';
import '../../router.dart';
import '../global_bloc/global_core_bloc.dart';
import '../home/home_screen.dart';
import '../login/bloc/auth_bloc.dart';
import '../setting/bloc/setting_bloc.dart';
import '../store/bloc/store_bloc.dart';
import 'bloc/main_bloc.dart';

part './widgets/bottom_bar_widget.dart';
part './widgets/content_page_widget.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends XStateWidget<MainScreen> {
  // final LocalNotificationServices _localNotificationServices =
  //     LocalNotificationServices.instance;
  final StoreBloc _storeBloc = getIt.get<StoreBloc>();
  final SettingBloc _settingBloc = getIt.get<SettingBloc>();
  final GlobalCoreBloc _globalCoreBloc = getIt.get<GlobalCoreBloc>();
  final AuthBloc _authBloc = getIt.get<AuthBloc>();

  final ValueNotifier<int> tabIndex = ValueNotifier(1);

  @override
  void initState() {
    super.initState();
    _storeBloc.add(GetStoreEvent());
    getAppSetting();
    getToken();
    _globalCoreBloc.add(GetOrderStatusEvent());
    _globalCoreBloc.add(GetOrderSourceEvent());
    _globalCoreBloc.add(GetOrderTypeEvent());
  }

  getAppSetting() {
    _settingBloc.add(GetAppSettingEvent());
    _settingBloc.add(GetFeatureFlagEvent());
  }

  getToken() async {
    // final tokenDevice = await _localNotificationServices.requestFirebaseToken();
    // LoggerHelper().logInfo(message: 'tokenDevice', obj: tokenDevice);
  }

  @override
  Widget buildContentView(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      bloc: _authBloc,
      listener: (context, state) {
        if (state is LogoutSuccess) {
          MainRouter.instance.pushReplace(context, routeName: RouteName.login);
        }
      },
      child: const ContentPageWidget(),
    );
  }
}
