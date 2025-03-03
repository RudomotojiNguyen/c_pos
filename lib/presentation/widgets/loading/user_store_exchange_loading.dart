import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/configs/box.dart';
import '../../theme/themes.dart';
import '../widgets.dart';

class UserStoreExchangeLoading extends StatelessWidget {
  const UserStoreExchangeLoading({super.key});

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
            borderRadius: BorderRadius.circular(16.sp),
          ),
          child: Row(
            children: [
              XPlaceHolder(
                width: 56.sp,
                height: 56.sp,
              ),
              BoxSpacer.s16,
              Expanded(
                child: XPlaceHolder(
                  width: double.infinity,
                  height: 12.sp,
                ),
              ),
              BoxSpacer.s16,
              XPlaceHolder(
                width: 56.sp,
                height: 32.sp,
              ),
            ],
          ),
        );
      },
      separatorBuilder: (context, index) => BoxSpacer.s16,
    );
  }
}
