import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/configs/box.dart';
import '../../theme/themes.dart';
import '../widgets.dart';

class ExchangeHistoryLoading extends StatelessWidget {
  const ExchangeHistoryLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 10,
      padding: EdgeInsets.symmetric(horizontal: 20.sp, vertical: 16.sp),
      itemBuilder: (context, index) {
        return Container(
          padding: EdgeInsets.all(16.sp),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.all(AppRadius.l),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const XPlaceHolder(
                        width: 120,
                        height: 12,
                      ),
                      BoxSpacer.s4,
                      const XPlaceHolder(
                        width: 40,
                        height: 12,
                      ),
                    ],
                  ),
                  const XPlaceHolder(
                    width: 40,
                    height: 18,
                  ),
                ],
              ),
              const XDivider(),
              Stack(
                alignment: Alignment.center,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          padding: EdgeInsets.all(16.sp),
                          width: 200.sp,
                          decoration: BoxDecoration(
                            color: AppColors.disabledColor,
                            borderRadius: BorderRadius.all(AppRadius.xxm),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const XPlaceHolder(
                                width: 120,
                                height: 12,
                              ),
                              BoxSpacer.s4,
                              const XPlaceHolder(
                                width: 200,
                                height: 12,
                              ),
                            ],
                          ),
                        ),
                      ),
                      BoxSpacer.s16,
                      Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                          padding: EdgeInsets.all(16.sp),
                          width: 200.sp,
                          decoration: BoxDecoration(
                            color: AppColors.disabledColor,
                            borderRadius: BorderRadius.all(AppRadius.xxm),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              const XPlaceHolder(
                                width: 120,
                                height: 12,
                              ),
                              BoxSpacer.s4,
                              const XPlaceHolder(
                                width: 180,
                                height: 12,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Positioned(
                    child: CircleAvatar(
                      radius: 16.sp,
                      backgroundColor: AppColors.warningColor,
                      child: Icon(
                        Icons.arrow_downward,
                        size: 18.sp,
                        color: AppColors.white,
                      ),
                    ),
                  )
                ],
              ),
              const XDivider(),
              const XPlaceHolder(
                width: 200,
                height: 12,
              ),
              BoxSpacer.s4,
              const XPlaceHolder(
                width: 80,
                height: 12,
              ),
            ],
          ),
        );
      },
      separatorBuilder: (context, index) => BoxSpacer.s16,
    );
  }
}
