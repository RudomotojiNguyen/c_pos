import 'package:flutter/material.dart';

import 'base_theme.dart';
import 'colors.dart';
import 'text_theme.dart';

class LightTheme extends BaseTheme {
  @override
  ColorScheme get colorScheme => ColorScheme.fromSwatch(
        // primarySwatch: AppColors.red,
        brightness: Brightness.light,
      );

  @override
  AppBarTheme get appBarTheme => const AppBarTheme(
        elevation: 0,
        // color: AppColors.scaffoldBackgroundColor,
        iconTheme: IconThemeData(color: Colors.black),
        // surfaceTintColor: AppColors.primaryColor,
        titleTextStyle: TextStyle(
          fontFamily: 'NunitoSans',
          fontSize: 18,
          fontWeight: FontWeight.w700,
          // color: AppColors.textColor,
        ),
      );

  @override
  Color? get primaryColor => AppColors.primaryColor;

  @override
  Color? get hintColor => AppColors.neutral3Color;

  @override
  Color? get errorColor => AppColors.errorColor;

  @override
  Color? get disabledColor => AppColors.disabledActionColor;

  @override
  Color? get splashColor => Colors.transparent;

  @override
  Color? get dividerColor => AppColors.dividerColor;

  @override
  Color? get highlightColor => Colors.transparent;

  @override
  Color? get scaffoldBackgroundColor =>
      isDark ? AppColors.primaryLightColor : AppColors.primaryLightColor;

  @override
  TextTheme get textTheme => ThemeText.getDefaultTextTheme();

  @override
  BottomNavigationBarThemeData? get bottomNavigationBarTheme =>
      super.bottomNavigationBarTheme?.copyWith(
            backgroundColor: Colors.white,
          );
}
