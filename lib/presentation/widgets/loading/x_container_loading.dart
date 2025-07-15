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
        borderRadius: BorderRadius.all(AppRadius.l),
        color: AppColors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const XPlaceHolder(
                width: 32,
                height: 32,
              ),
              BoxSpacer.s8,
              const XPlaceHolder(
                width: 80,
                height: 12,
              ),
            ],
          ),
          childContent,
        ],
      ),
    );
  }
}
