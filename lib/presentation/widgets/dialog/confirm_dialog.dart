import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/configs/box.dart';
import '../../../common/extensions/extension.dart';
import '../../theme/themes.dart';
import '../widgets.dart';

class ConfirmDialog extends StatelessWidget {
  const ConfirmDialog(
      {super.key,
      required this.contentWarning,
      required this.onCancel,
      required this.onAccept});

  final String contentWarning;
  final Function() onCancel;
  final Function() onAccept;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(
              Icons.warning_rounded,
              size: 26.sp,
              color: AppColors.warningColor,
            ),
            BoxSpacer.s8,
            Text(
              'Cảnh báo',
              style: AppFont.t.s(24).copyWith(fontWeight: FontWeight.w700),
            ),
          ],
        ),
        BoxSpacer.s8,
        Text(
          contentWarning,
          style: AppFont.t.s(14),
        ),
        BoxSpacer.s32,
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            XButton(
              type: XButtonType.secondary,
              onPressed: onCancel,
              title: 'Bỏ qua',
            ),
            BoxSpacer.s16,
            XButton(
              onPressed: onAccept,
              title: 'Xác nhận',
            ),
          ],
        )
      ],
    );
  }
}
