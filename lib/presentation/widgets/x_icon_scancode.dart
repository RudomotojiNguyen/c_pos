import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../common/enum/enum.dart';
import '../mixins/dialog_mixins.dart';
import '../theme/colors.dart';
import 'widgets.dart';

class XIconScancode extends StatelessWidget with DialogHelper {
  const XIconScancode(
      {super.key, this.scanMode = XScanMode.defaultMode, this.onResult});

  final XScanMode scanMode;
  final Function({String? code, List<String>? codes})? onResult;

  @override
  Widget build(BuildContext context) {
    return XButton(
      padding: EdgeInsets.all(8.sp),
      type: XButtonType.transparent,
      onPressed: () async {
        showModalCameraScan(
          context,
          scanMode: scanMode,
          onResult: ({String? code, List<String>? codes}) {
            Navigator.pop(context);
            onResult?.call(code: code, codes: codes);
          },
        );
      },
      child: Icon(
        Icons.qr_code_scanner,
        size: 20.sp,
        color: AppColors.iconColor,
      ),
    );
  }
}
