import 'package:c_pos/common/extensions/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../common/configs/box.dart';
import '../theme/themes.dart';

class XBasicContainer extends StatelessWidget {
  const XBasicContainer({
    super.key,
    required this.child,
    this.icon,
    this.title,
  });

  final Widget child;
  final Widget? icon;
  final String? title;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.sp, vertical: 16.sp),
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.all(AppRadius.l),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              if (icon != null) ...[
                icon!,
              ],
              if (icon != null && title.isNotNullOrEmpty) ...[
                BoxSpacer.s8,
              ],
              if (title.isNotNullOrEmpty) ...[
                Text(
                  title!,
                  style: AppFont.t.s(16).w600,
                ),
              ],
            ],
          ),
          child,
        ],
      ),
    );
  }
}
