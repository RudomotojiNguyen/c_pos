import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

import '../../theme/themes.dart';

class XPlaceHolder extends StatelessWidget {
  final double width;
  final double height;
  final double borderRadius;
  final Color shimmerBaseColor;
  final Color shimmerHighlightColor;

  const XPlaceHolder({
    super.key,
    this.width = 100.0,
    this.height = 100.0,
    this.borderRadius = 8.0,
    this.shimmerBaseColor = AppColors.shimmerBaseColor,
    this.shimmerHighlightColor = AppColors.shimmerHighlightColor,
  });

  @override
  Widget build(BuildContext context) {
    final gradient = LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.centerRight,
        colors: <Color>[
          shimmerBaseColor,
          shimmerBaseColor,
          shimmerHighlightColor,
          shimmerBaseColor,
          shimmerBaseColor,
        ],
        stops: const <double>[
          0.0,
          0.35,
          0.5,
          0.65,
          1.0
        ]);

    return SizedBox(
      width: width.sp,
      height: height.sp,
      child: Shimmer(
        gradient: gradient,
        child: Container(
          width: width.sp,
          height: height.sp,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(AppRadius.size(borderRadius)),
            color: AppColors.shimmerBaseColor,
          ),
        ),
      ),
    );
  }
}
