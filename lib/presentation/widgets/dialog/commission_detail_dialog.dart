import 'package:c_pos/common/enum/enum.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timelines_plus/timelines_plus.dart';

import '../../../common/configs/box.dart';
import '../../../common/extensions/extension.dart';
import '../../../data/models/reward_report_model.dart';
import '../../theme/themes.dart';

class CommissionDetailDialog extends StatelessWidget {
  const CommissionDetailDialog({super.key, required this.data});

  final List<RewardMoreModel> data;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500.sp,
      child: Timeline.tileBuilder(
        padding: EdgeInsets.symmetric(horizontal: 8.sp),
        theme:
            TimelineThemeData(color: AppColors.primaryColor, nodePosition: 0),
        builder: TimelineTileBuilder.fromStyle(
          contentsAlign: ContentsAlign.basic,
          addAutomaticKeepAlives: true,
          indicatorStyle: IndicatorStyle.outlined,
          contentsBuilder: (context, index) {
            final RewardMoreModel item = data[index];
            return Container(
              width: double.maxFinite,
              padding: EdgeInsets.symmetric(horizontal: 16.sp, vertical: 16.sp),
              margin:
                  EdgeInsets.symmetric(vertical: 8.sp).copyWith(left: 16.sp),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(16.sp),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 8.sp,
                    offset: const Offset(0, 1), // changes position of shadow
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.getDate,
                    style: AppFont.t.s(10),
                  ),
                  BoxSpacer.s4,
                  Text(
                    item.getAmountStr,
                    style: AppFont.t
                        .s(16)
                        .w800
                        .copyWith(color: item.operatorType.getExpressionColor),
                  ),
                  if (item.description.isNotNullOrEmpty) ...[
                    BoxSpacer.s4,
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: 'Nội dung:',
                            style: AppFont.t
                                .s(11)
                                .w800
                                .copyWith(decoration: TextDecoration.underline),
                          ),
                          TextSpan(
                            text: ' ',
                            style: AppFont.t.s(11),
                          ),
                          TextSpan(
                            text: item.description!,
                            style: AppFont.t.s(11),
                          ),
                        ],
                      ),
                    )
                  ],
                ],
              ),
            );
          },
          itemCount: data.length,
        ),
      ),
    );
  }
}
