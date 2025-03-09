part of 'condition_detail_dialog.dart';

class ConditionBillItem extends StatelessWidget {
  const ConditionBillItem({super.key, required this.billCondition});

  final CommissionBillModel billCondition;

  @override
  Widget build(BuildContext context) {
    return XBaseButton(
      onPressed: () {
        MainRouter.instance.pushNamed(
          context,
          routeName: RouteName.bills,
          queryParameters: {
            'billId': billCondition.id,
          },
        );
      },
      padding: EdgeInsets.symmetric(vertical: 12.sp, horizontal: 12.sp),
      decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(16.sp),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 8.sp,
              offset: const Offset(0, 1), // changes position of shadow
            ),
          ]),
      child: Column(
        children: [
          _top(context),
          const XDivider(),
          _mid(context),
          const XDivider(),
          _bottom(context),
        ],
      ),
    );
  }

  Widget _top(BuildContext ctx) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '# ${billCondition.billNumber}',
          style: AppFont.t.s(),
        ),
        Icon(
          Icons.arrow_forward_ios_rounded,
          size: 16.sp,
          color: AppColors.iconColor,
        ),
      ],
    );
  }

  Widget _mid(BuildContext ctx) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          flex: 6,
          child: Text(
            billCondition.getName,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: AppFont.t.s(),
          ),
        ),
        Expanded(
          flex: 2,
          child: Text(
            'x${billCondition.getQuantity}',
            textAlign: TextAlign.center,
            style: AppFont.t.s(),
          ),
        ),
        Expanded(
          flex: 2,
          child: Text(
            billCondition.getProductAmount.formatCurrency,
            textAlign: TextAlign.end,
            style: AppFont.t.s(),
          ),
        ),
      ],
    );
  }

  Widget _bottom(BuildContext ctx) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Assets.svg.cash.svg(width: 24.sp),
        Text(
          billCondition.getTotalAmount.formatCurrency,
          style: AppFont.t.s(),
        ),
      ],
    );
  }
}
