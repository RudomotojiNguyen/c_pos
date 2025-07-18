import 'package:c_pos/common/extensions/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/configs/box.dart';
import '../../../common/enum/enum.dart';
import '../../theme/themes.dart';
import '../widgets.dart';

class TransactionItem extends StatelessWidget {
  const TransactionItem({
    super.key,
    required this.id,
    required this.dateTime,
    required this.customerName,
    required this.customerPhone,
    required this.amount,
    this.status,
    this.billType = BillType.undefine,
    this.color,
    this.onPressed,
  });

  final String id;
  final String dateTime;
  final String customerName;
  final String customerPhone;
  final double amount;
  final String? status;
  final BillType billType;
  final Color? color;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return XBaseButton(
      onPressed: onPressed,
      padding: EdgeInsets.zero,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 16.sp),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.all(AppRadius.xxm),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            billInformation(context),
            XDivider(padding: EdgeInsets.symmetric(vertical: 8.sp)),
            customerInformation(context),
            if (amount > 0) ...[
              XDivider(padding: EdgeInsets.symmetric(vertical: 8.sp)),
              billPrice(context),
            ],
          ],
        ),
      ),
    );
  }

  Widget billInformation(BuildContext context) {
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
                '#$id',
                style: AppFont.t.s(14).w700,
              ),
              BoxSpacer.s2,
              Text(
                'Lập lúc $dateTime',
                style: AppFont.t.s(11).w400,
              ),
            ],
          ),
          if (status.isNotNullOrEmpty) ...[
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8.sp, vertical: 4.sp),
              decoration: BoxDecoration(
                  color: AppColors.lightGreyColor,
                  borderRadius: BorderRadius.all(AppRadius.xs)),
              child: Text(
                status!,
                style: AppFont.t.s(11).w700.copyWith(
                      color: color ?? AppColors.informationColor,
                    ),
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget customerInformation(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.sp),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Khách hàng',
                      style: AppFont.t.s(11).w600.neutral2,
                    ),
                    BoxSpacer.s2,
                    Text(
                      customerName,
                      style: AppFont.t.s(14).w700,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      'Số điện thoại',
                      style: AppFont.t.s(11).w600.neutral2,
                    ),
                    BoxSpacer.s2,
                    Text(
                      customerPhone,
                      style: AppFont.t.s(14).w700,
                    ),
                  ],
                ),
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
              BoxSpacer.s2,
              Text(
                amount.formatCurrency,
                style: AppFont.t.s(16).w800.primaryColor,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
