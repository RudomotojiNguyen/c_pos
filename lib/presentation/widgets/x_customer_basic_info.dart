import 'package:c_pos/common/extensions/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../common/configs/box.dart';
import '../../common/constants/go_router.dart';
import '../../gen/gen.dart';
import '../journey/router.dart';
import '../theme/themes.dart';
import 'button/base_button.dart';

class XCustomerBasicInfo extends StatelessWidget {
  const XCustomerBasicInfo({
    super.key,
    required this.customerName,
    required this.customerPhone,
    this.customerBirthday,
    this.customerPoint,
    this.customerId,
    this.onPressedEdit,
  });

  final String customerName;
  final String customerPhone;
  final String? customerBirthday;
  final int? customerPoint;
  final int? customerId;
  final Function()? onPressedEdit;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16.sp, horizontal: 16.sp),
      decoration: BoxDecoration(
        color: AppColors.lightGreyColor,
        borderRadius: BorderRadius.circular(16.sp),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  customerName,
                  style: AppFont.t.s(14).w700,
                ),
                BoxSpacer.s4,
                Row(
                  children: [
                    Icon(
                      Icons.phone,
                      size: 16.sp,
                      color: AppColors.neutral3Color,
                    ),
                    BoxSpacer.s4,
                    Text(
                      customerPhone,
                      style: AppFont.t.s(14).w700.neutral3,
                    ),
                  ],
                ),
                if (customerBirthday.isNotNullOrEmpty) ...[
                  BoxSpacer.s4,
                  Row(
                    children: [
                      Icon(
                        Icons.calendar_today,
                        size: 16.sp,
                        color: AppColors.neutral3Color,
                      ),
                      BoxSpacer.s4,
                      Text(
                        customerBirthday!.formatDate(),
                        style: AppFont.t.s(14).w700.neutral3,
                      ),
                    ],
                  ),
                ],
                if (customerPoint != null) ...[
                  BoxSpacer.s4,
                  Text(
                    customerPoint!.formatPoint,
                    style: AppFont.t.s(14).w700.neutral3,
                  ),
                ],
              ],
            ),
          ),
          Column(
            children: [
              if (customerId != null) ...[
                XBaseButton(
                  onPressed: () {
                    MainRouter.instance.pushNamed(
                      context,
                      routeName: RouteName.customer,
                      queryParameters: {
                        'customerId': customerId?.toString(),
                      },
                    );
                  },
                  child: Icon(
                    Icons.history,
                    size: 24.sp,
                    color: AppColors.informationColor,
                  ),
                ),
                BoxSpacer.s32,
              ],
              XBaseButton(
                onPressed: onPressedEdit,
                child: Assets.svg.edit.svg(
                  width: 24.sp,
                  height: 24.sp,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
