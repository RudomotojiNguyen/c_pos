import 'package:c_pos/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../common/configs/box.dart';
import '../../../../common/di/injection/injection.dart';
import '../../../../common/extensions/extension.dart';
import '../../../../data/datasources/local_data/local_storage.dart';
import '../../../widgets/widgets.dart';
import '../login/bloc/auth_bloc.dart';
import 'bloc/setting_bloc.dart';
import 'widgets/profile_widget.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends XStateWidget<SettingScreen> {
  final LocalStorage localStorage = getIt.get<LocalStorage>();
  final AuthBloc _authBloc = getIt.get<AuthBloc>();
  final SettingBloc _settingBloc = getIt.get<SettingBloc>();

  @override
  Widget buildContentView(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.sp),
        child: Column(
          children: [
            const ProfileWidget(),
            BoxSpacer.s32,
            // renderUserOperator(),
            BoxSpacer.s24,
            // renderAppOperator(),
            BoxSpacer.s24,
            // renderLogout(),
          ],
        ),
      ),
    );
  }

  // Widget renderUserOperator() {
  //   return Container(
  //     decoration: BoxDecoration(
  //       color: AppColors.primaryColor,
  //       borderRadius: BorderRadius.circular(8.sp),
  //     ),
  //     child: Column(
  //       children: [
  //         OperatorWidget(
  //           icon: Assets.svg.gradient.home.svg(
  //             width: 26.sp,
  //             height: 26.sp,
  //           ),
  //           title: 'Chuyển cửa hàng',
  //           onPress: () {
  //             MainRouter.instance
  //                 .pushNamed(context, routeName: CoreRouteName.changeStore);
  //           },
  //         ),
  //         const XDivider(),
  //         OperatorWidget(
  //           icon: Assets.svg.gradient.lock.svg(
  //             width: 26.sp,
  //             height: 26.sp,
  //           ),
  //           title: 'Cài đặt mật khẩu',
  //           onPress: () {
  //             MainRouter.instance
  //                 .pushNamed(context, routeName: CoreRouteName.changePasword);
  //           },
  //         ),
  //       ],
  //     ),
  //   );
  // }

  // Widget renderAppOperator() {
  //   return Container(
  //     decoration: BoxDecoration(
  //       color: context.appTheme.colorScheme.primaryContainer,
  //       borderRadius: BorderRadius.circular(8.sp),
  //     ),
  //     child: Column(
  //       children: [
  //         BlocBuilder<SettingBloc, SettingState>(
  //           bloc: _settingBloc,
  //           buildWhen: (previous, current) =>
  //               current is GetAppSettingLoading ||
  //               current is GetAppSettingSuccess,
  //           builder: (context, state) {
  //             if (state is GetAppSettingLoading) {
  //               return BoxSpacer.blank;
  //             }
  //             final AppSettingModel? appSettingModel = state.appSettingModel;
  //             if (appSettingModel == null ||
  //                 appSettingModel.linkEducation.isNullOrEmpty) {
  //               return BoxSpacer.blank;
  //             }
  //             return Column(
  //               mainAxisSize: MainAxisSize.min,
  //               children: [
  //                 OperatorWidget(
  //                   icon: Assets.svg.gradient.passport.svg(
  //                     width: 26.sp,
  //                     height: 26.sp,
  //                     package: AssetPackage.dpos,
  //                   ),
  //                   title: 'Hướng dẫn sử dụng',
  //                   onPress: () {
  //                     Utils.launchUrlLink(appSettingModel.linkEducation);
  //                   },
  //                 ),
  //                 const XDivider(),
  //               ],
  //             );
  //           },
  //         ),
  //         BlocBuilder<SettingBloc, SettingState>(
  //           bloc: _settingBloc,
  //           buildWhen: (previous, current) =>
  //               current is GetAppSettingLoading ||
  //               current is GetAppSettingSuccess,
  //           builder: (context, state) {
  //             if (state is GetAppSettingLoading) {
  //               return BoxSpacer.blank;
  //             }
  //             final AppSettingModel? appSettingModel = state.appSettingModel;
  //             if (appSettingModel == null ||
  //                 appSettingModel.linkPromotionMKT.isNullOrEmpty) {
  //               return BoxSpacer.blank;
  //             }
  //             return Column(
  //               mainAxisSize: MainAxisSize.min,
  //               children: [
  //                 OperatorWidget(
  //                   icon: Assets.svg.gradient.speaker.svg(
  //                     width: 26.sp,
  //                     height: 26.sp,
  //                     package: AssetPackage.dpos,
  //                   ),
  //                   title: 'Chương trình khuyến mãi',
  //                   onPress: () {
  //                     Utils.launchUrlLink(appSettingModel.linkPromotionMKT);
  //                   },
  //                 ),
  //                 const XDivider(),
  //               ],
  //             );
  //           },
  //         ),
  //         OperatorWidget(
  //           icon: Assets.svg.gradient.chat.svg(
  //             width: 26.sp,
  //             height: 26.sp,
  //           ),
  //           title: 'Hỗ trợ',
  //           onPress: () {
  //             MainRouter.instance.pushNamed(
  //               context,
  //               routeName: CoreRouteName.supportUser,
  //             );
  //           },
  //         ),
  //       ],
  //     ),
  //   );
  // }

  // Widget renderLogout() {
  // return Container(
  //   decoration: BoxDecoration(
  //     color: context.appTheme.colorScheme.primaryContainer,
  //     borderRadius: BorderRadius.circular(8.sp),
  //   ),
  //   child: Column(
  //     children: [
  //       OperatorWidget(
  //         icon: Assets.svg.gradient.logout.svg(
  //           width: 26.sp,
  //           height: 26.sp,
  //         ),
  //         title: 'Đăng xuất',
  //         onPress: () async {
  //           _authBloc.add(LogoutEvent());
  //         },
  //       ),
  //     ],
  //   ),
  // );
  // }
}

class OperatorWidget extends StatelessWidget {
  const OperatorWidget(
      {super.key,
      required this.icon,
      required this.title,
      required this.onPress});

  final Widget icon;
  final String title;
  final Function() onPress;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.sp, vertical: 12.sp),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            icon,
            BoxSpacer.s16,
            Expanded(
              child: Text(
                title,
                style: AppFont.t.s(14),
              ),
            ),
            BoxSpacer.s16,
            Icon(
              Icons.arrow_forward_ios,
              size: 16.sp,
              color: AppColors.neutralColor,
            ),
          ],
        ),
      ),
    );
  }
}
