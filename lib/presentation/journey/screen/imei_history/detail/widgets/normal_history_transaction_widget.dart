import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:timelines_plus/timelines_plus.dart';

import '../../../../../../common/configs/box.dart';
import '../../../../../../common/di/injection/injection.dart';
import '../../../../../../common/extensions/extension.dart';
import '../../../../../../data/models/imei_transaction_model.dart';
import '../../../../../theme/themes.dart';
import '../../../../../widgets/widgets.dart';
import '../../../product/bloc/product_bloc.dart';
import 'imei_transaction_loading.dart';

class NormalHistoryTransactionWidget extends StatefulWidget {
  const NormalHistoryTransactionWidget({super.key, required this.imei});

  final String imei;

  @override
  State<NormalHistoryTransactionWidget> createState() =>
      _NormalHistoryTransactionWidgetState();
}

class _NormalHistoryTransactionWidgetState
    extends State<NormalHistoryTransactionWidget>
    with AutomaticKeepAliveClientMixin {
  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  final ProductBloc productBloc = getIt.get<ProductBloc>();

  @override
  void initState() {
    super.initState();
    productBloc.add(GetImeiTransactionEvent(imei: widget.imei));
  }

  @override
  void dispose() {
    _refreshController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocConsumer<ProductBloc, ProductState>(
      bloc: productBloc,
      buildWhen: (previous, current) =>
          current is GetImeiTransactionSuccess || current is IsLoading,
      listener: (context, state) {
        if (!state.pageInfo.checkCanLoadMore) {
          _refreshController.loadNoData();
        }
        if (state.pageInfo.checkCanLoadMore) {
          _refreshController.loadComplete();
        }
      },
      builder: (context, state) {
        if (state is IsLoading) {
          return const ImeiTransactionLoading();
        }

        final List<ImeiTransactionModel> data =
            state is GetImeiTransactionSuccess ? state.listImeiTransaction : [];

        if (data.isEmpty) {
          return const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              EmptyDataWidget(
                emptyMessage: 'Không có giao dịch nào',
              ),
            ],
          );
        }

        return SmartRefresher(
          controller: _refreshController,
          enablePullDown: true,
          enablePullUp: true,
          header: const RefreshWidget(),
          footer: const BottomLoadWidget(),
          onRefresh: () async {
            _refreshController.refreshCompleted();
            productBloc.add(GetImeiTransactionEvent(imei: widget.imei));
          },
          onLoading: () {
            productBloc.add(GetMoreImeiTransactionEvent(imei: widget.imei));
          },
          child: Timeline.tileBuilder(
            padding: EdgeInsets.symmetric(horizontal: 16.sp, vertical: 16.sp),
            theme: TimelineThemeData(
                color: AppColors.primaryColor, nodePosition: 0),
            builder: TimelineTileBuilder.fromStyle(
              contentsAlign: ContentsAlign.basic,
              // addAutomaticKeepAlives: true,
              indicatorStyle: IndicatorStyle.outlined,
              contentsBuilder: (context, index) {
                final ImeiTransactionModel item = data[index];
                return ImeiTransactionWidget(
                  createDate: item.getCreateDate,
                  transactionCode: item.getTransactionCode,
                  actionName: item.getActionName,
                  creator: item.getCreator,
                  productName: item.productName,
                );
              },
              itemCount: data.length,
            ),
          ),
        );
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}

class ImeiTransactionWidget extends StatelessWidget {
  const ImeiTransactionWidget({
    super.key,
    required this.createDate,
    this.transactionNote,
    this.transactionCode,
    this.actionName,
    this.creator,
    this.productName,
  });

  final String createDate;
  final String? transactionNote;
  final String? transactionCode;
  final String? actionName;
  final String? creator;
  final String? productName;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.sp, vertical: 16.sp),
      margin: EdgeInsets.only(bottom: 16.sp, left: 8.sp),
      decoration: BoxDecoration(
        color: AppColors.lightGreyColor,
        borderRadius: BorderRadius.all(AppRadius.l),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                createDate,
                style: AppFont.t.s(9),
              ),
              if (transactionCode.isNotNullOrEmpty) ...[
                Wrap(
                  runSpacing: 8.sp,
                  spacing: 8.sp,
                  children: [
                    XStatus(statusStr: transactionCode!),
                  ],
                ),
              ],
            ],
          ),
          BoxSpacer.s8,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              if (creator.isNotNullOrEmpty) ...[
                Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.person,
                      size: 12.sp,
                      color: AppColors.neutral2Color,
                    ),
                    BoxSpacer.s4,
                    Text(
                      creator!,
                      style: AppFont.t.s(11).neutral2,
                    ),
                  ],
                ),
              ],
              if (actionName.isNotNullOrEmpty) ...[
                BoxSpacer.s8,
                Row(
                  children: [
                    Icon(
                      Icons.touch_app,
                      size: 12.sp,
                      color: AppColors.neutral2Color,
                    ),
                    BoxSpacer.s4,
                    Text(
                      actionName!,
                      style: AppFont.t.s(11).neutral2,
                    ),
                  ],
                ),
              ],
            ],
          ),
          if (transactionNote.isNotNullOrEmpty) ...[
            BoxSpacer.s8,
            Text.rich(
              TextSpan(
                style: AppFont.t.s(11).w800.underline,
                text: 'Ghi chú:',
                children: [
                  TextSpan(
                    text: ' ',
                    style: AppFont.t.s(),
                  ),
                  TextSpan(
                    text: transactionNote!,
                    style: AppFont.t.s(11),
                  ),
                ],
              ),
            )
          ],
          if (productName.isNotNullOrEmpty) ...[
            BoxSpacer.s8,
            Text(
              productName!,
              style: AppFont.t.s(11).w800,
            ),
          ],
        ],
      ),
    );
  }
}
