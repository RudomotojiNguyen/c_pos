import 'package:c_pos/common/enum/enum.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../../../../common/configs/box.dart';
import '../../../../../../common/constants/go_router.dart';
import '../../../../../../data/models/bill_model.dart';
import '../../../../../widgets/widgets.dart';
import '../../../../router.dart';
import '../bloc/bill_bloc.dart';

class BillListWidget extends StatefulWidget {
  const BillListWidget({
    super.key,
    required this.billBloc,
  });

  final BillBloc billBloc;

  @override
  State<BillListWidget> createState() => _BillListWidgetState();
}

class _BillListWidgetState extends State<BillListWidget> {
  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  @override
  void dispose() {
    _refreshController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BillBloc, BillState>(
      bloc: widget.billBloc,
      listener: (context, state) {
        if (state is FilterBillSuccess || state is UpdateSearchTypeSuccess) {
          widget.billBloc.add(GetBillListEvent());
          _refreshController.refreshCompleted();
        }
        if (!state.loadingInfo.canLoadMore) {
          _refreshController.loadNoData();
        }
        if (state.loadingInfo.canLoadMore) {
          _refreshController.loadComplete();
        }
      },
      builder: (context, state) {
        if (state is UpdateLoading) {
          return const TransactionsLoading();
        }
        if (state.bills.isEmpty) {
          return const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              EmptyDataWidget(
                emptyMessage: 'Không có hoá đơn nào',
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
            canLoadingStr: 'Vuốt để lấy thêm hoá đơn',
            noMoreStr: 'Đã hết hoá đơn',
          ),
          onRefresh: () async {
            widget.billBloc.add(GetBillListEvent());
            _refreshController.refreshCompleted();
          },
          onLoading: () {
            widget.billBloc.add(GetMoreBillListEvent());
          },
          child: ListView.separated(
            padding: EdgeInsets.symmetric(horizontal: 20.sp, vertical: 16.sp),
            separatorBuilder: (context, index) => BoxSpacer.s16,
            itemCount: state.bills.length,
            itemBuilder: (BuildContext context, int index) {
              final BillModel item = state.bills[index];
              return TransactionItem(
                id: item.getBillNumber,
                amount: item.getTotalAmount,
                customerName: item.getCustomerName,
                customerPhone: item.getCustomerPhone,
                dateTime: item.getCreateDate,
                status: item.type?.getTitle,
                color: item.type?.getColor,
                customerRank: item.getCustomerRankName,
                onPressed: () {
                  MainRouter.instance.pushNamed(
                    context,
                    routeName: RouteName.bills,
                    queryParameters: {
                      'billId': item.getBillId,
                    },
                  );
                },
              );
            },
          ),
        );
      },
    );
  }
}
