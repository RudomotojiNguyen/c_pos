import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/configs/box.dart';
import '../../../common/extensions/extension.dart';
import 'base_button.dart';

class XRowButton extends StatefulWidget {
  const XRowButton(
      {super.key, required this.title, required this.icon, this.onPressed});

  final String title;
  final Widget icon;
  final Function()? onPressed;

  @override
  State<XRowButton> createState() => _XRowButtonState();
}

class _XRowButtonState extends State<XRowButton> {
  @override
  Widget build(BuildContext context) {
    return XBaseButton(
      onPressed: widget.onPressed,
      padding: EdgeInsets.symmetric(vertical: 8.sp, horizontal: 8.sp),
      child: Row(
        children: [
          widget.icon,
          BoxSpacer.s8,
          Text(
            widget.title,
            style: AppFont.t.s(14).copyWith(fontWeight: FontWeight.normal),
          ),
        ],
      ),
    );
  }
}
