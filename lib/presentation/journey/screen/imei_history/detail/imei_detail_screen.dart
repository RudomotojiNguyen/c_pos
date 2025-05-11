import 'package:dynamic_tabbar/dynamic_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../common/extensions/extension.dart';
import '../../../../theme/themes.dart';
import '../../../../widgets/widgets.dart';
import 'widgets/normal_history_transaction_widget.dart';
import 'widgets/trade_in_history_transaction_widget.dart';

class ImeiDetailScreen extends StatefulWidget {
  const ImeiDetailScreen({super.key, required this.imei});

  final String imei;

  @override
  State<ImeiDetailScreen> createState() => _ImeiDetailScreenState();
}

class _ImeiDetailScreenState extends XStateWidget<ImeiDetailScreen> {
  int currentIndex = 0;
  late List<TabData> tabs = [];

  @override
  Color backgroundColor({Color? color}) {
    return AppColors.white;
  }

  @override
  void initState() {
    tabs = [
      TabData(
        index: 0,
        title: const Tab(text: 'Giao dịch'),
        content: NormalHistoryTransactionWidget(
          imei: widget.imei,
        ),
      ),
      TabData(
        /// todo: chưa có dữ liệu, làm sau
        index: 1,
        title: const Tab(text: 'Thu cũ'),
        content: TradeInHistoryTransactionWidget(
          imei: widget.imei,
        ),
      ),
    ];
    super.initState();
  }

  @override
  PreferredSizeWidget? buildAppBar(BuildContext context) {
    return XAppBar(
        titleWidget: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'Thông tin imei',
          style: AppFont.t.s(16).w600,
        ),
        Text(
          widget.imei,
          style: AppFont.t.s().copyWith(
              fontWeight: FontWeight.normal, color: AppColors.neutral2Color),
        ),
      ],
    ));
  }

  @override
  Widget buildContentView(BuildContext context) {
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

class CustomSliverPersistentHeaderDelegate
    extends SliverPersistentHeaderDelegate {
  final double minHeight;
  final double maxHeight;
  final Widget child;

  CustomSliverPersistentHeaderDelegate({
    required this.minHeight,
    required this.maxHeight,
    required this.child,
  });

  @override
  double get minExtent => minHeight;

  @override
  double get maxExtent => maxHeight;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    double currentExtent =
        (maxHeight - shrinkOffset).clamp(minHeight, maxHeight);
    return SizedBox(
      height: currentExtent,
      child: child,
    );
  }

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
