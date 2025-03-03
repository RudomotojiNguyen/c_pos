import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/configs/box.dart';
import '../../theme/themes.dart';
import '../widgets.dart';

class XContainerLoading extends StatelessWidget {
  const XContainerLoading({super.key, required this.childContent});

  final Widget childContent;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.sp, vertical: 16.sp),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.sp),
        color: AppColors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              XPlaceHolder(
                width: 32.sp,
                height: 32.sp,
              ),
              BoxSpacer.s8,
              XPlaceHolder(
                width: 80.sp,
                height: 12.sp,
              ),
            ],
          ),
          childContent,
        ],
      ),
    );
  }
}
