import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../common/configs/box.dart';
import '../../common/extensions/extension.dart';
import '../../gen/gen.dart';
import '../theme/themes.dart';
import '../utils/utils.dart';
import 'widgets.dart';

class XImeiInfo extends StatelessWidget {
  const XImeiInfo({
    super.key,
    required this.imei,
    this.isCopyImei = false,
  });

  final String imei;
  final bool isCopyImei;

  @override
  Widget build(BuildContext context) {
    return XBaseButton(
      onPressed:
          isCopyImei ? () => Utils.copyToClipboard(context, text: imei) : null,
      child: Row(
        children: [
          Assets.svg.iosLink.svg(
            width: 12.sp,
            height: 12.sp,
            color: AppColors.neutral3Color,
          ),
          BoxSpacer.s4,
          Text(
            imei,
            style: AppFont.t.s(8).w500.information.italic,
          ),
        ],
      ),
    );
  }
}
