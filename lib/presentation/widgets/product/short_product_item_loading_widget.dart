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
        borderRadius: BorderRadius.all(AppRadius.l),
      ),
      padding: EdgeInsets.symmetric(horizontal: 16.sp, vertical: 16.sp),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Center(
            child: XPlaceHolder(
              width: 100,
              height: 100,
            ),
          ),
          BoxSpacer.s16,
          const XPlaceHolder(
            width: 80,
            height: 12,
          ),
          BoxSpacer.s8,
          const XPlaceHolder(
            width: double.infinity,
            height: 12,
          ),
          BoxSpacer.s2,
          const XPlaceHolder(
            width: 50,
            height: 12,
          ),
          BoxSpacer.s8,
          const XPlaceHolder(
            width: 120,
            height: 16,
          ),
          BoxSpacer.s4,
          const XPlaceHolder(
            width: 100,
            height: 10,
          ),
        ],
      ),
    );
  }
}
