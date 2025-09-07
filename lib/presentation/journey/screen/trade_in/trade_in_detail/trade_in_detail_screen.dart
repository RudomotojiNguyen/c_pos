import 'package:c_pos/common/enum/enum.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../../../common/di/injection/injection.dart';
import 'package:c_pos/data/models/models.dart';
import '../../../../widgets/widgets.dart';
import '../bloc/trade_in_bloc.dart';
import 'widgets/product_trade_in_info_widget.dart';
import 'widgets/trade_check_list_widget.dart';
import 'widgets/upload_file_trade_in_widget.dart';

class TradeInDetailScreen extends StatefulWidget {
  const TradeInDetailScreen({super.key, required this.tradeInId});

  final int tradeInId;

  @override
  State<TradeInDetailScreen> createState() => _TradeInDetailScreenState();
}

class _TradeInDetailScreenState extends XStateWidget<TradeInDetailScreen> {
  final TradeInBloc _tradeInBloc = getIt.get<TradeInBloc>();
  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  @override
  void initState() {
    super.initState();
    _tradeInBloc.add(GetTradeInDataDetailEvent(widget.tradeInId));
  }

  @override
  void dispose() {
    _refreshController.dispose();
    super.dispose();
  }

  @override
  PreferredSizeWidget? buildAppBar(BuildContext context) {
    return const XAppBar(
      title: 'Chi tiết đơn',
    );
  }

  @override
  Widget buildContentView(BuildContext context) {
    return BlocBuilder<TradeInBloc, TradeInState>(
      bloc: _tradeInBloc,
      builder: (context, state) {
        if (state is IsCriteriaLoading) {
          return const TradeInLoading();
        }
        if (state is GetDetailError) {
          return const EmptyDataWidget(
            emptyMessage: 'Không tìm thấy thông tin phiếu',
          );
        }

        final TradeInModel? data =
            (state is GetTradeInDetailSuccess) ? state.tradeIndDetail : null;

        if (data == null) {
          return const EmptyDataWidget(
            emptyMessage: 'Không tìm thấy thông tin phiếu',
          );
        }

        return SmartRefresher(
          controller: _refreshController,
          enablePullDown: true,
          enablePullUp: false,
          header: const RefreshWidget(),
          onRefresh: () async {
            _tradeInBloc.add(GetTradeInDataDetailEvent(widget.tradeInId));
            _refreshController.refreshCompleted();
          },
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 16.sp, vertical: 16.sp),
            child: Column(
              children: [
                NormalDetailWidget(
                  createDate: data.getCreateDate,
                  storeName: data.getStoreName,
                  id: data.getBillNumber,
                  statusName: data.getStatusStr,
                  statusColor: data.getOrderStatus.getColorStatus,
                  employeeName: data.createdBy,
                ),
                CustomerInfoWidget(
                  customerName: data.getCustomerName,
                  customerPhone: data.getCustomerPhone,
                  customerIdCart: data.getIdCard,
                  customerLocation: data.getLocationSrt,
                ),
                ProductTradeInInfoWidget(
                  productName: data.getProductName,
                  productImei: data.getProductImei,
                  productImage: data.getProductImage,
                  productBuyingPrice: data.getProductBuyingPrice,
                  barCode: data.productBarCode,
                ),
                UploadFileTradeInWidget(
                  id: data.id!,
                  isCanAction: data.isCanAction,
                ),
                NoteDetailWidget(note: data.note),
                TradeCheckListWidget(listCriteria: data.listCriteria ?? []),
                SummaryAmountWidget(
                  summaryType: SummaryType.tradeIn,
                  productBuyingPrice: data.getProductBuyingPrice,
                  estimationBuyingPrice: data.getEstimationBuyingPrice,
                  finalBuyingPrice: data.getFinalBuyingPrice,
                  totalCriteriaPrice: data.getTotalCriteriaPrice,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
