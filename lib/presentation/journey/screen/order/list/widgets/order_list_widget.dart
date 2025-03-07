import 'package:c_pos/common/enum/enum.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../../../../common/configs/box.dart';
import '../../../../../../common/constants/go_router.dart';
import '../../../../../../data/models/order_model.dart';
import '../../../../../widgets/widgets.dart';
import '../../../../router.dart';
import '../../bloc/order_bloc.dart';

class OrderListWidget extends StatefulWidget {
  const OrderListWidget({super.key, required this.orderBloc});

  final OrderBloc orderBloc;

  @override
  State<OrderListWidget> createState() => _OrderListWidgetState();
}

class _OrderListWidgetState extends State<OrderListWidget> {
  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  @override
  void dispose() {
    _refreshController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OrderBloc, OrderState>(
      bloc: widget.orderBloc,
      buildWhen: (previous, current) =>
          current is GetOrderSuccess || current is UpdateLoading,
      listener: (context, state) {
        if (state is FilterOrderSuccess || state is UpdateSearchTypeSuccess) {
          widget.orderBloc.add(GetOrderEvent());
          _refreshController.refreshCompleted();
        }
        if (state.loadingInfo.canLoadMore) {
          _refreshController.loadComplete();
        }
        if (!state.loadingInfo.canLoadMore) {
          _refreshController.loadNoData();
        }
      },
      builder: (context, state) {
        if (state is UpdateLoading) {
          return const TransactionsLoading();
        }
        if (state.orders.isEmpty) {
          return const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              EmptyDataWidget(
                emptyMessage: 'Không có đơn hàng nào',
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
            canLoadingStr: 'Vuốt để lấy thêm đơn hàng',
            noMoreStr: 'Đã hết đơn hàng',
          ),
          onRefresh: () async {
            widget.orderBloc.add(GetOrderEvent());
            _refreshController.refreshCompleted();
          },
          onLoading: () {
            widget.orderBloc.add(GetMoreOrderEvent());
          },
          child: ListView.separated(
            padding: EdgeInsets.symmetric(horizontal: 20.sp, vertical: 16.sp),
            itemCount: state.orders.length,
            itemBuilder: (context, index) {
              final OrderModel item = state.orders[index];
              return TransactionItem(
                id: item.getBillNumber,
                amount: item.getTotalAmount,
                customerName: item.getCustomerName,
                customerPhone: item.getCustomerPhone,
                dateTime: item.getCreateDate,
                status: item.getOrderStatus.getTitle,
                color: item.getOrderStatus.getColorStatus,
                onPressed: () {
                  MainRouter.instance.pushNamed(
                    context,
                    routeName: RouteName.orderDetail,
                    queryParameters: {
                      'orderId': item.id?.toString(),
                    },
                  );
                },
              );
            },
            separatorBuilder: (context, index) => BoxSpacer.s16,
          ),
        );
      },
    );
  }
}
