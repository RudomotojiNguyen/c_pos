import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timelines_plus/timelines_plus.dart';

import '../../../../../../common/configs/box.dart';
import '../../../../../theme/themes.dart';
import '../../../../../widgets/widgets.dart';

class ImeiTransactionLoading extends StatelessWidget {
  const ImeiTransactionLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Timeline.tileBuilder(
      padding: EdgeInsets.symmetric(horizontal: 16.sp),
      theme: TimelineThemeData(color: AppColors.primaryColor, nodePosition: 0),
      builder: TimelineTileBuilder.fromStyle(
        contentsAlign: ContentsAlign.basic,
        addAutomaticKeepAlives: true,
        indicatorStyle: IndicatorStyle.outlined,
        contentsBuilder: (context, index) => Container(
          padding: EdgeInsets.symmetric(horizontal: 16.sp, vertical: 16.sp),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              XPlaceHolder(
                width: 80.sp,
                height: 8.sp,
              ),
              BoxSpacer.s8,
              XPlaceHolder(
                width: 180.sp,
                height: 8.sp,
              ),
              BoxSpacer.s4,
              XPlaceHolder(
                width: 180.sp,
                height: 8.sp,
              ),
            ],
          ),
        ),
        itemCount: 10,
      ),
    );
  }
}
