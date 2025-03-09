import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/configs/box.dart';
import '../../theme/colors.dart';
import '../widgets.dart';

class CustomerLoading extends StatelessWidget {
  const CustomerLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.sp, vertical: 16.sp),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16.sp),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(80.sp),
            child: XPlaceHolder(
              width: 80.sp,
              height: 80.sp,
            ),
          ),
          BoxSpacer.s8,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              XPlaceHolder(
                width: 200.sp,
                height: 12.sp,
              ),
              BoxSpacer.s8,
              XPlaceHolder(
                width: 120.sp,
                height: 12.sp,
              ),
              BoxSpacer.s8,
              XPlaceHolder(
                width: 80.sp,
                height: 12.sp,
              ),
            ],
          )
        ],
      ),
    );
  }
}
