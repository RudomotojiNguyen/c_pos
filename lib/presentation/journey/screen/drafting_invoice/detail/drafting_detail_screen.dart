import 'package:c_pos/common/configs/box.dart';
import 'package:c_pos/common/constants/app_constants.dart';
import 'package:c_pos/common/enum/enum.dart';
import 'package:c_pos/common/extensions/extension.dart';
import 'package:c_pos/data/models/models.dart';
import 'package:c_pos/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../../../common/constants/go_router.dart';
import '../../../../../common/di/injection/injection.dart';
import '../../../../../data/datasources/local_db/local_db.dart';
import '../../../../../data/models/employee_sub_detail_model.dart';
import '../../../../../gen/gen.dart';
import '../../../../mixins/mixins.dart';
import '../../../../theme/themes.dart';
import '../../../../utils/utils.dart';
import '../../../router.dart';
import '../../customer/bloc/customer_bloc.dart';
import '../../global_bloc/global_core_bloc.dart';
import '../../payment/bloc/payment_bloc.dart';
import '../../store/bloc/store_bloc.dart';
import '../../trade_in/bloc/trade_in_bloc.dart';
import 'bloc/drafting_invoice_bloc.dart';
import 'widgets/payment_method_item_widget.dart';
import 'widgets/search_product_dialog.dart';
import 'widgets/vouchers_dialog.dart';

part 'widgets/bottom_price_widget.dart';
part 'widgets/customer_basic_infofmation_widget.dart';
part 'widgets/bill_note_widget.dart';
part 'widgets/promotion_widget.dart';
part 'widgets/member_discount_widget.dart';
part 'widgets/payment_information_widget.dart';
part 'widgets/payment_method_of_bill_widget.dart';
part 'widgets/type_trade_in_widget.dart';
part 'widgets/payment_method_detail_widget.dart';
part 'widgets/products_basic_information_widget.dart';
part 'widgets/product_item_widget.dart';
part 'widgets/group_product_children_widget.dart';
part 'widgets/product_trade_in_widget.dart';
part 'widgets/device_status_widget.dart';
part 'widgets/delivery_widget.dart';
part 'widgets/order_sub_detail_widget.dart';
part 'widgets/current_store.dart';
part 'widgets/trade_in_program_criteria_group_widget.dart';
part 'widgets/employee_of_bill_widget.dart';

class DraftingDetailScreen extends StatefulWidget {
  const DraftingDetailScreen({super.key, required this.id});

  final String id;

  @override
  State<DraftingDetailScreen> createState() => _DraftingDetailScreenState();
}

class _DraftingDetailScreenState extends XStateWidget<DraftingDetailScreen> {
  final DraftingInvoiceBloc _draftingInvoiceBloc =
      getIt.get<DraftingInvoiceBloc>();
  final TradeInBloc _tradeInBloc = getIt.get<TradeInBloc>();
  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  @override
  void initState() {
    super.initState();
    if (widget.id.isNotEmpty) {
      _draftingInvoiceBloc.add(GetCurrentDraftEvent(widget.id.toInt()));
    }
  }

  @override
  void dispose() {
    _refreshController.dispose();
    super.dispose();
  }

  @override
  PreferredSizeWidget? buildAppBar(BuildContext context) {
    return XAppBar(
      titleWidget: BlocBuilder<DraftingInvoiceBloc, DraftingInvoiceState>(
        bloc: _draftingInvoiceBloc,
        buildWhen: (previous, current) =>
            current is GetCurrentDraftDataSuccess ||
            current is IsGettingDetail ||
            current is GetCurrentDraftDataError,
        builder: (context, state) {
          if (state is IsGettingDetail) {
            return const XPlaceHolder(width: 60, height: 40);
          }
          if (state is GetCurrentDraftDataError) {
            return Text(
              'Thông tin',
              style: AppFont.t.s(16).w600,
            );
          }
          if (state is GetCurrentDraftDataSuccess) {
            return Text(
              state.cartType!.getScreenTitle,
              style: AppFont.t.s(16).w600,
            );
          }
          return BoxSpacer.blank;
        },
      ),
    );
  }

  @override
  Widget buildContentView(BuildContext context) {
    return BlocConsumer<DraftingInvoiceBloc, DraftingInvoiceState>(
      bloc: _draftingInvoiceBloc,
      buildWhen: (previous, current) =>
          current is GetCurrentDraftDataSuccess ||
          current is IsGettingDetail ||
          current is GetCurrentDraftDataError,
      listener: _listener,
      builder: (context, state) {
        if (state is GetCurrentDraftDataError) {
          return const EmptyDataWidget(
            emptyMessage: 'Lỗi khi lấy thông tin đơn nháp',
          );
        }
        return SmartRefresher(
          controller: _refreshController,
          enablePullDown: true,
          header: const RefreshWidget(),
          onRefresh: () async {
            _draftingInvoiceBloc.add(GetCurrentDraftEvent(widget.id.toInt()));
            _refreshController.refreshCompleted();
          },
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 16.sp, vertical: 16.sp),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                /// hiện thông tin billnumber và ordernumber
                _orderInfo(),

                /// hiện ở tất cả CartType
                const CustomerBillInformationWidget(),

                /// thông tin nhân viên
                const EmployeeOfBillWidget(),

                /// CartType là tradeIn
                /// todo: nào làm thêm phần thu cũ thì xem làm lại chỗ này
                const TypeTradeInWidget(),
                const ProductTradeInWidget(),
                DeviceStatusWidget(tradeInBloc: _tradeInBloc),

                /// cửa hàng đang chọn
                const CurrentStoreWidget(),

                /// CartType là updateOrder, order, updateBill, retail
                const ProductsBasicInformationWidget(),
                const BillNoteWidget(),
                const DeliveryWidget(),
                const OrderSubDetailWidget(),
                const PromotionWidget(),
                const MemberDiscountWidget(),
                const PaymentInformationWidget(),
                const PaymentMethodOfBillWidget(),

                summaryAmountWidget(),

                // hiện ở tất cả CartType
                const BottomPriceWidget(),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget summaryAmountWidget() {
    return BlocBuilder<DraftingInvoiceBloc, DraftingInvoiceState>(
      bloc: _draftingInvoiceBloc,
      buildWhen: (previous, current) => current is GetCurrentDraftDataSuccess,
      builder: (context, state) {
        if (state is GetCurrentDraftDataSuccess &&
            state.cartType == CartType.tradeIn) {
          return SummaryAmountWidget(
            summaryType: SummaryType.tradeIn,
            productBuyingPrice: state.productBuyingPrice,
            totalCriteriaPrice: state.totalCriteriaPrice,
            estimationBuyingPrice: state.estimationBuyingPrice,
          );
        }
        return BoxSpacer.blank;
      },
    );
  }

  Widget _orderInfo() {
    return BlocBuilder<DraftingInvoiceBloc, DraftingInvoiceState>(
      bloc: _draftingInvoiceBloc,
      buildWhen: (previous, current) => current is GetCurrentDraftDataSuccess,
      builder: (context, state) {
        if (state is GetCurrentDraftDataSuccess && state.orderId != null) {
          return InfoIdUpdateWidget(orderId: state.orderId!);
        }
        return BoxSpacer.blank;
      },
    );
  }
}

extension _DraftDetailScreenStateExtension on _DraftingDetailScreenState {
  void _listener(BuildContext context, DraftingInvoiceState state) {
    if (state is IsGettingDetail) {
      XToast.loading();
    } else {
      XToast.closeAllLoading();
    }

    //
    if (state is CreateTradeInbillSuccess) {
      MainRouter.instance.goNamed(context, routeName: RouteName.tradeIn);
    }
    if (state is GetCurrentDraftDataSuccess) {
      if (state.product != null && state.cartType == CartType.tradeIn) {
        _tradeInBloc.add(GetTradeInCritrtionEvent(state.product!.productId!));
      }
    }
    if (state is CreateBillSuccess) {
      MainRouter.instance.goNamed(
        context,
        routeName: RouteName.bills,
        queryParameters: {'billId': state.id.toString()},
      );
    }
    if (state is CreateOrderSuccess) {
      MainRouter.instance.goNamed(
        context,
        routeName: RouteName.orders,
        queryParameters: {'orderId': state.newBillNum.toString()},
      );
    }
  }
}
