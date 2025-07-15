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
        borderRadius: BorderRadius.all(AppRadius.xxm),
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
              const XPlaceHolder(
                width: 50,
                height: 12,
              ),
              BoxSpacer.s2,
              const XPlaceHolder(
                width: 100,
                height: 12,
              ),
            ],
          ),
          const XPlaceHolder(
            width: 80,
            height: 24,
            borderRadius: 16,
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
              const XPlaceHolder(
                width: 90,
                height: 16,
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
              const XPlaceHolder(
                width: 90,
                height: 16,
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
              const XPlaceHolder(
                width: 160,
                height: 18,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
