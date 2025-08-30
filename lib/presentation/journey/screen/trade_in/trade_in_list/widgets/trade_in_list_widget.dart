import 'package:c_pos/common/extensions/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../../../../common/configs/box.dart';
import '../../../../../../common/enum/enum.dart';
import 'package:c_pos/data/models/models.dart';
import '../../../../../widgets/widgets.dart';
import '../../bloc/trade_in_bloc.dart';

class TradeInListWidget extends StatefulWidget {
  const TradeInListWidget({super.key, required this.tradeInBloc});

  final TradeInBloc tradeInBloc;

  @override
  State<TradeInListWidget> createState() => _TradeInListWidgetState();
}

class _TradeInListWidgetState extends State<TradeInListWidget> {
  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  @override
  void dispose() {
    _refreshController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    int crossAxisCount = context.isSmallScreen ? 1 : 2;
    return BlocConsumer<TradeInBloc, TradeInState>(
      bloc: widget.tradeInBloc,
      buildWhen: (previous, current) =>
          current is GetTradeInDataSuccess ||
          current is IsCriteriaLoading ||
          current is IsCriteriaError,
      listener: (context, state) {
        if (state is UpdateFilterSuccess ||
            state is UpdateDefaultFilterSuccess) {
          widget.tradeInBloc.add(GetTradeInDataEvent());
          _refreshController.refreshCompleted();
        }
        if (!state.pageInfoEntity.checkCanLoadMore) {
          _refreshController.loadNoData();
        }
        if (state.pageInfoEntity.checkCanLoadMore) {
          _refreshController.loadComplete();
        }
      },
      builder: (context, state) {
        if (state is IsCriteriaLoading) {
          return ListView.separated(
            itemCount: 6,
            padding: EdgeInsets.symmetric(horizontal: 20.sp, vertical: 16.sp),
            itemBuilder: (context, index) {
              return const TransactionItemLoading(type: BillType.tradeIn);
            },
            separatorBuilder: (context, index) => BoxSpacer.s16,
          );
        }
        if (state is IsCriteriaError) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              EmptyDataWidget(emptyMessage: state.errorMessage),
            ],
          );
        }
        if (state.tradeIns.isEmpty) {
          return const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              EmptyDataWidget(
                emptyMessage: 'Khách chưa có đơn định giá/thu cũ nào',
              ),
            ],
          );
        }
        return SmartRefresher(
          controller: _refreshController,
          enablePullDown: true,
          enablePullUp: true,
          header: const RefreshWidget(),
          footer: const BottomLoadWidget(
            canLoadingStr: 'Vuốt để lấy thêm đơn',
            noMoreStr: 'Đã hết',
          ),
          onRefresh: () async {
            widget.tradeInBloc.add(GetTradeInDataEvent());
            _refreshController.refreshCompleted();
          },
          onLoading: () {
            widget.tradeInBloc.add(GetMoreTradeInDataEvent());
          },
          child: SingleChildScrollView(
            child: XGridView(
              type: XGridViewType.aligned,
              crossAxisCount: crossAxisCount,
              mainAxisSpacing: 16.sp,
              crossAxisSpacing: 16.sp,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              padding: EdgeInsets.symmetric(horizontal: 20.sp, vertical: 16.sp),
              itemCount: state.tradeIns.length,
              itemBuilder: (context, index) {
                final TradeInModel item = state.tradeIns[index];
                return TransactionItem(
                  billType: BillType.tradeIn,
                  id: item.getBillNumber,
                  amount: item.getFinalBuyingPrice,
                  customerName: item.getCustomerName,
                  customerPhone: item.getCustomerPhone,
                  dateTime: item.getCreateDate,
                  status: item.getStatusStr,
                  color: item.getOrderStatus.getColorStatus,
                  onPressed: () {
                    // MainRouter.instance.pushNamed(
                    //   context,
                    //   routeName: RouteName.tradeInDetailScreen,
                    //   queryParameters: {
                    //     'tradeInId': item.id?.toString(),
                    //   },
                    // );
                  },
                );
              },
            ),
          ),
        );
      },
    );
  }
}
