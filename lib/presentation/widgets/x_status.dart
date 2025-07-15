import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../common/extensions/extension.dart';
import '../theme/themes.dart';

class XStatus extends StatelessWidget {
  const XStatus({super.key, required this.statusStr, this.bgColor});

  final String statusStr;
  final Color? bgColor;

  @override
  Widget build(BuildContext context) {
    Color bgStatusColor = bgColor ?? AppColors.lightGreyColor;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.sp, vertical: 4.sp),
      decoration: BoxDecoration(
        color: bgStatusColor,
        borderRadius: BorderRadius.all(AppRadius.xxm),
      ),
      child: Text(
        statusStr,
        style: AppFont.t.s(10).w500.neutral.copyWith(
              color: bgStatusColor.getContrastColor,
            ),
      ),
    );
  }
}
