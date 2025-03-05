part of 'condition_detail_dialog.dart';

class ConditionItemData extends StatelessWidget {
  const ConditionItemData({super.key, required this.bills});

  final List<CommissionBillModel> bills;

  @override
  Widget build(BuildContext context) {
    if (bills.isEmpty) {
      return const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          EmptyDataWidget(
            emptyMessage: 'Không có hóa đơn',
          ),
        ],
      );
    }
    return ListView.separated(
      padding: EdgeInsets.symmetric(vertical: 16.sp, horizontal: 8.sp),
      itemBuilder: (context, index) {
        CommissionBillModel item = bills[index];
        return ConditionBillItem(billCondition: item);
      },
      separatorBuilder: (context, index) => BoxSpacer.s8,
      itemCount: bills.length,
    );
  }
}
