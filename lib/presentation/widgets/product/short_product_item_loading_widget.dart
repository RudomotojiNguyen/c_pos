import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/configs/box.dart';
import '../../theme/themes.dart';
import '../widgets.dart';

class ShortProductItemLoadingWidget extends StatelessWidget {
  const ShortProductItemLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16.sp),
      ),
      padding: EdgeInsets.symmetric(horizontal: 16.sp, vertical: 16.sp),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: XPlaceHolder(
              width: 100.sp,
              height: 100.sp,
            ),
          ),
          BoxSpacer.s16,
          XPlaceHolder(
            width: 80.sp,
            height: 12.sp,
          ),
          BoxSpacer.s8,
          XPlaceHolder(
            width: double.infinity,
            height: 12.sp,
          ),
          BoxSpacer.s2,
          XPlaceHolder(
            width: 50.sp,
            height: 12.sp,
          ),
          BoxSpacer.s8,
          XPlaceHolder(
            width: 120.sp,
            height: 16.sp,
          ),
          BoxSpacer.s4,
          XPlaceHolder(
            width: 100.sp,
            height: 10.sp,
          ),
        ],
      ),
    );
  }
}
