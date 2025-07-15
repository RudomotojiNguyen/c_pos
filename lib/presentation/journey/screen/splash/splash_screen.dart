import 'package:c_pos/common/configs/box.dart';
import 'package:c_pos/gen/gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../common/constants/go_router.dart';
import '../../../../common/di/injection/injection.dart';
import '../../../../common/extensions/extension.dart';
import '../../router.dart';
import '../login/bloc/auth_bloc.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final AuthBloc _authBloc = getIt.get<AuthBloc>();

  @override
  void initState() {
    super.initState();
    _authBloc.add(GetUserProfileEvent());
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
    );
  }
}
