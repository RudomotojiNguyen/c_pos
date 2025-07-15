import 'dart:ui' show ImageFilter;

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../theme/themes.dart';

/// A widget that creates a container with a blurred background.
/// This version focuses on the glass effect and internal styling.
class XGlassContainer extends StatelessWidget {
  /// This widget will be shown over blurry container.
  final Widget child;

  /// [height] of blurry container.
  final double? height;

  /// [width] of blurry container.
  final double? width;

  /// The [blur] will control the amount of sigmaX and sigmaY.
  /// Defaults to `5`.
  final double blur;

  /// [padding] adds the [EdgeInsetsGeometry] to given [child].
  /// Defaults to `const EdgeInsets.all(8)`.
  final EdgeInsetsGeometry? padding;

  /// Background color of container.
  /// Defaults to `Colors.transparent`.
  final Color? color;

  /// [borderRadius] of blurry container.
  final BorderRadius? borderRadius;

  /// [gradientColors] of blurry container.
  /// If null, uses the color property.
  final List<Color>? gradientColors;

  /// [bgColor] of blurry container.
  /// If null, uses the color property.
  final Color? bgColor;

  /// [gradientBegin] of blurry container.
  /// Defaults to `Alignment.topLeft`.
  final Alignment gradientBegin;

  /// [gradientEnd] of blurry container.
  /// Defaults to `Alignment.bottomRight`.
  final Alignment gradientEnd;

  const XGlassContainer({
    super.key,
    required this.child,
    this.height,
    this.width,
    this.blur = 4,
    this.padding,
    this.color,
    this.borderRadius,
    this.gradientColors,
    this.bgColor,
    this.gradientBegin = Alignment.topLeft,
    this.gradientEnd = Alignment.bottomRight,
  });

  @override
  Widget build(BuildContext context) {
    final effectiveBorderRadius =
        borderRadius ?? BorderRadius.all(AppRadius.xxl);

    return Stack(
      children: [
        // Layer 1: The shadow container (placed behind the glass effect)
        Positioned.fill(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: effectiveBorderRadius,
              boxShadow: [
                BoxShadow(
                  color: color ?? Colors.grey.withValues(alpha: 0.2),
                  spreadRadius: 2.sp,
                  blurRadius: 10.sp,
                  offset: const Offset(0, 0),
                ),
              ],
            ),
          ),
        ),
        // Layer 2: The glass effect container (placed on top)
        ClipRRect(
          borderRadius: effectiveBorderRadius,
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: blur, sigmaY: blur),
            child: Container(
              height: height,
              width: width,
              padding: padding ?? EdgeInsets.all(8.sp),
              decoration: BoxDecoration(
                color: bgColor ??
                    Colors.grey.withValues(
                        alpha: 0.2), // Background color for the glass
                borderRadius: effectiveBorderRadius,
                border: Border.all(
                  color: Colors.white.withValues(alpha: 0.2),
                  width: 0.6.sp,
                ),
                gradient: gradientColors != null
                    ? LinearGradient(
                        colors: gradientColors!,
                        begin: gradientBegin,
                        end: gradientEnd,
                      )
                    : null,
              ),
              child: child,
            ),
          ),
        ),
      ],
    );
  }
}
