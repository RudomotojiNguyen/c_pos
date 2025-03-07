import 'package:c_pos/common/enum/enum.dart';
import 'package:c_pos/common/extensions/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../../../common/configs/box.dart';
import '../../../../../common/di/injection/injection.dart';
import '../../../../../data/models/bill_model.dart';
import '../../../../theme/themes.dart';
import '../../../../widgets/widgets.dart';
import '../../setting/bloc/setting_bloc.dart';
import '../list/bloc/bill_bloc.dart';

class BillDetail extends StatefulWidget {
  const BillDetail({
    super.key,
    required this.billId,
  });

  final String billId;

  @override
  State<BillDetail> createState() => _BillDetailState();
}

class _BillDetailState extends XStateWidget<BillDetail> {
  final BillBloc _billBloc = getIt.get<BillBloc>();
  final SettingBloc settingBloc = getIt.get<SettingBloc>();
  // final CartStorage _cartStorage = getIt.get<CartStorage>();

  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  @override
  void initState() {
    super.initState();
    _billBloc.add(GetBillDetailEvent(widget.billId));
  }

  @override
  PreferredSizeWidget? buildAppBar(BuildContext context) {
    return XAppBar(
      title: 'Chi tiết',
      actions: [
        _rightActions(),
        BoxSpacer.s16,
      ],
    );
  }

  @override
  Widget buildContentView(BuildContext context) {
    return BlocBuilder<BillBloc, BillState>(
      bloc: _billBloc,
      builder: (context, state) {
        if (state is UpdateLoading) {
          return const LoadingDetailWidget();
        }

        if (state is GetDataError) {
          return _emptyData();
        }

        final BillModel? billDetail =
            state is GetBillDetailSuccess ? state.billDetail : null;

        if (billDetail == null) {
          return _emptyData();
        }
        return SmartRefresher(
          controller: _refreshController,
          enablePullDown: true,
          header: const RefreshWidget(),
          onRefresh: () async {
            _billBloc.add(GetBillDetailEvent(widget.billId));
            _refreshController.refreshCompleted();
          },
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 20.sp, vertical: 20.sp),
            child: Column(
              children: [
                if (billDetail.getOrderId > 0) ...[
                  _orderInfo(billDetail),
                ],
                NormalDetailWidget(
                    createDate: billDetail.getCreateDate,
                    storeName: billDetail.getStoreName,
                    id: billDetail.getBillNumber,
                    typeName: billDetail.type?.getTitle,
                    statusColor: billDetail.type?.getColor,
                    employeeName: billDetail.getSaleName,
                    cashierName: billDetail.getCashierName,
                    techName: billDetail.getTechName,
                    point: billDetail.getSubtractPoint),
                CustomerInfoWidget(
                  customerName: billDetail.getCustomerName,
                  customerPhone: billDetail.getCustomerPhone,
                  customerLocation: billDetail.getCustomerAddress,
                  customerDOB: billDetail.getCustomerDOB,
                  customerIdCart: '',
                  customerTypeName: billDetail.getCustomerRankName,
                ),
                ProductDetailWidget(products: billDetail.products),
                XSummeryPaymentInfo(
                  totalPriceNoneDiscount: billDetail.getTotalPriceNoneDiscount,
                  totalDiscountPriceOfBillItem:
                      billDetail.getTotalDiscountPriceOfBillItem,
                  discountOfBill: billDetail.calculateDiscountOfBill,
                  discountOfPoint: billDetail.calculateDiscountOfPoint,
                  totalPrePayment: billDetail.calculateTotalPrePayment,
                  finalPrice: billDetail.calculateFinalPrice,
                ),
                SummaryAmountWidget(
                  paymentByCash: billDetail.paymentByCash,
                  paymentByCredit: billDetail.paymentByCredit,
                  paymentByTransfer: billDetail.paymentByTransfer,
                  paymentByInstallment: billDetail.paymentByInstallment,
                ),
                NoteDetailWidget(
                  saleNote: billDetail.getSaleNote,
                  customerNote: billDetail.getCustomerNote,
                  warrantyNote: billDetail.getWarrantyNote,
                )
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _orderInfo(BillModel billDetail) {
    return InfoIdUpdateWidget(orderId: billDetail.getOrderId);
  }

  Widget _emptyData() {
    return const Column(
      children: [
        EmptyDataWidget(
          emptyMessage: 'Không tìm thấy thông tin hoá đơn',
        ),
      ],
    );
  }

  Widget _rightActions() {
    return BlocBuilder<BillBloc, BillState>(
      bloc: _billBloc,
      builder: (context, state) {
        final BillModel? billDetail =
            state is GetBillDetailSuccess ? state.billDetail : null;

        // Set<XFeatureFlagEnum> featuresFlag = settingBloc.state.userFeatureFlag;

        if (billDetail != null) {
          List<Widget> operations = [];

          //   if (featuresFlag.contains(XFeatureFlagEnum.attachWarrantyImei)) {
          //     // bảo hành
          //     operations.add(XBaseButton(
          //       padding: EdgeInsets.symmetric(vertical: 10.sp, horizontal: 16.sp),
          //       onPressed: () {
          //         // todo: cho chọn sản phẩm để bảo hành
          //       },
          //       child: Text(
          //         'Tạo bảo hành',
          //         style: AppFont.t.s(11),
          //       ),
          //     ));
          //   }

          if (billDetail.checkCanEditBill) {
            // edit phiếu
            operations.add(XBaseButton(
              padding: EdgeInsets.symmetric(vertical: 10.sp, horizontal: 16.sp),
              onPressed: () {
                _convertToCartTable(
                  typeCart: CartType.updateBill,
                  billDetail: billDetail,
                );
              },
              child: Text(
                'Cập nhật đơn',
                style: AppFont.t.s(11),
              ),
            ));
          }

          if (operations.isNotEmpty) {
            return XBaseButton(
              baseButtonType: BaseButtonType.tapOperation,
              secondaryWidget: Container(
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(16.sp),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: operations,
                ),
              ),
              child: Icon(
                Icons.more_vert,
                size: 24.sp,
                color: AppColors.iconColor,
              ),
            );
          }
        }

        return BoxSpacer.blank;
      },
    );
  }

  ///
  /// METHOD
  ///
  _convertToCartTable(
      {required CartType typeCart, required BillModel billDetail}) async {
    // final cart = await _cartStorage.convertBillDetailToCartStorage(
    //   billDetail: billDetail,
    //   typeCart: typeCart,
    // );
    // if (cart != null) {
    //   MainRouter.instance.pushNamed(
    //     context,
    //     routeName: CoreRouteName.draftBillDetail,
    //     queryParameters: {'currentDraftId': cart.id.toString()},
    //   );
    // }
  }
}
