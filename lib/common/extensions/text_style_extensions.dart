import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../presentation/theme/themes.dart';

extension ColorExtension on TextStyle {
  TextStyle get textColor => copyWith(color: AppColors.neutralColor);

  TextStyle get white => copyWith(color: AppColors.white);

  TextStyle get primaryColor => copyWith(color: AppColors.primaryColor);

  TextStyle get green => copyWith(color: AppColors.successColor);

  TextStyle get neutral2 => copyWith(color: AppColors.neutral2Color);

  TextStyle get neutral => copyWith(color: AppColors.neutralColor);

  TextStyle get information => copyWith(color: AppColors.informationColor);
}

extension MyFontWeight on TextStyle {
  TextStyle get w700 => copyWith(fontWeight: FontWeight.w700);

  TextStyle get w600 => copyWith(fontWeight: FontWeight.w600);

  TextStyle get w500 => copyWith(fontWeight: FontWeight.w500);

  TextStyle get w400 => copyWith(fontWeight: FontWeight.w400);

  TextStyle get w200 => copyWith(fontWeight: FontWeight.w200);

  TextStyle get w300 => copyWith(fontWeight: FontWeight.w300);

  TextStyle get w900 => copyWith(fontWeight: FontWeight.w900);

  TextStyle get w800 => copyWith(fontWeight: FontWeight.w800);
}

extension MyFontStyle on TextStyle {
  TextStyle get italic => copyWith(fontStyle: FontStyle.italic);

  TextStyle get underline => copyWith(decoration: TextDecoration.underline);
}

extension MyFontSize on TextStyle {
  TextStyle s([double size = 12]) => copyWith(fontSize: size.sp);
}

class AppFont {
  static TextStyle get t => TextStyle(
        color: AppColors.neutralColor,
        fontSize: 14.sp,
        fontWeight: FontWeight.w400,
        // fontFamily: FontFamily.beVN,
      );
}
