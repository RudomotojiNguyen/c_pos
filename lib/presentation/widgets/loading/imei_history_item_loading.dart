import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../theme/themes.dart';
import '../widgets.dart';

class ImeiHistoryItemLoading extends StatelessWidget {
  const ImeiHistoryItemLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16.sp),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.all(AppRadius.xxm),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _topInfo(),
          XDivider(padding: EdgeInsets.symmetric(vertical: 8.sp)),
          _productInfo(),
        ],
      ),
    );
  }

  Widget _topInfo() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.sp),
      child: const Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          XPlaceHolder(
            width: 50,
            height: 12,
          ),
          XPlaceHolder(
            width: 80,
            height: 24,
            borderRadius: 16.0,
          ),
        ],
      ),
    );
  }

  Widget _productInfo() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.sp),
      child: const ProductItemLoading(),
    );
  }
}
