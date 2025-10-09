import 'package:c_pos/common/extensions/extension.dart';
import 'package:c_pos/presentation/widgets/widgets.dart';
import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../../../common/configs/box.dart';
import '../../../../../common/constants/go_router.dart';
import '../../../../../common/di/injection/injection.dart';
import '../../../../../common/enum/enum.dart';
import 'package:c_pos/data/models/models.dart';
import '../../../../theme/themes.dart';
import '../../../router.dart';
import '../bloc/affiliate_bloc.dart';
import '../widgets/commission_item_detail_widget.dart';
import '../widgets/header_commission_widget.dart';

class AffiliateCommissionScreen extends StatefulWidget {
  const AffiliateCommissionScreen({super.key});

  @override
  State<AffiliateCommissionScreen> createState() =>
      _AffiliateCommissionScreenState();
}

class _AffiliateCommissionScreenState
    extends XStateWidget<AffiliateCommissionScreen>
    with TickerProviderStateMixin {
  final AffiliateBloc _affiliateBloc = getIt.get<AffiliateBloc>();
  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);
  final scrollController = ScrollController();
  TabController? _tabController;

  final ValueNotifier<List<DateTime?>> datesController = ValueNotifier([]);

  @override
  void initState() {
    super.initState();
    _affiliateBloc.add(GetRewardEvent());
    // Khởi tạo TabController với length mặc định
    _tabController = TabController(length: 1, vsync: this);
  }

  @override
  void dispose() {
    _refreshController.dispose();
    _tabController?.dispose();
    datesController.dispose();
    super.dispose();
  }

  @override
  PreferredSizeWidget? buildAppBar(BuildContext context) {
    return XAppBar(
      titleWidget: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Hoa hồng',
                style: AppFont.t.s(16).w600,
              ),
              _dateInfo(),
            ],
          ),
          BoxSpacer.size(40),
        ],
      ),
      actions: [
        XBaseButton(
          onPressed: () {
            MainRouter.instance
                .pushNamed(context, routeName: RouteName.productReward);
          },
          child: Icon(
            Icons.search,
            size: 20.sp,
            color: AppColors.iconColor,
          ),
        ),
        BoxSpacer.s16,
      ],
    );
  }

  @override
  Widget buildContentView(BuildContext context) {
    return BlocConsumer<AffiliateBloc, AffiliateState>(
      bloc: _affiliateBloc,
      buildWhen: (previous, current) =>
          current is IsLoading ||
          current is GetDetailSuccess ||
          current is GetDetailError,
      listener: (context, state) {
        if (state is UpdateFilterSuccess) {
          _affiliateBloc.add(GetRewardEvent());
        }
        // Xử lý refresh completion
        if (state is GetDetailSuccess || state is GetDetailError) {
          _refreshController.refreshCompleted();
        }
      },
      builder: (context, state) {
        if (state is GetDetailError) {
          return const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              EmptyDataWidget(
                emptyMessage: 'Không có dữ liệu trong khoảng thời gian này',
              )
            ],
          );
        }

        if (state is IsLoading) {
          return const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(child: XLoading()),
            ],
          );
        }

        RewardReportModel? detail =
            state is GetDetailSuccess ? state.detail : null;
        if (detail == null) {
          return const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              EmptyDataWidget(
                emptyMessage: 'Không có dữ liệu trong khoảng thời gian này',
              )
            ],
          );
        }
        final listDetail = detail.listDetail ?? [];
        List<Widget> tabs = [];

        if (listDetail.isEmpty) {
          return const SliverToBoxAdapter(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                EmptyDataWidget(emptyMessage: 'Không có thông tin hoa hồng'),
              ],
            ),
          );
        }

        tabs = List.generate(
          listDetail.length,
          (index) {
            final ListDetailCommission commission = listDetail[index];
            return Tab(text: commission.jobTitleName ?? '');
          },
        );

        // Chỉ tạo TabController mới nếu length khác với controller hiện tại
        if (_tabController == null || _tabController!.length != tabs.length) {
          _tabController?.dispose();
          _tabController = TabController(length: tabs.length, vsync: this);
        }

        return SmartRefresher(
          controller: _refreshController,
          enablePullDown: true,
          header: const RefreshWidget(),
          onRefresh: () async {
            _affiliateBloc.add(GetRewardEvent());
          },
          child: NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return [
                // Header Section
                SliverToBoxAdapter(
                    child: HeaderCommissionWidget(
                  commissionsArise: detail.commissionsArise,
                  actualMoneyReceived: detail.actualMoneyReceived,
                  totalProductsSold: detail.totalProductsSold,
                  totalProductReturned: detail.totalProductReturned,
                  otherAmountAdded: detail.otherAmountAdded,
                  otherAmountDeducted: detail.otherAmountDeducted,
                  listBonus: detail.listBonus ?? [],
                  listMinus: detail.listMinus ?? [],
                )),
                // TabBar Section
                SliverPersistentHeader(
                  pinned: true,
                  delegate: TabBarDelegate(
                    TabBar(
                      controller: _tabController,
                      isScrollable: true,
                      labelColor: AppColors.neutralColor,
                      unselectedLabelColor: AppColors.neutral3Color,
                      indicatorColor: AppColors.primaryColor,
                      tabs: tabs,
                    ),
                  ),
                ),
              ];
            },
            body: TabBarView(
              controller: _tabController,
              children: List.generate(
                tabs.length,
                (index) {
                  final ListDetailCommission commission = listDetail[index];
                  return CommissionItemDetail(
                    commission: commission.getListDetail,
                    fromDate: state.fromDate,
                    toDate: state.toDate,
                    jobTitleId: commission.getJobTitleId,
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }

  ///
  /// WIDGET
  ///
  Widget _dateInfo() {
    return BlocBuilder<AffiliateBloc, AffiliateState>(
      bloc: _affiliateBloc,
      buildWhen: (previous, current) => current is UpdateFilterSuccess,
      builder: (context, state) {
        return CustomizePopUpWidget(
          content: _modalFilter([state.fromDate, state.toDate]),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                state.fromDate
                    .formatDateTime(format: XDateTimeEnum.dayMonthYear),
                style: AppFont.t.s(),
              ),
              BoxSpacer.s4,
              Icon(
                Icons.arrow_forward,
                size: 12.sp,
                color: AppColors.neutralColor,
              ),
              BoxSpacer.s4,
              Text(
                state.toDate.formatDateTime(format: XDateTimeEnum.dayMonthYear),
                style: AppFont.t.s(),
              ),
              BoxSpacer.s8,
              Icon(
                Icons.keyboard_arrow_down,
                size: 12.sp,
                color: AppColors.neutralColor,
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _modalFilter(List<DateTime?> datesSelected) {
    datesController.value = datesSelected;
    return SizedBox(
      width: 300.sp,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          XCalenderSelectWidget(
            values: datesSelected,
            lastDate: DateTime.now(),
            calendarType: CalendarDatePicker2Type.range,
            onValueChanged: (dates) {
              datesController.value = dates;
            },
          ),
          XButton(
            padding: EdgeInsets.symmetric(vertical: 8.sp, horizontal: 16.sp),
            title: 'Lọc',
            onPressed: () {
              List<DateTime?> data = datesController.value;

              switch (data.length) {
                case 1:
                  _affiliateBloc.add(UpdateFilterEvent(
                      fromDate: data.first!, toDate: data.first!));
                  break;
                case 2:
                  _affiliateBloc.add(UpdateFilterEvent(
                      fromDate: data.first!, toDate: data.last!));
                  break;
                default:
                  break;
              }

              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}

class TabBarDelegate extends SliverPersistentHeaderDelegate {
  final TabBar tabBar;

  TabBarDelegate(this.tabBar);

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Material(
      color: AppColors.white,
      elevation: 1,
      child: tabBar,
    );
  }

  @override
  double get maxExtent => tabBar.preferredSize.height;

  @override
  double get minExtent => tabBar.preferredSize.height;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
