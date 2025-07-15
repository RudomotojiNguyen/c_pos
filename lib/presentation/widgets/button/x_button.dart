import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/extensions/extension.dart';
import '../../theme/themes.dart';
import '../widgets.dart';

class XButton extends StatelessWidget {
  final XButtonType type;
  final GestureTapCallback? onPressed;
  final String? title;
  final Widget? child;
  final String? prefixIconPath;
  final Color? prefixIconColor;
  final EdgeInsetsGeometry? padding;
  final TextStyle? textStyle;
  final double? width;
  final bool disable;
  final Color? color;

  const XButton({
    super.key,
    this.type = XButtonType.solid,
    this.onPressed,
    this.title,
    this.child,
    this.prefixIconPath,
    this.prefixIconColor,
    this.padding,
    this.textStyle,
    this.width,
    this.disable = false,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    Color btnColor =
        color ?? (disable ? AppColors.disabledColor : AppColors.primaryColor);

    return Material(
      borderRadius: BorderRadius.all(AppRadius.xxm),
      color: _getBackgroundColor(),
      child: InkWell(
        borderRadius: BorderRadius.all(AppRadius.xxm),
        onTap: disable ? null : onPressed,
        child: Container(
          width: width,
          padding: padding ??
              EdgeInsets.symmetric(
                horizontal: 16.sp,
                vertical: 8.sp,
              ),
          decoration: onPressed != null
              ? BoxDecoration(
                  borderRadius: BorderRadius.all(AppRadius.xxm),
                  border: type == XButtonType.outline
                      ? Border.all(color: btnColor, width: 1.sp)
                      : null,
                )
              : BoxDecoration(
                  borderRadius: BorderRadius.all(AppRadius.xxm),
                  color: type == XButtonType.hyperlink
                      ? Colors.transparent
                      : Colors.grey[400],
                ),
          child: child ??
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (prefixIconPath?.isNotEmpty ?? false) ...[
                    XImage(
                      imagePath: prefixIconPath!,
                      fit: BoxFit.cover,
                      svgIconColor: prefixIconColor ?? (btnColor),
                      size: Size(10.sp, 10.sp),
                    ),
                    SizedBox(width: 8.sp),
                  ],
                  Text(
                    title ?? '',
                    style: textStyle ??
                        AppFont.t.s(14).copyWith(
                              color: type == XButtonType.solid
                                  ? Colors.white
                                  : btnColor,
                            ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
        ),
      ),
    );
  }

  Color _getBackgroundColor() {
    switch (type) {
      case XButtonType.outline:
        return Colors.transparent;
      case XButtonType.text:
        return Colors.white;
      case XButtonType.secondary:
        return disable ? AppColors.disabledColor : AppColors.primaryLightColor;
      case XButtonType.transparent:
      case XButtonType.hyperlink:
        return Colors.transparent;
      default:
        return disable ? AppColors.disabledColor : AppColors.primaryColor;
    }
  }
}

enum XButtonType { outline, text, secondary, solid, transparent, hyperlink }
