import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/extensions/extension.dart';
import '../../theme/themes.dart';
import '../widgets.dart';

class HeaderDialog extends StatelessWidget {
  const HeaderDialog({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: AppFont.t.s(18).w700,
        ),
        XBaseButton(
          onPressed: () => Navigator.pop(context),
          child: Icon(
            Icons.close,
            size: 24.sp,
            color: AppColors.iconColor,
          ),
        )
      ],
    );
  }
}
