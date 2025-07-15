import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/configs/box.dart';
import '../../../common/extensions/extension.dart';
import '../../theme/themes.dart';

class ShortTransactionInfoWidget extends StatelessWidget {
  const ShortTransactionInfoWidget(
      {super.key,
      required this.customerName,
      required this.customerPhone,
      required this.totalAmount});

  final String customerName;
  final String customerPhone;
  final double totalAmount;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 8.sp),
      padding: EdgeInsets.symmetric(horizontal: 16.sp, vertical: 8.sp),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(AppRadius.l),
        color: AppColors.primaryLightColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            customerName,
            style: AppFont.t.s(),
          ),
          BoxSpacer.s4,
          Text(
            customerPhone,
            style: AppFont.t.s(),
          ),
          BoxSpacer.s4,
          Text.rich(
            TextSpan(
              text: 'Giá trị đơn:',
              style: AppFont.t.s(),
              children: [
                const TextSpan(text: ' '),
                TextSpan(
                  text: totalAmount.formatCurrency,
                  style: AppFont.t.s(14).primaryColor,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
