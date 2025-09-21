import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../common/configs/box.dart';
import '../../common/extensions/extension.dart';
import '../theme/themes.dart';
import 'widgets.dart';

class XStatus extends StatelessWidget {
  const XStatus({
    super.key,
    required this.statusStr,
    this.bgColor,
    this.onClose,
  });

  final String statusStr;
  final Color? bgColor;
  final Function()? onClose;

  @override
  Widget build(BuildContext context) {
    Color bgStatusColor = bgColor ?? AppColors.lightGreyColor;
    return XBaseButton(
      onPressed: onClose,
      padding: EdgeInsets.symmetric(horizontal: 8.sp, vertical: 4.sp),
      decoration: BoxDecoration(
        color: bgStatusColor,
        borderRadius: BorderRadius.all(AppRadius.xxl),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            statusStr,
            style: AppFont.t.s(10).w500.neutral.copyWith(
                  color: bgStatusColor.getContrastColor,
                ),
          ),
          if (onClose != null) ...[
            BoxSpacer.s4,
            Icon(
              Icons.close,
              size: 12.sp,
              color: bgStatusColor.getContrastColor,
            ),
          ],
        ],
      ),
    );
  }
}
