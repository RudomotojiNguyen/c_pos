import 'package:c_pos/common/extensions/text_style_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'base_button.dart';

class XTextButton extends StatelessWidget {
  const XTextButton({super.key, required this.onPressed, required this.title});

  final Function() onPressed;
  final String title;

  @override
  Widget build(BuildContext context) {
    return XBaseButton(
      onPressed: onPressed,
      padding: EdgeInsets.symmetric(vertical: 4.sp),
      child: Text(
        title,
        style: AppFont.t.s(),
      ),
    );
  }
}
