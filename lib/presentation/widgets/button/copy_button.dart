import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../theme/themes.dart';
import '../../utils/utils.dart';
import 'base_button.dart';

class CopyButton extends StatelessWidget {
  const CopyButton({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return XBaseButton(
        onPressed: () {
          Utils.copyToClipboard(context, text: text);
        },
        child: Icon(
          Icons.copy,
          size: 18.sp,
          color: AppColors.informationColor,
        ));
  }
}
