import 'package:c_pos/common/di/injection/injection.dart';
import 'package:dynamic_tabbar/dynamic_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../common/configs/box.dart';
import '../../../../theme/themes.dart';
import '../../../../widgets/widgets.dart';
import '../bloc/customer_bloc.dart';
import 'widgets/customer_bills_widget.dart';
import 'widgets/customer_orders_widget.dart';
import 'widgets/customer_trade_in_widget.dart';
import 'widgets/customer_warranties_widget.dart';

class CustomerHistoryScreen extends StatefulWidget {
  const CustomerHistoryScreen({super.key, required this.customerId});

  final int customerId;

  @override
  State<CustomerHistoryScreen> createState() => _CustomerHistoryScreenState();
}

class _CustomerHistoryScreenState extends XStateWidget<CustomerHistoryScreen> {
  final CustomerBloc _customerBloc = getIt.get<CustomerBloc>();
  final ValueNotifier<List<TabData>> tabs = ValueNotifier([]);
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _customerBloc.add(GetCustomerByIdEvent(widget.customerId));
  }

  @override
  PreferredSizeWidget? buildAppBar(BuildContext context) {
    return const XAppBar(
      title: 'Thông tin khách hàng',
    );
  }

  @override
  Widget buildContentView(BuildContext context) {
    return BlocBuilder<CustomerBloc, CustomerState>(
      bloc: _customerBloc,
      buildWhen: (previous, current) =>
          current is GetCustomerDetailSuccess || current is UpdateIsLoading,
      builder: (context, state) {
        if (state is UpdateIsLoading) {
          return _loadingWidget();
        }

        if (state is GetCustomerDetailSuccess) {
          List<TabData> tabs = [
            TabData(
              index: 1,
              title: const Tab(text: 'Hóa đơn'),
              content: CustomerBillsWidget(customer: state.customer),
            ),
            TabData(
              index: 2,
              title: const Tab(text: 'Đơn hàng'),
              content: CustomerOrdersWidget(customer: state.customer),
            ),
            TabData(
              index: 3,
              title: const Tab(text: 'Thu cũ'),
              content: CustomerTradeInWidget(customer: state.customer),
            ),
            TabData(
              index: 4,
              title: const Tab(text: 'Bảo hành'),
              content: CustomerWarrantiesWidget(customer: state.customer),
            ),
          ];
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

        return BoxSpacer.blank;
      },
    );
  }

  Widget _loadingWidget() {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(vertical: 8.sp, horizontal: 16.sp),
          color: AppColors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ...List.generate(
                  4,
                  (index) => const XPlaceHolder(
                        width: 80,
                        height: 16,
                      )),
            ],
          ),
        ),
        Expanded(
          child: ListView.separated(
            padding: EdgeInsets.symmetric(horizontal: 20.sp, vertical: 16.sp),
            itemBuilder: (context, index) => const TransactionItemLoading(),
            separatorBuilder: (context, index) => BoxSpacer.s16,
            itemCount: 10,
          ),
        ),
      ],
    );
  }
}
