import 'package:c_pos/presentation/theme/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/configs/box.dart';
import '../../../common/enum/enum.dart';
import '../../../common/extensions/extension.dart';
import '../widgets.dart';

class TransactionItemLoading extends StatelessWidget {
  const TransactionItemLoading({super.key, this.type = BillType.retailInvoice});

  final BillType type;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16.sp),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(8.sp),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          billInformation(),
          XDivider(padding: EdgeInsets.symmetric(vertical: 8.sp)),
          customerInformation(context),
          XDivider(padding: EdgeInsets.symmetric(vertical: 8.sp)),
          billPrice(context),
        ],
      ),
    );
  }

  Widget billInformation() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.sp),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              XPlaceHolder(
                width: 50.sp,
                height: 12.sp,
              ),
              BoxSpacer.s2,
              XPlaceHolder(
                width: 100.sp,
                height: 12.sp,
              ),
            ],
          ),
          XPlaceHolder(
            width: 80.sp,
            height: 24.sp,
            borderRadius: 16.sp,
          ),
        ],
      ),
    );
  }

  Widget customerInformation(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.sp),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Khách hàng', style: AppFont.t.s(11).w600.neutral2),
              BoxSpacer.s8,
              XPlaceHolder(
                width: 90.sp,
                height: 16.sp,
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                'Số điện thoại',
                style: AppFont.t.s(11).w600.neutral2,
              ),
              BoxSpacer.s8,
              XPlaceHolder(
                width: 90.sp,
                height: 16.sp,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget billPrice(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.sp),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Tổng hóa đơn',
                style: AppFont.t.s(11).w600.neutral2,
              ),
              BoxSpacer.s8,
              XPlaceHolder(
                width: 160.sp,
                height: 18.sp,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
