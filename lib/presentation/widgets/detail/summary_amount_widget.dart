import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/configs/box.dart';
import '../../../common/enum/enum.dart';
import '../../../common/extensions/extension.dart';
import 'package:c_pos/data/models/models.dart';
import '../../theme/themes.dart';
import '../widgets.dart';

enum SummaryType { tradeIn, payment }

class SummaryAmountWidget extends StatelessWidget {
  const SummaryAmountWidget({
    super.key,
    this.productBuyingPrice,
    this.finalBuyingPrice,
    this.estimationBuyingPrice,
    this.totalCriteriaPrice,
    this.paymentByCash = const [],
    this.paymentByCredit = const [],
    this.paymentByTransfer = const [],
    this.paymentByInstallment = const [],
    this.summaryType = SummaryType.payment,
    this.onPressPaymentQR,
  });

  final SummaryType summaryType;

  final double? productBuyingPrice;
  final double? finalBuyingPrice;
  final double? estimationBuyingPrice;
  final double? totalCriteriaPrice;

  /// for payment
  final List<PaymentModel> paymentByCash;
  final List<PaymentModel> paymentByCredit;
  final List<PaymentModel> paymentByTransfer;
  final List<PaymentModel> paymentByInstallment;

  final Function(PaymentModel)? onPressPaymentQR;

  double get cashAmount => paymentByCash.fold(
        0.0,
        (previousValue, element) => previousValue + element.getPaymentAmount,
      );

  double get creditAmount => paymentByCredit.fold(
        0.0,
        (previousValue, element) => previousValue + element.getPaymentAmount,
      );

  double get transferAmount => paymentByTransfer.fold(
        0.0,
        (previousValue, element) => previousValue + element.getPaymentAmount,
      );

  double get installmentAmount => paymentByInstallment.fold(
        0.0,
        (previousValue, element) => previousValue + element.getPaymentAmount,
      );

  @override
  Widget build(BuildContext context) {
    if (summaryType == SummaryType.tradeIn) {
      return _tradeInPayment(context);
    }
    return _paymentInfo(context);
  }

  Widget _tradeInPayment(BuildContext context) {
    return XContainer(
      margin: EdgeInsets.only(top: 16.sp),
      iconTitle: Icon(
        Icons.wallet,
        size: 18.sp,
        color: AppColors.neutral3Color,
      ),
      title: 'Tổng kết',
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (productBuyingPrice != null) ...[
            _row(
              context,
              title: 'Giá thu lại',
              value: productBuyingPrice ?? 0,
              operatorType: XExpression.none,
            ),
          ],
          if (totalCriteriaPrice != null) ...[
            BoxSpacer.s8,
            _row(
              context,
              title: 'Tổng tiền trừ hao',
              value: totalCriteriaPrice ?? 0,
              operatorType: XExpression.minus,
            ),
          ],
          if (estimationBuyingPrice != null) ...[
            BoxSpacer.s8,
            _row(
              context,
              title: 'Giá thu dự kiến',
              value: estimationBuyingPrice ?? 0,
              operatorType: XExpression.none,
            ),
          ],
          if (finalBuyingPrice != null) ...[
            BoxSpacer.s8,
            _row(
              context,
              title: 'Giá thu cuối cùng',
              value: finalBuyingPrice ?? 0,
              operatorType: XExpression.add,
            ),
          ],
        ],
      ),
    );
  }

  Widget _paymentInfo(BuildContext context) {
    if (paymentByCash.isEmpty &&
        paymentByTransfer.isEmpty &&
        paymentByCredit.isEmpty &&
        paymentByInstallment.isEmpty) {
      return BoxSpacer.blank;
    }

    return XContainer(
      margin: EdgeInsets.only(top: 16.sp),
      iconTitle: Icon(
        Icons.wallet,
        size: 18.sp,
        color: AppColors.neutral3Color,
      ),
      title: 'Thanh toán',
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (paymentByCash.isNotEmpty) ...[
            TransactionPaymentItem(
              title: 'Tiền mặt',
              amount: cashAmount,
              subDetail: paymentByCash,
            ),
          ],
          if (paymentByTransfer.isNotEmpty) ...[
            TransactionPaymentItem(
              title: 'Chuyển khoản',
              amount: transferAmount,
              subDetail: paymentByTransfer,
              onPressPaymentQR: onPressPaymentQR,
            ),
          ],
          if (paymentByCredit.isNotEmpty) ...[
            TransactionPaymentItem(
              title: 'Cà thẻ',
              amount: creditAmount,
              subDetail: paymentByCredit,
            ),
          ],
          if (paymentByInstallment.isNotEmpty) ...[
            TransactionPaymentItem(
              title: 'Trả góp',
              amount: installmentAmount,
              subDetail: paymentByInstallment,
            ),
          ],
        ],
      ),
    );
  }

  Widget _row(
    BuildContext context, {
    required String title,
    required double value,
    required XExpression operatorType,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          flex: 7,
          child: Text(
            title,
            style: AppFont.t.s().copyWith(
                  fontWeight: FontWeight.normal,
                ),
          ),
        ),
        Expanded(
          flex: 3,
          child: Text(
            value.formatCurrency,
            style: AppFont.t.s().copyWith(
                  color: operatorType.getExpressionColor,
                ),
            textAlign: TextAlign.end,
          ),
        ),
      ],
    );
  }
}

class TransactionPaymentItem extends StatefulWidget {
  const TransactionPaymentItem({
    super.key,
    required this.title,
    required this.amount,
    required this.subDetail,
    this.onPressPaymentQR,
  });

  final String title;
  final double amount;
  final List<PaymentModel> subDetail;
  final Function(PaymentModel)? onPressPaymentQR;
  @override
  State<TransactionPaymentItem> createState() => _TransactionPaymentItemState();
}

class _TransactionPaymentItemState extends State<TransactionPaymentItem> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    if (widget.amount == 0) return BoxSpacer.blank;

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.sp),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(widget.title, style: AppFont.t.s()),
              Text(
                widget.amount.formatCurrency,
                style: AppFont.t.s().copyWith(
                      fontWeight: FontWeight.w900,
                      color: AppColors.primaryColor,
                    ),
              ),
            ],
          ),
          _transactionDetail(),
        ],
      ),
    );
  }

  Widget _transactionDetail() {
    if (widget.subDetail.isEmpty) return BoxSpacer.blank;
    return ListView.separated(
      padding: EdgeInsets.only(top: 8.sp),
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) {
        final PaymentModel item = widget.subDetail[index];
        return Container(
          padding: EdgeInsets.symmetric(vertical: 12.sp, horizontal: 16.sp),
          decoration: BoxDecoration(
            color: AppColors.primaryLightColor,
            borderRadius: BorderRadius.all(AppRadius.xxm),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  item.getPaymentName,
                  style: AppFont.t.s().copyWith(
                        fontSize: 11.sp,
                      ),
                  maxLines: 2,
                ),
              ),
              Text(
                item.getAmount,
                style: AppFont.t.s().copyWith(
                      fontWeight: FontWeight.w700,
                      fontSize: 11.sp,
                    ),
              ),

              /// todo: chuyển số 1 thành enum success
              if (item.getPaymentType == PaymentType.transfer &&
                  item.status != 1 &&
                  widget.onPressPaymentQR != null) ...[
                BoxSpacer.s16,
                XBaseButton(
                  onPressed: () => widget.onPressPaymentQR!(item),
                  child: Icon(
                    Icons.qr_code,
                    size: 24.sp,
                    color: AppColors.primaryColor,
                  ),
                ),
              ],
            ],
          ),
        );
      },
      separatorBuilder: (context, index) => BoxSpacer.s8,
      itemCount: widget.subDetail.length,
    );
  }
}
