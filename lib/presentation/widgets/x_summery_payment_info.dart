import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../common/configs/box.dart';
import '../../common/enum/enum.dart';
import '../../common/extensions/extension.dart';
import '../../gen/gen.dart';
import 'widgets.dart';

class XSummeryPaymentInfo extends StatelessWidget {
  const XSummeryPaymentInfo({
    super.key,
    required this.totalPriceNoneDiscount,
    required this.totalDiscountPriceOfBillItem,
    required this.discountOfBill,
    required this.discountOfPoint,
    required this.totalPrePayment,
    required this.finalPrice,
  });

  final double totalPriceNoneDiscount;
  final double totalDiscountPriceOfBillItem;
  final double discountOfBill;
  final double discountOfPoint;
  final double totalPrePayment;
  final double finalPrice;

  @override
  Widget build(BuildContext context) {
    return XContainer(
      margin: EdgeInsets.only(top: 16.sp),
      iconTitle: Assets.svg.cash.svg(
        width: 28.sp,
        height: 28.sp,
      ),
      title: 'Thông tin thanh toán',
      child: Column(
        children: [
          _renderRow(
            context,
            title: 'Tổng giá trị',
            value: totalPriceNoneDiscount,
          ),
          if (totalDiscountPriceOfBillItem > 0) ...[
            BoxSpacer.s8,
            _renderRow(
              context,
              title: 'Tổng CK từng SP',
              value: totalDiscountPriceOfBillItem,
              expression: Expression.minus,
            ),
          ],
          if (discountOfBill > 0) ...[
            BoxSpacer.s8,
            _renderRow(
              context,
              title: 'CK tổng hóa đơn',
              value: discountOfBill,
              expression: Expression.minus,
            ),
          ],
          if (discountOfPoint > 0) ...[
            BoxSpacer.s8,
            _renderRow(
              context,
              title: 'Trừ điểm',
              value: discountOfPoint,
              expression: Expression.minus,
            ),
          ],
          if (totalPrePayment > 0) ...[
            BoxSpacer.s8,
            _renderRow(
              context,
              title: 'Đã thanh toán trước',
              value: totalPrePayment,
              expression: Expression.minus,
            ),
          ],
          const XDivider(),
          _renderRow(
            context,
            title: 'Thành tiền',
            value: finalPrice,
          ),
        ],
      ),
    );
  }

  Widget _renderRow(
    BuildContext context, {
    required String title,
    required double value,
    Expression expression = Expression.none,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: AppFont.t.s().w600,
        ),
        Text.rich(
          TextSpan(
            text: expression.getExpressionStr,
            style: AppFont.t.s(16).w800.copyWith(
                  color: expression.getExpressionColor,
                ),
            children: [
              const TextSpan(
                text: ' ',
              ),
              TextSpan(
                text: value.formatCurrency,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
