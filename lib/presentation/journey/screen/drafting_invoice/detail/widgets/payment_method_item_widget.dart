import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../common/configs/box.dart';
import '../../../../../../common/enum/enum.dart';
import '../../../../../../common/extensions/extension.dart';
import '../../../../../theme/themes.dart';
import '../../../../../widgets/widgets.dart';

class PaymentMethodItemWidget extends StatelessWidget {
  const PaymentMethodItemWidget({
    super.key,
    required this.accountName,
    required this.accountNumber,
    required this.amount,
    this.onRemove,
    this.onPressed,
    this.methodDeposit = MethodDeposit.none,
  });

  final String accountName;
  final String accountNumber;
  final double amount;
  final MethodDeposit methodDeposit;
  final Function()? onRemove;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return XBaseButton(
      onPressed: onPressed,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(AppRadius.l),
            border: Border.all(width: 0.5.sp, color: AppColors.neutral3Color)),
        padding: EdgeInsets.symmetric(horizontal: 16.sp, vertical: 8.sp),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text.rich(
                    TextSpan(
                        text: accountName,
                        style: AppFont.t.s(14).w700,
                        children: accountNumber.isNotNullOrEmpty
                            ? [
                                TextSpan(
                                  text: ' (',
                                  style: AppFont.t.s(14).w700.copyWith(
                                        color: AppColors.disabledActionColor,
                                      ),
                                ),
                                TextSpan(
                                  text: accountNumber,
                                  style: AppFont.t.s(14).w700.copyWith(
                                        color: AppColors.disabledActionColor,
                                      ),
                                ),
                                TextSpan(
                                  text: ')',
                                  style: AppFont.t.s(14).w700.copyWith(
                                        color: AppColors.disabledActionColor,
                                      ),
                                ),
                              ]
                            : []),
                  ),
                  if (methodDeposit != MethodDeposit.none) ...[
                    Text.rich(
                      TextSpan(
                        text: methodDeposit.getTitle,
                        style: AppFont.t.s(14).w500.neutral3,
                      ),
                    ),
                  ],
                  if (amount > 0) ...[
                    BoxSpacer.s8,
                    Text(
                      amount.formatCurrency,
                      textAlign: TextAlign.end,
                      style: AppFont.t.s(16).w900.primaryColor,
                    ),
                  ],
                ],
              ),
            ),
            if (onRemove != null) ...[
              BoxSpacer.s8,
              XBaseButton(
                onPressed: onRemove,
                child: Icon(
                  Icons.delete_sweep_rounded,
                  color: AppColors.iconColor,
                  size: 24.sp,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
