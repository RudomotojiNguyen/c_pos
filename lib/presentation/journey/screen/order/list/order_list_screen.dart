import 'package:c_pos/common/extensions/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../common/configs/box.dart';
import '../../../../../common/constants/go_router.dart';
import '../../../../../common/di/injection/injection.dart';
import '../../../../../common/enum/enum.dart';
import '../../../../theme/app_radius.dart';
import '../../../../theme/colors.dart';
import '../../../../widgets/widgets.dart';
import '../../../router.dart';
import '../../drafting_invoice/detail/bloc/drafting_invoice_bloc.dart';
import '../bloc/order_bloc.dart';
import 'widgets/order_list_widget.dart';
import 'widgets/search_order_widget.dart';

class OrderListScreen extends StatefulWidget {
  const OrderListScreen({super.key});

  @override
  State<OrderListScreen> createState() => _OrderListScreenState();
}

class _OrderListScreenState extends XStateWidget<OrderListScreen> {
  final OrderBloc _orderBloc = getIt.get<OrderBloc>();
  final DraftingInvoiceBloc _draftingInvoiceBloc =
      getIt.get<DraftingInvoiceBloc>();

  @override
  void initState() {
    super.initState();
    _orderBloc.add(GetOrderEvent());
  }

  @override
  PreferredSizeWidget? buildAppBar(BuildContext context) {
    return const XAppBar(title: 'Quản lý đơn hàng');
  }

  @override
  Widget buildContentView(BuildContext context) {
    return BlocListener<DraftingInvoiceBloc, DraftingInvoiceState>(
      bloc: _draftingInvoiceBloc,
      listener: (context, state) {
        if (state is DraftingInvoiceCreated) {
          MainRouter.instance.goNamed(
            context,
            routeName: RouteName.drafts,
            queryParameters: {'draftId': state.currentDraftId.toString()},
          );
        }
      },
      child: Stack(
        children: [
          OrderListWidget(orderBloc: _orderBloc),
          Positioned(
            bottom: 16.sp,
            left: 0,
            right: 0,
            child: Row(
              children: [
                Expanded(
                  child: SearchOrderWidget(
                    orderBloc: _orderBloc,
                  ),
                ),
                XBaseButton(
                  onPressed: _onAddOrder,
                  padding: EdgeInsets.all(12.sp),
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.all(AppRadius.xxxl),
                    boxShadow: context.boxShadow,
                  ),
                  child: Icon(
                    Icons.add,
                    size: 18.sp,
                    color: AppColors.iconColor,
                  ),
                ),
                BoxSpacer.s16,
              ],
            ),
          ),
        ],
      ),
    );
  }

  _onAddOrder() {
    _draftingInvoiceBloc
        .add(CreateNewDraftingInvoiceEvent(typeCart: CartType.order));
  }
}
