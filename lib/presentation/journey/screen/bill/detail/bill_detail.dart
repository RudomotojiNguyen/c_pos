import 'package:c_pos/common/enum/enum.dart';
import 'package:c_pos/data/datasources/local_data/local_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../../../common/configs/box.dart';
import '../../../../../common/constants/go_router.dart';
import '../../../../../common/di/injection/injection.dart';
import 'package:c_pos/data/models/models.dart';
import '../../../../../common/extensions/extension.dart';
import '../../../../theme/themes.dart';
import '../../../../widgets/detail/employee_detail_widget.dart';
import '../../../../widgets/widgets.dart';
import '../../../router.dart';
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
  final DraftingStorage _cartStorage = getIt.get<DraftingStorage>();

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
                  // employeeName: billDetail.getSaleName,
                  // cashierName: billDetail.getCashierName,
                  // techName: billDetail.getTechName,
                  point: billDetail.getSubtractPoint,
                ),
                CustomerInfoWidget(
                  customerName: billDetail.getCustomerName,
                  customerPhone: billDetail.getCustomerPhone,
                  customerLocation: billDetail.getCustomerAddress,
                  customerDOB: billDetail.getCustomerDOB,
                  customerIdCart: '',
                ),
                EmployeeDetailWidget(
                    employeeSubDetail: billDetail.getSubEmployeeInfo),
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
        final BillModel? billDetail = _getBillDetailFromState(state);

        if (billDetail == null) {
          return BoxSpacer.blank;
        }

        final List<Widget> operations = _buildOperations(billDetail);

        if (operations.isEmpty) {
          return BoxSpacer.blank;
        }

        return _buildMoreActionsButton(operations, billDetail);
      },
    );
  }

  /// Lấy BillModel từ state một cách an toàn
  BillModel? _getBillDetailFromState(BillState state) {
    if (state is GetBillDetailSuccess) {
      return state.billDetail;
    }
    return null;
  }

  /// Xây dựng danh sách các operations có thể thực hiện
  List<Widget> _buildOperations(BillModel billDetail,
      {Future<void> Function()? closeOverlay}) {
    final List<Widget> operations = [];

    if (billDetail.checkCanEditBill) {
      operations
          .add(_buildUpdateBillButton(billDetail, closeOverlay: closeOverlay));
    }

    // Có thể thêm các operations khác ở đây trong tương lai
    // if (billDetail.checkCanDeleteBill) {
    //   operations.add(_buildDeleteBillButton(billDetail));
    // }

    return operations;
  }

  /// Tạo button cập nhật đơn
  Widget _buildUpdateBillButton(BillModel billDetail,
      {Future<void> Function()? closeOverlay}) {
    return XBaseButton(
      onPressed: () =>
          _handleUpdateBill(billDetail, closeOverlay: closeOverlay),
      child: Text(
        'Cập nhật đơn',
        style: AppFont.t.s(11),
      ),
    );
  }

  /// Xử lý logic cập nhật đơn
  void _handleUpdateBill(BillModel billDetail,
      {Future<void> Function()? closeOverlay}) {
    _convertToCartTable(
      typeCart: CartType.updateBill,
      billDetail: billDetail,
      closeOverlay: closeOverlay ?? () async {},
    );
  }

  /// Tạo button more actions với dropdown menu
  Widget _buildMoreActionsButton(
      List<Widget> operations, BillModel billDetail) {
    return XBaseButton(
      baseButtonType: BaseButtonType.tapOperation,
      secondaryWidgetBuilder: (closeOverlay) {
        // Tạo lại operations với closeOverlay function
        final operationsWithCloseOverlay =
            _buildOperations(billDetail, closeOverlay: closeOverlay);
        return _renderSecondaryWidget(operationsWithCloseOverlay, closeOverlay);
      },
      child: Icon(
        Icons.more_vert,
        size: 24.sp,
        color: AppColors.iconColor,
      ),
    );
  }

  Widget _renderSecondaryWidget(
      List<Widget> operations, Future<void> Function() closeOverlay) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: operations
          .map((operation) => XBaseButton(
                padding:
                    EdgeInsets.symmetric(vertical: 4.sp, horizontal: 16.sp),
                onPressed: () async {
                  await closeOverlay();
                },
                child: operation,
              ))
          .toList(),
    );
  }

  ///
  /// METHOD
  ///
  _convertToCartTable(
      {required CartType typeCart,
      required BillModel billDetail,
      required Future<void> Function() closeOverlay}) async {
    XToast.loading();
    try {
      final cart = await _cartStorage.convertBillDetailToCartStorage(
        billDetail: billDetail,
        typeCart: typeCart,
      );
      if (cart != null) {
        MainRouter.instance.pushNamed(
          context,
          routeName: RouteName.drafts,
          queryParameters: {'currentDraftId': cart.id.toString()},
        );
      }
    } catch (e) {
      XToast.showNegativeMessage(message: e.toString());
    } finally {
      closeOverlay();
      XToast.closeAllLoading();
    }
  }
}
