import 'package:c_pos/common/di/injection/injection.dart';
import 'package:c_pos/common/enum/enum.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../../../common/configs/box.dart';
import '../../../../../common/extensions/extension.dart';
import '../../../../../data/models/order_model.dart';
import '../../../../theme/themes.dart';
import '../../../../widgets/widgets.dart';
import '../bloc/order_bloc.dart';

class OrderDetailScreen extends StatefulWidget {
  const OrderDetailScreen({super.key, required this.orderId});

  final String orderId;

  @override
  State<OrderDetailScreen> createState() => _OrderDetailScreenState();
}

class _OrderDetailScreenState extends XStateWidget<OrderDetailScreen> {
  final OrderBloc _orderBloc = getIt.get<OrderBloc>();
  // final CartStorage _cartStorage = getIt.get<CartStorage>();
  // final CustomerRepository _customerRepository =
  //     getIt.get<CustomerRepository>();

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
                  employeeName: orderDetail.getSaleName,
                  point: orderDetail.subtractPoint,
                ),
                CustomerInfoWidget(
                  customerName: orderDetail.getCustomerName,
                  customerPhone: orderDetail.getCustomerPhone,
                  customerIdCart: orderDetail.getIdCard,
                  customerLocation: orderDetail.getCustomerAddress,
                  customerDOB: orderDetail.getCustomerBirthDate,
                ),
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
                      padding: EdgeInsets.symmetric(
                          vertical: 10.sp, horizontal: 16.sp),
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
                      padding: EdgeInsets.symmetric(
                          vertical: 10.sp, horizontal: 16.sp),
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
    // final customer = await _customerRepository.getCustomerInfoById(
    //     customerId: orderDetail.customerId!);
    // final cart = await _cartStorage.convertOrderDetailToCartStorage(
    //   orderDetail: orderDetail,
    //   typeCart: typeCart,
    //   customer: customer,
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
