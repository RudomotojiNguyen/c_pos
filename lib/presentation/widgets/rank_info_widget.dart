import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../common/extensions/extension.dart';
import '../theme/themes.dart';

class RankInfoWidget extends StatelessWidget {
  const RankInfoWidget({super.key, required this.customerRank});

  final String customerRank;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 4.sp, horizontal: 8.sp),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(AppRadius.l),
        color: AppColors.informationColor.withAlpha(30),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          // core_assets.Assets.svg.gradient.crown.svg(
          //   width: 18.sp,
          //   height: 18.sp,
          // ),
          // BoxSpacer.s4,
          Text(
            customerRank,
            style: AppFont.t.s(11),
          ),
        ],
      ),
    );
  }
}
