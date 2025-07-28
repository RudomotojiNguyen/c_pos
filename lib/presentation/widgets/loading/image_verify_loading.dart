import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/configs/box.dart';
import '../widgets.dart';

class ImageVerifyLoading extends StatelessWidget {
  const ImageVerifyLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      crossAxisSpacing: 20.sp,
      mainAxisSpacing: 20.sp,
      childAspectRatio: 3 / 2.6,
      children: List.generate(2, (index) => const ImageVerifyItemLoading()),
    );
  }
}

class ImageVerifyItemLoading extends StatelessWidget {
  const ImageVerifyItemLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        XPlaceHolder(
          width: 100.sp,
          height: 100.sp,
        ),
        BoxSpacer.s8,
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            XPlaceHolder(
              width: 40.sp,
              height: 12.sp,
            ),
            BoxSpacer.s8,
            XPlaceHolder(
              width: 40.sp,
              height: 12.sp,
            ),
          ],
        ),
      ],
    );
  }
}
