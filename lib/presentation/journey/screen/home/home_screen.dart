import 'package:c_pos/common/configs/box.dart';
import 'package:c_pos/gen/gen.dart';
import 'package:c_pos/presentation/journey/router.dart';
import 'package:c_pos/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

import '../../../../common/constants/go_router.dart';
import '../../../../common/di/injection/injection.dart';
import '../../../../common/extensions/extension.dart';
import '../../../theme/themes.dart';
import '../login/bloc/auth_bloc.dart';
import '../setting/widgets/profile_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final MainRouter _mainRouter = MainRouter.instance;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const ProfileWidget(),
        Expanded(
          child: SingleChildScrollView(
            padding: EdgeInsets.only(bottom: 64.sp),
            child: XResponsive(
              small: _renderSmallScreen(),
              normal: _renderSmallScreen(),
              large: _renderLargeScreen(),
              extraLarge: _renderLargeScreen(),
            ),
          ),
        ),
      ],
    );
  }

  ///------ Widget ------///

  Widget _renderSmallScreen() {
    return Column(
      children: [
        BoxSpacer.s16,
        _userInfo(),
        BoxSpacer.s16,
        _retailWidget(),
        BoxSpacer.s16,
        _customerWidget(),
        BoxSpacer.s16,
        _stockWidget(),
      ],
    );
  }

  Widget _renderLargeScreen() {
    return Column(
      children: [
        BoxSpacer.s16,
        _userInfo(),
        BoxSpacer.s16,
        Row(
          children: [
            Expanded(child: _customerWidget()),
            Expanded(child: _retailWidget()),
          ],
        ),
        BoxSpacer.s16,
        Row(
          children: [
            Expanded(child: _stockWidget()),
            Expanded(child: Container()),
          ],
        ),
      ],
    );
  }

  // widget cho user
  Widget _userInfo() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.sp),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Dành cho bạn',
            style: AppFont.t.s(16).w700,
          ),
          BoxSpacer.s8,
          Row(
            children: [
              _operationItem(
                title: 'Hoa hồng',
                icon: Assets.svg.savingMoney.svg(width: 32.sp),
                onPressed: () => _mainRouter.pushNamed(
                  context,
                  routeName: RouteName.affiliateCommission,
                ),
              ),
              BoxSpacer.s8,
              _operationItem(
                title: 'Cài đặt',
                icon: Assets.svg.setting.svg(width: 32.sp),
                // onPressed: () => _mainRouter.pushNamed(
                //   context,
                //   routeName: RouteName.setting,
                // ),
              ),
              BoxSpacer.s8,
              _operationItem(
                title: 'Thoát',
                icon: Assets.svg.logout.svg(width: 32.sp),
                onPressed: _logout,
              ),
            ],
          )
        ],
      ),
    );
  }

  // widget cho bán hàng
  Widget _retailWidget() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.sp),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Bán hàng',
            style: AppFont.t.s(16).w700,
          ),
          BoxSpacer.s8,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 168.sp,
                height: 168.sp,
                padding: EdgeInsets.all(8.sp),
                decoration: BoxDecoration(
                  // color: Colors.white,
                  borderRadius: BorderRadius.all(AppRadius.l),
                ),
                child: Lottie.asset(
                  Assets.lottie.cashOnDelivery,
                  fit: BoxFit.contain,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      _operationItem(
                        title: 'Hóa đơn',
                        icon: Assets.svg.invoice.svg(width: 32.sp),
                        onPressed: () => _mainRouter.pushNamed(
                          context,
                          routeName: RouteName.bills,
                        ),
                      ),
                      BoxSpacer.s8,
                      _operationItem(
                        title: 'Đơn hàng',
                        icon: Assets.svg.bill.svg(width: 32.sp),
                        onPressed: () => _mainRouter.pushNamed(
                          context,
                          routeName: RouteName.orders,
                        ),
                      ),
                    ],
                  ),
                  BoxSpacer.s8,
                  Row(
                    children: [
                      _operationItem(
                        title: 'Thu cũ',
                        icon: Assets.svg.tradeIn.svg(width: 32.sp),
                        onPressed: () => _mainRouter.pushNamed(
                          context,
                          routeName: RouteName.tradeIn,
                        ),
                      ),
                      BoxSpacer.s8,
                      _operationItem(
                        title: 'Đơn nháp',
                        icon: Assets.svg.shopping.svg(width: 32.sp),
                        onPressed: () => _mainRouter.pushNamed(
                          context,
                          routeName: RouteName.drafts,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }

  // widget cho khách hàng
  Widget _customerWidget() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.sp),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Khách hàng',
            style: AppFont.t.s(16).w700,
          ),
          BoxSpacer.s8,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      _operationItem(
                        title: 'Tìm khách',
                        icon: Assets.svg.customer.svg(width: 32.sp),
                        onPressed: () => _mainRouter.pushNamed(
                          context,
                          routeName: RouteName.customer,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Container(
                width: 168.sp,
                height: 168.sp,
                padding: EdgeInsets.all(8.sp),
                decoration: BoxDecoration(
                  // color: Colors.white,
                  borderRadius: BorderRadius.all(AppRadius.l),
                ),
                child: Lottie.asset(
                  Assets.lottie.customerSupport,
                  fit: BoxFit.contain,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  // widget cho kho hàng
  Widget _stockWidget() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.sp),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Kho hàng',
            style: AppFont.t.s(16).w700,
          ),
          BoxSpacer.s8,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 168.sp,
                height: 168.sp,
                padding: EdgeInsets.all(8.sp),
                decoration: BoxDecoration(
                  // color: AppColors.shadowColor,
                  borderRadius: BorderRadius.all(AppRadius.l),
                ),
                child: Lottie.asset(
                  Assets.lottie.inventory,
                  fit: BoxFit.contain,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      _operationItem(
                        title: 'Kho',
                        icon: Assets.svg.inventory.svg(width: 32.sp),
                        onPressed: () => _mainRouter.pushNamed(
                          context,
                          routeName: RouteName.searchStock,
                        ),
                      ),
                      BoxSpacer.s8,
                      _operationItem(
                        title: 'Tra Imei',
                        icon: Assets.svg.barcode.svg(width: 32.sp),
                        onPressed: () => _mainRouter.pushNamed(
                          context,
                          routeName: RouteName.imeiHistory,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }

  // mỗi tính năng
  Widget _operationItem(
      {required String title, required Widget icon, Function()? onPressed}) {
    return XBaseButton(
      onPressed: onPressed,
      child: Container(
        width: 80.sp,
        height: 80.sp,
        padding: EdgeInsets.all(8.sp),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(AppRadius.l),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            icon,
            BoxSpacer.s8,
            Expanded(
              child: Text(
                title,
                style: AppFont.t.s(10).w500,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }

  ///------ Function ------///
  void _logout() {
    getIt.get<AuthBloc>().add(LogoutEvent());
  }
}
