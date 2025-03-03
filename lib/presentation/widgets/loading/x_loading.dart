import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../theme/themes.dart';

class XLoading extends StatelessWidget {
  const XLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 20.sp,
      height: 20.sp,
      child: const CircularProgressIndicator(
        color: AppColors.neutralColor,
      ),
    );
  }
}
