import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theme/themes.dart';

class XToggleButton extends StatelessWidget {
  const XToggleButton(
      {super.key, required this.isOn, required this.toggleSwitch});

  final bool isOn;
  final Function() toggleSwitch;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: toggleSwitch,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
        width: 52.sp,
        height: 28.sp,
        padding: EdgeInsets.all(2.sp),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(AppRadius.xl),
          color: isOn ? AppColors.successColor : Colors.grey.shade300,
        ),
        child: AnimatedAlign(
          duration: const Duration(milliseconds: 400),
          curve: Curves.easeInOut,
          alignment: isOn ? Alignment.centerRight : Alignment.centerLeft,
          child: Container(
            width: 26.sp,
            height: 26.sp,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.15),
                  spreadRadius: 1.sp,
                  blurRadius: 4,
                  offset: Offset(0.sp, 2.sp), // tạo hiệu ứng bóng cho nút
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
