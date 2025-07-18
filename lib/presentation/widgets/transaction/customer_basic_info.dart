import 'package:c_pos/common/extensions/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/configs/box.dart';
import '../../../gen/gen.dart';
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
        CircleAvatar(
          backgroundColor: AppColors.primaryColor,
          child: Assets.svg.customer.svg(
            width: 16.sp,
            height: 16.sp,
            color: AppColors.white,
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
