import 'package:flutter/material.dart';

import 'colors.dart';
import 'text_theme.dart';

abstract class BaseTheme {
  ThemeData build() {
    final Color onPrimarySurfaceColor =
        isDark ? colorScheme.onSurface : colorScheme.onPrimary;
    return ThemeData(
      fontFamily: fontFamily,
      brightness: colorScheme.brightness,
      primaryColor: primaryColor,
      canvasColor: colorScheme.surface,
      scaffoldBackgroundColor: scaffoldBackgroundColor,
      cardColor: cardColor,
      dividerColor: dividerColor,
      dialogTheme: const DialogThemeData(
        backgroundColor: Colors.white,
      ),
      textTheme: textTheme,
      applyElevationOverlayColor: isDark,
      useMaterial3: true,
      appBarTheme: appBarTheme,
      splashColor: splashColor,
      highlightColor: highlightColor,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      bottomNavigationBarTheme: bottomNavigationBarTheme,
      progressIndicatorTheme: progressIndicatorThemeData,
      bottomAppBarTheme: BottomAppBarThemeData(color: colorScheme.surface),
      disabledColor: disabledColor,
      hintColor: hintColor,
      iconTheme: getIconThemeData,
      colorScheme: colorScheme.copyWith(
        surface: colorScheme.surface,
        error: errorColor,
        primaryContainer: primaryContainer,
      ),
      tabBarTheme: TabBarThemeData(indicatorColor: onPrimarySurfaceColor),
    );
  }

  IconThemeData get getIconThemeData => const IconThemeData(
        color: AppColors.iconColor,
      );

  bool get isDark => colorScheme.brightness == Brightness.dark;

  ColorScheme get colorScheme =>
      isDark ? const ColorScheme.light() : const ColorScheme.dark();

  TextTheme get textTheme => ThemeText.getDefaultTextTheme();

  Color? get primaryContainer => AppColors.white;

  Color? get disabledColor => AppColors.disabledActionColor;

  Color? get primaryColor => AppColors.primaryColor;

  Color? get hintColor => AppColors.neutral3Color;

  Color? get errorColor => AppColors.errorColor;

  Color? get dividerColor => colorScheme.onSurface.withValues(alpha: 0.12);

  Color? get splashColor => Colors.transparent;

  Color? get highlightColor => Colors.transparent;

  Color? get scaffoldBackgroundColor => colorScheme.surface;

  Color? get cardColor => colorScheme.surface;

  AppBarTheme? get appBarTheme => null;

  String get fontFamily => 'NunitoSans';

  BottomNavigationBarThemeData? get bottomNavigationBarTheme =>
      const BottomNavigationBarThemeData(
        elevation: 0,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
      );

  ProgressIndicatorThemeData? get progressIndicatorThemeData =>
      const ProgressIndicatorThemeData(
        refreshBackgroundColor: Colors.white,
      );
}
