import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/configs/box.dart';
import '../../theme/themes.dart';
import '../widgets.dart';

class CustomerLoading extends StatelessWidget {
  const CustomerLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.sp, vertical: 16.sp),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.all(AppRadius.l),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.all(AppRadius.xxxl),
            child: const XPlaceHolder(
              width: 80,
              height: 80,
            ),
          ),
          BoxSpacer.s8,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const XPlaceHolder(
                width: 200,
                height: 12,
              ),
              BoxSpacer.s8,
              const XPlaceHolder(
                width: 120,
                height: 12,
              ),
              BoxSpacer.s8,
              const XPlaceHolder(
                width: 80,
                height: 12,
              ),
            ],
          )
        ],
      ),
    );
  }
}
