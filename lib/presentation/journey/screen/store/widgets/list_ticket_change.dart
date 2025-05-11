import 'package:c_pos/common/enum/enum.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../../../common/configs/box.dart';
import '../../../../../common/di/injection/injection.dart';
import '../../../../../common/extensions/extension.dart';
import '../../../../../data/models/history_change_store_model.dart';
import '../../../../theme/themes.dart';
import '../../../../widgets/widgets.dart';
import '../bloc/store_bloc.dart';

class ListTicketChange extends StatefulWidget {
  const ListTicketChange({super.key});

  @override
  State<ListTicketChange> createState() => _ListTicketChangeState();
}

class _ListTicketChangeState extends State<ListTicketChange>
    with AutomaticKeepAliveClientMixin {
  final StoreBloc _storeBloc = getIt.get<StoreBloc>();
  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  @override
  void initState() {
    super.initState();
    _storeBloc.add(GetExchangeHistoryEvent());
  }

  @override
  void dispose() {
    _refreshController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocConsumer<StoreBloc, StoreState>(
      bloc: _storeBloc,
      buildWhen: (previous, current) =>
          current is GetExchangeHistoryLoading ||
          current is GetExchangeHistorySuccess,
      listener: (context, state) {
        if (state.pageInfo.checkCanLoadMore) {
          _refreshController.loadComplete();
        }
        if (!state.pageInfo.checkCanLoadMore) {
          _refreshController.loadNoData();
        }
      },
      builder: (context, state) {
        if (state is GetExchangeHistoryLoading) {
          return const ExchangeHistoryLoading();
        }

        List<HistoryChangeStoreModel> data = state.exchangeHistory;

        if (data.isEmpty) {
          return const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              EmptyDataWidget(emptyMessage: 'Hiện tại bạn không có phiếu nào'),
            ],
          );
        }

        return SmartRefresher(
          controller: _refreshController,
          enablePullDown: true,
          enablePullUp: true,
          header: const RefreshWidget(),
          footer: const BottomLoadWidget(
            canLoadingStr: 'Vuốt để lấy thêm ',
            noMoreStr: 'Đã hết dữ liệu',
          ),
          onRefresh: () async {
            _storeBloc.add(GetExchangeHistoryEvent());
            _refreshController.refreshCompleted();
          },
          onLoading: () {
            _storeBloc.add(GetMoreExchangeHistoryEvent());
          },
          child: ListView.separated(
            padding: EdgeInsets.symmetric(horizontal: 16.sp, vertical: 16.sp),
            itemBuilder: (context, index) {
              final HistoryChangeStoreModel history = data[index];
              return ExchangeHistoryItem(history: history);
            },
            itemCount: data.length,
            separatorBuilder: (context, index) => BoxSpacer.s16,
          ),
        );
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}

class ExchangeHistoryItem extends StatelessWidget {
  const ExchangeHistoryItem({super.key, required this.history});

  final HistoryChangeStoreModel history;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.sp),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16.sp),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(
                Icons.receipt,
                size: 24.sp,
                color: AppColors.primaryColor,
              ),
              BoxSpacer.s8,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      history.getIdStr,
                      style: AppFont.t.s(),
                    ),
                    BoxSpacer.s4,
                    Text(
                      history.getCreateDate,
                      style: AppFont.t.s(),
                    ),
                  ],
                ),
              ),
              XStatus(
                statusStr: history.getStatusName,
                bgColor: history.getExchangeStoreStatus.getColorStatus,
              ),
            ],
          ),
          const XDivider(),
          Stack(
            alignment: Alignment.center,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      padding: EdgeInsets.all(16.sp),
                      width: 200.sp,
                      decoration: BoxDecoration(
                        color: AppColors.disabledColor,
                        borderRadius: BorderRadius.circular(8.sp),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Từ cửa hàng',
                            style: AppFont.t.s(),
                          ),
                          BoxSpacer.s4,
                          Text(
                            history.getCurrentStoreName,
                            textAlign: TextAlign.start,
                            style: AppFont.t.s(),
                          ),
                        ],
                      ),
                    ),
                  ),
                  BoxSpacer.s16,
                  Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      padding: EdgeInsets.all(16.sp),
                      width: 200.sp,
                      decoration: BoxDecoration(
                        color: AppColors.disabledColor,
                        borderRadius: BorderRadius.circular(8.sp),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            'Sang cửa hàng',
                            style: AppFont.t.s(),
                          ),
                          BoxSpacer.s4,
                          Text(
                            history.getTargetStoreName,
                            textAlign: TextAlign.end,
                            style: AppFont.t.s(),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Positioned(
                child: CircleAvatar(
                  radius: 16.sp,
                  backgroundColor: AppColors.warningColor,
                  child: Icon(
                    Icons.arrow_downward,
                    size: 18.sp,
                    color: AppColors.white,
                  ),
                ),
              )
            ],
          ),
          if (history.getDescription.isNotNullOrEmpty) ...[
            const XDivider(),
            Text(
              'Lý do:',
              style: AppFont.t.s(),
            ),
            BoxSpacer.s4,
            Text(
              history.getDescription,
              style: AppFont.t.s(),
            ),
          ],
        ],
      ),
    );
  }
}
