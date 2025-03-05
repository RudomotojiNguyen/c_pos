part of 'condition_detail_dialog.dart';

class ConditionListData extends StatefulWidget {
  const ConditionListData(
      {super.key, required this.bills, required this.billRefunds});

  final List<CommissionBillModel> bills;
  final List<CommissionBillModel> billRefunds;

  @override
  State<ConditionListData> createState() => _ConditionListDataState();
}

class _ConditionListDataState extends State<ConditionListData> {
  late List<TabData> tabs = [];
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    tabs = [
      TabData(
        index: 0,
        title: const Tab(text: 'Bán hàng'),
        content: ConditionItemData(bills: widget.bills),
      ),
      TabData(
        index: 1,
        title: const Tab(text: 'Trả hàng'),
        content: ConditionItemData(bills: widget.billRefunds),
      )
    ];
  }

  @override
  Widget build(BuildContext context) {
    return DynamicTabBarWidget(
      dynamicTabs: tabs,
      isScrollable: true,
      onTabControllerUpdated: (controller) {
        controller.index = currentIndex;
      },
      onTabChanged: (index) {
        currentIndex = index ?? 0;
      },
      showBackIcon: false,
      showNextIcon: false,
      indicatorColor: AppColors.primaryColor,
      automaticIndicatorColorAdjustment: true,
      indicatorWeight: 4.sp,
      dividerColor: Colors.transparent,
      labelColor: AppColors.primaryColor,
      unselectedLabelColor: AppColors.neutralColor,
      tabAlignment: TabAlignment.center,
    );
  }
}
