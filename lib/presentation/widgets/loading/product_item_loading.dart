import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/configs/box.dart';
import '../../theme/themes.dart';
import '../widgets.dart';

class ProductItemLoading extends StatelessWidget {
  const ProductItemLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16.sp),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          XPlaceHolder(
            height: 60.sp,
            width: 60.sp,
          ),
          BoxSpacer.s16,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                XPlaceHolder(
                  width: 200.sp,
                  height: 12.sp,
                ),
                BoxSpacer.s8,
                XPlaceHolder(
                  width: 60.sp,
                  height: 12.sp,
                ),
                BoxSpacer.s8,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    XPlaceHolder(
                      width: 100.sp,
                      height: 12.sp,
                    ),
                    BoxSpacer.s8,
                    XPlaceHolder(
                      width: 36.sp,
                      height: 12.sp,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
