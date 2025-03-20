part of '../drafting_detail_screen.dart';

class PaymentMethodDetailWidget extends StatelessWidget {
  const PaymentMethodDetailWidget({
    super.key,
    required this.payments,
    required this.title,
    required this.onRemove,
    required this.onUpdate,
  });

  final List<PaymentMethodTable> payments;
  final String title;
  final Function(int paymentMethodId) onRemove;
  final Function(PaymentMethodTable paymentMethod) onUpdate;

  @override
  Widget build(BuildContext context) {
    if (payments.isEmpty) {
      return BoxSpacer.blank;
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BoxSpacer.s8,
        Text(
          title,
          style: AppFont.t.s(16).w600,
        ),
        BoxSpacer.s2,
        _groupDetail(context),
      ],
    );
  }

  Widget _groupDetail(BuildContext context) {
    return XGridView(
      type: XGridViewType.aligned,
      itemCount: payments.length,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      padding: EdgeInsets.symmetric(horizontal: 8.sp),
      crossAxisCount: context.isSmallScreen ? 1 : 2,
      crossAxisSpacing: 16.sp,
      mainAxisSpacing: 16.sp,
      itemBuilder: (context, index) {
        final PaymentMethodTable paymentMethodItem = payments[index];

        if (paymentMethodItem.accountDetail != null) {
          return PaymentMethodItemWidget(
            accountName: paymentMethodItem.accountDetail!.getName,
            accountNumber: paymentMethodItem.accountDetail!.getAccountBankNo,
            amount: paymentMethodItem.amount ?? 0,
            onPressed: () {
              onUpdate(paymentMethodItem);
            },
            onRemove: () {
              onRemove(paymentMethodItem.id);
            },
          );
        }

        if (paymentMethodItem.installmentMethod != null) {
          return PaymentMethodItemWidget(
            accountName: paymentMethodItem.installmentMethod!.getName,
            amount: paymentMethodItem.amount ?? 0,
            methodDeposit: paymentMethodItem.methodDeposit,
            onRemove: () {
              onRemove(paymentMethodItem.id);
            },
            onPressed: () {
              onUpdate(paymentMethodItem);
            },
            accountNumber: '',
          );
        }

        return BoxSpacer.blank;
      },
    );
  }
}
