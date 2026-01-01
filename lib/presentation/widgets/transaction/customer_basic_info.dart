import 'package:c_pos/common/extensions/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/configs/box.dart';
import '../../theme/themes.dart';

class CustomerBasicInfo extends StatelessWidget {
  const CustomerBasicInfo({
    super.key,
    required this.customerName,
    required this.customerPhone,
    this.customerId,
  });

  final String customerName;
  final String customerPhone;
  final int? customerId;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.all(8.sp),
          decoration: BoxDecoration(
            border: Border.all(
              color: AppColors.primaryColor,
              width: 1.sp,
            ),
            borderRadius: BorderRadius.all(AppRadius.xxl),
          ),
          child: Icon(
            Icons.person,
            size: 24.sp,
            color: AppColors.primaryColor,
          ),
        ),
        BoxSpacer.s8,
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                customerName,
                style: AppFont.t.s(),
              ),
              Text(
                customerPhone,
                style: AppFont.t.s(),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
