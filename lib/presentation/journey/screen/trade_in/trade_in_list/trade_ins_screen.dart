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
import '../bloc/trade_in_bloc.dart';
import 'widgets/search_trade_in_widget.dart';
import 'widgets/trade_in_list_widget.dart';

class TradeInsScreen extends StatefulWidget {
  const TradeInsScreen({super.key});

  @override
  State<TradeInsScreen> createState() => _TradeInsScreenState();
}

class _TradeInsScreenState extends XStateWidget<TradeInsScreen> {
  final TradeInBloc _tradeInBloc = getIt.get<TradeInBloc>();
  final DraftingInvoiceBloc _draftingInvoiceBloc =
      getIt.get<DraftingInvoiceBloc>();

  @override
  void initState() {
    super.initState();
    _tradeInBloc.add(GetTradeInDataEvent());
  }

  @override
  PreferredSizeWidget? buildAppBar(BuildContext context) {
    return const XAppBar(title: 'Danh sách định giá');
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
          _listData(),
          Positioned(
            bottom: 28.sp,
            left: 0,
            right: 0,
            child: Row(
              children: [
                Expanded(child: SearchTradeInWidget(tradeInBloc: _tradeInBloc)),
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

  // Widget _filterWidget() {
  //   return SearchTradeInWidget(tradeInBloc: _tradeInBloc);
  // }

  Widget _listData() {
    return TradeInListWidget(tradeInBloc: _tradeInBloc);
  }

  _onAddOrder() {
    _draftingInvoiceBloc
        .add(CreateNewDraftingInvoiceEvent(typeCart: CartType.tradeIn));
  }
}
