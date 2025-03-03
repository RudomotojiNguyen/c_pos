import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../common/configs/box.dart';
import '../../common/extensions/extension.dart';
import '../theme/themes.dart';
import '../utils/utils.dart';
import 'widgets.dart';

class XBarcodeInfo extends StatelessWidget {
  const XBarcodeInfo({
    super.key,
    required this.barcode,
    this.isCopyBarcode = false,
  });

  final String barcode;
  final bool isCopyBarcode;

  @override
  Widget build(BuildContext context) {
    return XBaseButton(
      onPressed: isCopyBarcode
          ? () => Utils.copyToClipboard(context, text: barcode)
          : null,
      child: Row(
        children: [
          Icon(
            Icons.qr_code_rounded,
            color: AppColors.neutral3Color,
            size: 18.sp,
          ),
          BoxSpacer.s4,
          Text(
            barcode,
            style: AppFont.t.s(12).w500.italic.neutral,
          ),
        ],
      ),
    );
  }
}
