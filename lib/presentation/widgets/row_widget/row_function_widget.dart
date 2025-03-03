import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/configs/box.dart';
import '../../../common/extensions/extension.dart';
import '../widgets.dart';

class RowFunctionWidget extends StatelessWidget {
  const RowFunctionWidget(
      {super.key, required this.title, required this.icon, this.onPressed});

  final String title;
  final Widget icon;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return XBaseButton(
      onPressed: onPressed,
      padding: EdgeInsets.symmetric(horizontal: 8.sp, vertical: 8.sp),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          icon,
          BoxSpacer.s8,
          Text(
            title,
            style: AppFont.t.s(12),
          ),
        ],
      ),
    );
  }
}
