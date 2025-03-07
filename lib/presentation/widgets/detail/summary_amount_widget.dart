import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/configs/box.dart';
import '../../../common/enum/enum.dart';
import '../../../common/extensions/extension.dart';
import '../../../data/models/payment_model.dart';
import '../../../gen/gen.dart';
import '../../theme/themes.dart';
import '../widgets.dart';

enum SummaryType { tradeIn, payment }

class SummaryAmountWidget extends StatelessWidget {
  const SummaryAmountWidget({
    super.key,
    this.productBuyingPrice,
    this.finalBuyingPrice,
    this.totalCriteriaPrice,
    this.paymentByCash = const [],
    this.paymentByCredit = const [],
    this.paymentByTransfer = const [],
    this.paymentByInstallment = const [],
    this.summaryType = SummaryType.payment,
  });

  final SummaryType summaryType;

  final double? productBuyingPrice;
  final double? finalBuyingPrice;
  final double? totalCriteriaPrice;

  /// for payment
  final List<PaymentModel> paymentByCash;
  final List<PaymentModel> paymentByCredit;
  final List<PaymentModel> paymentByTransfer;
  final List<PaymentModel> paymentByInstallment;

  double get cashAmount => paymentByCash.fold(0.0,
      (previousValue, element) => previousValue + element.getPaymentAmount);

  double get creditAmount => paymentByCredit.fold(0.0,
      (previousValue, element) => previousValue + element.getPaymentAmount);

  double get transferAmount => paymentByTransfer.fold(0.0,
      (previousValue, element) => previousValue + element.getPaymentAmount);

  double get installmentAmount => paymentByInstallment.fold(0.0,
      (previousValue, element) => previousValue + element.getPaymentAmount);

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
      iconTitle: Assets.svg.wallet.svg(
        width: 22.sp,
        height: 22.sp,
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
              operatorType: Expression.none,
            ),
          ],
          if (totalCriteriaPrice != null) ...[
            BoxSpacer.s8,
            _row(
              context,
              title: 'Tổng tiền trừ hao',
              value: totalCriteriaPrice ?? 0,
              operatorType: Expression.minus,
            ),
          ],
          if (finalBuyingPrice != null) ...[
            BoxSpacer.s8,
            _row(
              context,
              title: 'Giá thu dự kiến',
              value: finalBuyingPrice ?? 0,
              operatorType: Expression.none,
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
      return XContainer(
        margin: EdgeInsets.only(top: 16.sp),
        iconTitle: Assets.svg.wallet.svg(
          width: 22.sp,
          height: 22.sp,
        ),
        title: 'Thanh toán',
        child: const Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            EmptyDataWidget(
              emptyMessage: 'Khách chưa thanh toán',
            )
          ],
        ),
      );
    }

    return XContainer(
      margin: EdgeInsets.only(top: 16.sp),
      iconTitle: Assets.svg.wallet.svg(
        width: 22.sp,
        height: 22.sp,
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

  Widget _row(BuildContext context,
      {required String title,
      required double value,
      required Expression operatorType}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          flex: 7,
          child: Text(
            title,
            style: AppFont.t.s(),
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
  });

  final String title;
  final double amount;
  final List<PaymentModel> subDetail;

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
              Text(
                widget.title,
                style: AppFont.t.s(),
              ),
              Text(
                widget.amount.formatCurrency,
                style: AppFont.t.s().w900.copyWith(
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
            borderRadius: BorderRadius.circular(8.sp),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  item.getPaymentName,
                  style: AppFont.t.s(11).copyWith(
                        fontSize: 11.sp,
                      ),
                  maxLines: 2,
                ),
              ),
              Text(
                item.getAmount,
                style: AppFont.t.s(11).w700,
              ),
            ],
          ),
        );
      },
      separatorBuilder: (context, index) => BoxSpacer.s8,
      itemCount: widget.subDetail.length,
    );
  }
}
