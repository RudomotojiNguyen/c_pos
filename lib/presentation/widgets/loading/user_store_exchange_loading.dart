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
            borderRadius: BorderRadius.all(AppRadius.l),
          ),
          child: Row(
            children: [
              const XPlaceHolder(
                width: 56,
                height: 56,
              ),
              BoxSpacer.s16,
              const Expanded(
                child: XPlaceHolder(
                  width: double.infinity,
                  height: 12,
                ),
              ),
              BoxSpacer.s16,
              const XPlaceHolder(
                width: 56,
                height: 32,
              ),
            ],
          ),
        );
      },
      separatorBuilder: (context, index) => BoxSpacer.s16,
    );
  }
}
