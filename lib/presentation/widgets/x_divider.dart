import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theme/themes.dart';

enum DividerType { horizontal, vertical }

class XDivider extends StatelessWidget {
  const XDivider({
    super.key,
    this.padding = EdgeInsets.zero,
    this.dividerType = DividerType.horizontal,
    this.dividerColor,
    this.thickness,
  });

  final EdgeInsetsGeometry padding;
  final DividerType dividerType;
  final Color? dividerColor;
  final double? thickness;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: dividerType == DividerType.vertical
          ? VerticalDivider(
              color: dividerColor ?? AppColors.disabledColor,
              thickness: thickness ?? 0.5.sp,
            )
          : Divider(
              thickness: thickness ?? 0.5.sp,
              color: dividerColor ?? AppColors.disabledColor,
            ),
    );
  }
}
