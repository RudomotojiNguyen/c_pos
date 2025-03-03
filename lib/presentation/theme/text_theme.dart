import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'colors.dart';

class ThemeText {
  static TextTheme getDefaultTextTheme() => TextTheme(
    //display
    displayLarge: TextStyle(
      fontSize: 15.sp,
      fontWeight: FontWeight.w700,
      color: AppColors.neutralColor,
    ),
    displayMedium: TextStyle(
      fontSize: 13.sp,
      fontWeight: FontWeight.w700,
      color: AppColors.neutralColor,
    ),
    displaySmall: TextStyle(
      fontSize: 18.sp,
      fontWeight: FontWeight.w700,
      color: AppColors.neutralColor,
    ),

    //headline
    // headlineLarge: TextStyle(
    //   fontSize: 24.sp,
    //   fontWeight: FontWeight.w700,
    //   color: AppColors.neutralColor,
    // ),
    headlineMedium: TextStyle(
      fontSize: 18.sp,
      fontWeight: FontWeight.w700,
      color: AppColors.neutralColor,
    ),
    headlineSmall: TextStyle(
      fontSize: 16.sp,
      fontWeight: FontWeight.w400,
      color: AppColors.neutralColor,
    ),

    //title
    titleLarge: TextStyle(
      fontSize: 24.sp,
      fontWeight: FontWeight.w700,
      color: AppColors.neutralColor,
    ),
    titleMedium: TextStyle(
      fontSize: 18.sp,
      fontWeight: FontWeight.w700,
      color: AppColors.neutralColor,
    ),
    titleSmall: TextStyle(
      fontSize: 13.sp,
      fontWeight: FontWeight.w600,
      color: AppColors.neutralColor,
    ),

    //body
    bodyLarge: TextStyle(
      fontSize: 24.sp,
      fontWeight: FontWeight.w700,
      color: AppColors.neutralColor,
    ),
    bodyMedium: TextStyle(
      fontSize: 14.sp,
      fontWeight: FontWeight.normal,
      color: AppColors.neutralColor,
    ),
    bodySmall: TextStyle(
      fontSize: 13.sp,
      fontWeight: FontWeight.w700,
      color: AppColors.neutralColor,
    ),

    //label
    labelLarge: TextStyle(
      fontSize: 16.sp,
      fontWeight: FontWeight.w700,
      color: AppColors.neutralColor,
    ),
    labelMedium: TextStyle(
      fontSize: 14.sp,
      fontWeight: FontWeight.w600,
      color: AppColors.neutralColor,
    ),
    labelSmall: TextStyle(
      fontSize: 13.sp,
      fontWeight: FontWeight.w600,
      color: AppColors.neutralColor,
    ),
  );
}
