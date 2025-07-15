import 'dart:ui';

import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Định nghĩa các giá trị cơ bản cho hệ thống kích thước.
/// Bạn có thể điều chỉnh các giá trị này theo Design System của mình.
/// Lớp này là private (_AppSize) vì nó chỉ được sử dụng nội bộ bởi các lớp kích thước khác.
class _AppSize {
  static double xxs = 2.sp;
  static double xs = 4.sp;
  static double s = 6.sp;
  static double xxm = 8.sp;
  static double xm = 10.sp;
  static double m = 12.sp;
  static double l = 16.sp;
  static double xl = 18.sp;
  static double xxl = 32.sp;
  static double xxxl = 64.sp;
}

/// {@template app_radius}
/// Radius class contains all radius used in app.
/// It provides a consistent and scalable set of border radius values
/// based on predefined size tokens.
/// {@endtemplate}
class AppRadius {
  // Private constructor to prevent instantiation of this utility class.
  AppRadius._();

  /// Radius of 0.
  static Radius none = Radius.zero;

  /// Extra extra small radius (xxs) based on `_AppSize.xxs`.
  static Radius xxs = Radius.circular(_AppSize.xxs);

  /// Extra small radius (xs) based on `_AppSize.xs`.
  static Radius xs = Radius.circular(_AppSize.xs);

  /// Small radius (s) based on `_AppSize.s`.
  static Radius s = Radius.circular(_AppSize.s);

  /// Extra small radius (xxm) based on `_AppSize.xxm`.
  static Radius xxm = Radius.circular(_AppSize.xxm);

  /// Small radius (xm) based on `_AppSize.xm`.
  static Radius xm = Radius.circular(_AppSize.xm);

  /// Medium radius (m) based on `_AppSize.m`.
  static Radius m = Radius.circular(_AppSize.m);

  /// Large radius (l) based on `_AppSize.l`.
  static Radius l = Radius.circular(_AppSize.l);

  /// Extra large radius (xl) based on `_AppSize.xl`.
  static Radius xl = Radius.circular(_AppSize.xl);

  /// Extra extra large radius (xxl) based on `_AppSize.xxl`.
  static Radius xxl = Radius.circular(_AppSize.xxl);

  /// Extra extra extra large radius (xxxl) based on `_AppSize.xxxl`.
  static Radius xxxl = Radius.circular(_AppSize.xxxl);

  /// custom radius size
  static Radius size(double size) => Radius.circular(size.sp);
}
