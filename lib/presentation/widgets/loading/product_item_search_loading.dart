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
        borderRadius: BorderRadius.all(AppRadius.l),
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
        const XPlaceHolder(
          width: 80,
          height: 80,
        ),
        BoxSpacer.s8,
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const XPlaceHolder(
                width: 100,
                height: 12,
              ),
              BoxSpacer.s2,
              const XPlaceHolder(
                width: 50,
                height: 12,
              ),
              BoxSpacer.s12,
              const XPlaceHolder(
                width: 80,
                height: 12,
              ),
              BoxSpacer.s2,
              const XPlaceHolder(
                width: 40,
                height: 10,
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
                    return const XPlaceHolder(
                      width: 60,
                      height: 8,
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
