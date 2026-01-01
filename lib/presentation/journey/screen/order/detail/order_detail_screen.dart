import 'package:c_pos/common/di/injection/injection.dart';
import 'package:c_pos/common/enum/enum.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'package:c_pos/data/models/models.dart';
import '../../../../../common/configs/box.dart';
import '../../../../../common/constants/go_router.dart';
import '../../../../../common/extensions/extension.dart';
import '../../../../../data/datasources/local_data/local_data.dart';
import '../../../../../data/services/services.dart';
import '../../../../theme/app_radius.dart';
import '../../../../theme/colors.dart';
import '../../../../widgets/detail/employee_detail_widget.dart';
import '../../../../widgets/widgets.dart';
import '../../../router.dart';
import '../bloc/order_bloc.dart';

class OrderDetailScreen extends StatefulWidget {
  const OrderDetailScreen({super.key, required this.orderId});

  final String orderId;

  @override
  State<OrderDetailScreen> createState() => _OrderDetailScreenState();
}

class _OrderDetailScreenState extends XStateWidget<OrderDetailScreen> {
  final OrderBloc _orderBloc = getIt.get<OrderBloc>();
  final DraftingStorage _cartStorage = getIt.get<DraftingStorage>();
  final CustomerServices _customerServices = getIt.get<CustomerServices>();

  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  @override
  void initState() {
    super.initState();
    _orderBloc.add(GetOrderDetailEvent(widget.orderId));
  }

  @override
  void dispose() {
    _refreshController.dispose();
    super.dispose();
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
    return BlocBuilder<OrderBloc, OrderState>(
      bloc: _orderBloc,
      builder: (context, state) {
        if (state is UpdateLoading) {
          return const LoadingDetailWidget();
        }

        if (state is GetDataError) {
          return _emptyData();
        }

        final OrderModel? orderDetail =
            state is GetOrderDetailSuccess ? state.orderDetail : null;

        if (orderDetail == null) {
          return _emptyData();
        }

        return SmartRefresher(
          controller: _refreshController,
          enablePullDown: true,
          header: const RefreshWidget(),
          onRefresh: () async {
            _orderBloc.add(GetOrderDetailEvent(widget.orderId));
            _refreshController.refreshCompleted();
          },
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 20.sp, vertical: 20.sp),
            child: Column(
              children: [
                NormalDetailWidget(
                  createDate: orderDetail.getCreateDate,
                  storeName: orderDetail.getStoreName,
                  id: orderDetail.getBillNumber,
                  statusName: orderDetail.getOrderStatus.getTitle,
                  statusColor: orderDetail.getOrderStatus.getColorStatus,
                  // employeeName: orderDetail.getSaleName,
                  point: orderDetail.subtractPoint,
                  orderSource: orderDetail.getOrderSource,
                  orderType: orderDetail.getOrderType,
                  checkDate: orderDetail.getCheckDate,
                  checkTime: orderDetail.getCheckTime,
                ),
                CustomerInfoWidget(
                  customerName: orderDetail.getCustomerName,
                  customerPhone: orderDetail.getCustomerPhone,
                  customerIdCart: orderDetail.getIdCard,
                  customerLocation: orderDetail.getCustomerAddress,
                  customerDOB: orderDetail.getCustomerBirthDate,
                ),
                EmployeeDetailWidget(
                    employeeSubDetail: orderDetail.getSubEmployeeInfo),
                ProductDetailWidget(products: orderDetail.products),
                SummaryAmountWidget(
                  paymentByCash: orderDetail.paymentByCash,
                  paymentByCredit: orderDetail.paymentByCredit,
                  paymentByTransfer: orderDetail.paymentByTransfer,
                  paymentByInstallment: orderDetail.paymentByInstallment,
                ),
                NoteDetailWidget(
                  saleNote: orderDetail.getSaleNote,
                  customerNote: orderDetail.getCustomerNote,
                  warrantyNote: orderDetail.getWarrantyNote,
                )
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _emptyData() {
    return const Column(
      children: [
        EmptyDataWidget(
          emptyMessage: 'Không tìm thấy thông tin sản phẩm',
        ),
      ],
    );
  }

  Widget _rightActions() {
    return BlocBuilder<OrderBloc, OrderState>(
      bloc: _orderBloc,
      builder: (context, state) {
        final OrderModel? orderDetail =
            state is GetOrderDetailSuccess ? state.orderDetail : null;

        if (orderDetail != null) {
          if (orderDetail.getOrderStatus != StatusEnum.success) {
            return XBaseButton(
              baseButtonType: BaseButtonType.tapOperation,
              secondaryWidgetBuilder: (closeOverlay) => Container(
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.all(AppRadius.l),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    XBaseButton(
                      onPressed: () async {
                        await closeOverlay();
                        _convertToCartTable(
                          typeCart: CartType.updateOrder,
                          orderDetail: orderDetail,
                        );
                      },
                      child: Text(
                        'Cập nhật đơn',
                        style: AppFont.t.s(11),
                      ),
                    ),
                    XBaseButton(
                      onPressed: () async {
                        await closeOverlay();
                        _convertToCartTable(
                          typeCart: CartType.retail,
                          orderDetail: orderDetail,
                        );
                      },
                      child: Text(
                        'Tạo hóa đơn',
                        style: AppFont.t.s(11),
                      ),
                    ),
                  ],
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
      {required CartType typeCart, required OrderModel orderDetail}) async {
    final customer = await _customerServices.getCustomerInfoById(
        customerId: orderDetail.customerId!);
    final cart = await _cartStorage.convertOrderDetailToCartStorage(
      orderDetail: orderDetail,
      typeCart: typeCart,
      customer: customer,
    );
    if (cart != null) {
      MainRouter.instance.pushNamed(
        context,
        routeName: RouteName.drafts,
        queryParameters: {'currentDraftId': cart.id.toString()},
      );
    }
  }
}
