import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/configs/box.dart';
import '../../theme/themes.dart';
import '../widgets.dart';

class ProductItemSearchLoading extends StatelessWidget {
  const ProductItemSearchLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16.sp),
      ),
      padding: EdgeInsets.symmetric(vertical: 16.sp, horizontal: 16.sp),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          renderProductInfo(),
          renderListStore(),
        ],
      ),
    );
  }

  Widget renderProductInfo() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        XPlaceHolder(
          width: 80.sp,
          height: 80.sp,
        ),
        BoxSpacer.s8,
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              XPlaceHolder(
                width: 100.sp,
                height: 12.sp,
              ),
              BoxSpacer.s2,
              XPlaceHolder(
                width: 50.sp,
                height: 12.sp,
              ),
              BoxSpacer.s12,
              XPlaceHolder(
                width: 80.sp,
                height: 12.sp,
              ),
              BoxSpacer.s2,
              XPlaceHolder(
                width: 40.sp,
                height: 10.sp,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget renderListStore() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BoxSpacer.s6,
        SizedBox(
          height: 14.sp,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return XPlaceHolder(
                      width: 60.sp,
                      height: 8.sp,
                    );
                  },
                  separatorBuilder: (context, index) => BoxSpacer.s8,
                  itemCount: 4,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
