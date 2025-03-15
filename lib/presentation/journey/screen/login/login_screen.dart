import 'package:c_pos/common/extensions/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../common/configs/box.dart';
import '../../../../common/configs/configurations.dart';
import '../../../../common/constants/go_router.dart';
import '../../../../common/di/injection/injection.dart';
import '../../../../gen/assets.gen.dart';
import '../../../theme/themes.dart';
import '../../../widgets/widgets.dart';
import '../../router.dart';
import 'bloc/auth_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends XStateWidget<LoginScreen> {
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final MainRouter _mainRouter = MainRouter.instance;
  final AuthBloc _authBloc = getIt.get<AuthBloc>();

  final _kForm = GlobalKey<FormState>();

  final Configurations configurations = getIt.get<Configurations>();

  @override
  void dispose() {
    _userNameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget buildContentView(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          renderTopLogo(),
          BoxSpacer.size(48),
          renderFormLogin(),
        ],
      ),
    );
  }

  Widget renderTopLogo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        BoxSpacer.size(132),
        Text(
          'Chào mừng bạn đến với',
          style: theme.textTheme.headlineMedium,
          textAlign: TextAlign.center,
        ),
        BoxSpacer.s24,
        Assets.svg.imgLogo.svg(
          width: 218.sp,
        ),
      ],
    );
  }

  Widget renderFormLogin() {
    return Container(
      constraints: BoxConstraints(
        maxWidth: 500.sp,
      ),
      padding: EdgeInsets.symmetric(horizontal: 40.sp),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Form(
            key: _kForm,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                XTextField(
                  decorationStyle: DecorationStyle.rounded,
                  hintText: 'Tên đăng nhập',
                  controller: _userNameController,
                  prefixWidget: Icon(
                    Icons.person,
                    size: 24.sp,
                    color: AppColors.primaryColor,
                  ),
                  validator: (value) {
                    if (value.isNullOrEmpty) {
                      return 'Vui lòng nhập tên đăng nhập';
                    }
                    return null;
                  },
                ),
                BoxSpacer.s20,
                XTextField(
                  decorationStyle: DecorationStyle.rounded,
                  hintText: 'Mật khẩu',
                  obsureText: true,
                  controller: _passwordController,
                  prefixWidget: Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 2.sp,
                      horizontal: 2.sp,
                    ),
                    child: Icon(
                      Icons.lock,
                      size: 24.sp,
                      color: AppColors.primaryColor,
                    ),
                  ),
                  validator: (value) {
                    if (value.isNullOrEmpty) {
                      return 'Vui lòng nhập mật khẩu';
                    }
                    return null;
                  },
                  onSubmitted: (value) => _onSubmit(),
                ),
              ],
            ),
          ),
          BoxSpacer.s20,
          XButton(
            padding: EdgeInsets.symmetric(vertical: 14.sp),
            title: 'Đăng nhập',
            onPressed: _onSubmit,
          ),
        ],
      ),
    );
  }

  ///
  /// METHOD
  ///
  _onSubmit() async {
    if (_kForm.currentState!.validate()) {
      String username = _userNameController.text.trim();
      String password = _passwordController.text.trim();

      XToast.loading();

      try {
        final res = await Future.wait([
          _authBloc.onLogin(username: username, password: password),
        ]);

        if (res.first != null) {
          _mainRouter.goNamed(context, routeName: RouteName.mainCore);
        }
      } catch (e) {
        XToast.showNegativeMessage(message: e.toString());
      }

      XToast.closeAllLoading();
    }
  }
}
