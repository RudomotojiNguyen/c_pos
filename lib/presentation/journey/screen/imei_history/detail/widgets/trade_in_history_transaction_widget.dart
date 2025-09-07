import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:timelines_plus/timelines_plus.dart';

import '../../../../../../common/configs/box.dart';
import '../../../../../../common/constants/go_router.dart';
import '../../../../../../common/di/injection/injection.dart';
import '../../../../../../common/extensions/extension.dart';
import 'package:c_pos/data/models/models.dart';
import '../../../../../theme/themes.dart';
import '../../../../../widgets/widgets.dart';
import '../../../../router.dart';
import '../../../product/bloc/product_bloc.dart';
import 'imei_transaction_loading.dart';

class TradeInHistoryTransactionWidget extends StatefulWidget {
  const TradeInHistoryTransactionWidget({super.key, required this.imei});

  final String imei;

  @override
  State<TradeInHistoryTransactionWidget> createState() =>
      _TradeInHistoryTransactionWidgetState();
}

class _TradeInHistoryTransactionWidgetState
    extends State<TradeInHistoryTransactionWidget>
    with AutomaticKeepAliveClientMixin {
  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  final ProductBloc productBloc = getIt.get<ProductBloc>();

  @override
  void initState() {
    super.initState();
    // productBloc.add(GetImeiTradeinTransactionEvent(imei: widget.imei));
    debugPrint('TradeInHistoryTransactionWidget initState');
  }

  @override
  void dispose() {
    _refreshController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocBuilder<ProductBloc, ProductState>(
      bloc: productBloc,
      builder: (context, state) {
        if (state is IsLoading) {
          return const ImeiTransactionLoading();
        }

        final List<TradeInTransactionModel> data =
            state is GetTradeinTransactionSuccess
                ? state.listTradeinTransaction
                : [];

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
          enablePullUp: false,
          header: const RefreshWidget(),
          onRefresh: () async {
            _refreshController.refreshCompleted();
            productBloc.add(GetImeiTradeinTransactionEvent(imei: widget.imei));
          },
          child: Timeline.tileBuilder(
            padding: EdgeInsets.symmetric(horizontal: 16.sp),
            theme: TimelineThemeData(
                color: AppColors.primaryColor, nodePosition: 0),
            builder: TimelineTileBuilder.fromStyle(
              contentsAlign: ContentsAlign.basic,
              // addAutomaticKeepAlives: true,
              indicatorStyle: IndicatorStyle.outlined,
              contentsBuilder: (context, index) {
                final TradeInTransactionModel item = data[index];
                return TradeInTransactionWidget(
                  id: item.id?.toString() ?? '',
                  billNumber: item.id?.toString() ?? '',
                  createDate: item.getCreateDate,
                  finalBuyingPrice: item.getFinalBuyingPrice,
                  transactionType: item.getTypeStr,
                  transactionNote: item.note,
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

class TradeInTransactionWidget extends StatelessWidget {
  const TradeInTransactionWidget(
      {super.key,
      required this.id,
      required this.billNumber,
      required this.createDate,
      required this.finalBuyingPrice,
      required this.transactionType,
      this.transactionNote});

  final String id;
  final String billNumber;
  final String createDate;
  final double finalBuyingPrice;
  final String transactionType;
  final String? transactionNote;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.sp, vertical: 16.sp),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            createDate,
            style: AppFont.t.s(9),
          ),
          BoxSpacer.s8,
          Wrap(
            runSpacing: 8.sp,
            spacing: 8.sp,
            children: [
              XStatus(statusStr: billNumber),
              XStatus(
                statusStr: transactionType,
                bgColor: AppColors.pinkLightColor,
              ),
            ],
          ),
          BoxSpacer.s8,
          Text.rich(
            TextSpan(
              style: AppFont.t.s(11).w800,
              text: 'Định giá:',
              children: [
                const TextSpan(text: ' '),
                TextSpan(
                  text: finalBuyingPrice.formatCurrency,
                  style: AppFont.t.s(11).w800.primaryColor,
                ),
              ],
            ),
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
          BoxSpacer.s8,
          Align(
            alignment: Alignment.centerRight,
            child: XBaseButton(
              onPressed: () {
                MainRouter.instance.pushNamed(
                  context,
                  routeName: RouteName.tradeInDetailScreen,
                  queryParameters: {
                    'tradeInId': id,
                  },
                );
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.info_outline,
                    size: 12.sp,
                    color: AppColors.informationColor,
                  ),
                  BoxSpacer.s4,
                  Text(
                    'Chi tiết',
                    style: AppFont.t.s(11).w800.information,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
