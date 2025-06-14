import 'package:c_pos/common/configs/box.dart';
import 'package:c_pos/common/constants/app_constants.dart';
import 'package:c_pos/common/enum/enum.dart';
import 'package:c_pos/common/extensions/extension.dart';
import 'package:c_pos/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../../../common/constants/go_router.dart';
import '../../../../../common/di/injection/injection.dart';
import '../../../../../data/datasources/local_db/local_db.dart';
import '../../../../../data/models/employee_model.dart';
import '../../../../../data/models/otp_customer_point_model.dart';
import '../../../../../data/models/product_model.dart';
import '../../../../../gen/gen.dart';
import '../../../../mixins/mixins.dart';
import '../../../../theme/themes.dart';
import '../../../router.dart';
import '../../customer/bloc/customer_bloc.dart';
import '../../employee/bloc/employee_bloc.dart';
import '../../payment/bloc/payment_bloc.dart';
import '../bloc/drafting_invoice_bloc.dart';
import 'widgets/payment_method_item_widget.dart';
import 'widgets/suggest_notes_dialog.dart';

part 'widgets/bottom_price_widget.dart';
part 'widgets/customer_basic_infofmation_widget.dart';
part 'widgets/employee_of_bill_widget.dart';
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

class DraftingDetailScreen extends StatefulWidget {
  const DraftingDetailScreen({super.key, required this.id});

  final String id;

  @override
  State<DraftingDetailScreen> createState() => _DraftingDetailScreenState();
}

class _DraftingDetailScreenState extends XStateWidget<DraftingDetailScreen> {
  final DraftingInvoiceBloc _draftingInvoiceBloc =
      getIt.get<DraftingInvoiceBloc>();
  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  @override
  void initState() {
    super.initState();
    _draftingInvoiceBloc
        .add(GetDraftingInvoiceDetailEvent(id: widget.id.toInt()));
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
            current is GetDraftingInvoiceDetailSuccess ||
            current is GetDraftingInvoiceDetailLoading ||
            current is GetDraftingInvoiceDetailError,
        builder: (context, state) {
          if (state is GetDraftingInvoiceDetailLoading) {
            return XPlaceHolder(width: 60.sp, height: 40.sp);
          }
          if (state is GetDraftingInvoiceDetailError) {
            return Text(
              'Thông tin đơn hàng',
              style: AppFont.t.s(16).w600,
            );
          }
          if (state is GetDraftingInvoiceDetailSuccess) {
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
    return BlocBuilder<DraftingInvoiceBloc, DraftingInvoiceState>(
      bloc: _draftingInvoiceBloc,
      buildWhen: (previous, current) =>
          current is GetDraftingInvoiceDetailSuccess ||
          current is GetDraftingInvoiceDetailLoading ||
          current is GetDraftingInvoiceDetailError,
      builder: (context, state) {
        if (state is GetDraftingInvoiceDetailLoading) {
          return const XLoading();
        }
        if (state is GetDraftingInvoiceDetailError) {
          return const EmptyDataWidget(
            emptyMessage: 'Lỗi khi lấy thông tin đơn nháp',
          );
        }
        if (state is GetDraftingInvoiceDetailSuccess) {
          return SmartRefresher(
            controller: _refreshController,
            enablePullDown: true,
            header: const RefreshWidget(),
            onRefresh: () async {
              _draftingInvoiceBloc
                  .add(GetDraftingInvoiceDetailEvent(id: widget.id.toInt()));
              _refreshController.refreshCompleted();
            },
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 16.sp, vertical: 16.sp),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _orderInfo(),

                  // hiện ở tất cả CartType
                  const CustomerBillInformationWidget(),

                  // CartType là tradeIn
                  const TypeTradeInWidget(),

                  // CartType là updateOrder, order, updateBill, retail
                  const EmployeeOfBillWidget(),
                  const ProductsBasicInformationWidget(),
                  const BillNoteWidget(),
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
        }
        return BoxSpacer.blank;
      },
    );
  }

  Widget summaryAmountWidget() {
    return BlocBuilder<DraftingInvoiceBloc, DraftingInvoiceState>(
      bloc: _draftingInvoiceBloc,
      buildWhen: (previous, current) => current is UpdateCalculatorPriceSuccess,
      builder: (context, state) {
        if (state.cartType == CartType.tradeIn) {
          return SummaryAmountWidget(
            summaryType: SummaryType.tradeIn,
            productBuyingPrice: state.productBuyingPrice,
            totalCriteriaPrice: state.totalCriteriaPrice,
            finalBuyingPrice: state.finalBuyingPrice,
          );
        }
        return BoxSpacer.blank;
      },
    );
  }

  Widget _orderInfo() {
    return BlocBuilder<DraftingInvoiceBloc, DraftingInvoiceState>(
      bloc: _draftingInvoiceBloc,
      buildWhen: (previous, current) =>
          current is GetDraftingInvoiceDetailSuccess,
      builder: (context, state) {
        if (state is GetDraftingInvoiceDetailSuccess && state.orderId != null) {
          return InfoIdUpdateWidget(orderId: state.orderId!);
        }
        return BoxSpacer.blank;
      },
    );
  }
}
