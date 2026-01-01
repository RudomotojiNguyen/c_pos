part of '../drafting_detail_screen.dart';

class DeviceStatusWidget extends StatefulWidget {
  const DeviceStatusWidget({super.key, required this.tradeInBloc});

  final TradeInBloc tradeInBloc;

  @override
  State<DeviceStatusWidget> createState() => _DeviceStatusWidgetState();
}

/// todo: check lại cho phần trade in
class _DeviceStatusWidgetState extends State<DeviceStatusWidget> {
  final DraftingInvoiceBloc _draftingInvoiceBloc =
      getIt.get<DraftingInvoiceBloc>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DraftingInvoiceBloc, DraftingInvoiceState>(
      bloc: _draftingInvoiceBloc,
      buildWhen: (previous, current) =>
          current is GetCurrentDraftDataSuccess ||
          current is UpdateProductTradeInSuccess,
      listener: (context, state) {
        if ((state is GetCurrentDraftDataSuccess ||
                state is UpdateProductTradeInSuccess) &&
            (state.product != null && state.cartType == CartType.tradeIn)) {
          widget.tradeInBloc
              .add(GetTradeInCritrtionEvent(state.product!.productId!));
        }
      },
      builder: (context, state) {
        if (!state.checkNullDraft &&
            {CartType.tradeIn}.contains(state.cartType)) {
          return XContainer(
            margin: EdgeInsets.only(top: 16.sp),
            iconTitle: Icon(
              Icons.checklist,
              size: 18.sp,
              color: AppColors.neutral3Color,
            ),
            title: 'Tình trạng máy',
            child: _programingDetail(state.product),
          );
        }

        return BoxSpacer.blank;
      },
    );
  }

  ///
  /// WIDGET
  ///
  Widget _programingDetail(ProductTable? product) {
    return BlocConsumer<TradeInBloc, TradeInState>(
      bloc: widget.tradeInBloc,
      listener: (context, state) {
        if (state is GetProgramCriteriaSuccess &&
            state.tradeInProgramCriteriaGroup.isNotEmpty) {
          _draftingInvoiceBloc.add(UpdateTradeInProgramEvent(
              tradeInProgramId:
                  state.tradeInProgramCriteriaGroup.first.tradeInProgramId!));
        }
      },
      builder: (context, state) {
        if (product == null) {
          return Text(
            'Thêm sản phẩm để lấy thông tin',
            style: AppFont.t.s().disabled,
          );
        }
        if (state is IsCriteriaLoading) {
          return const ListCriteriaLoading();
        }
        List<TradeInProgramCriteriaGroupModel> tradeInProgramCriteriaGroup =
            state.tradeInProgramCriteriaGroup;
        if (tradeInProgramCriteriaGroup.isEmpty) {
          return const EmptyDataWidget(
              emptyMessage: 'Chưa có chương trình cho sản phẩm này');
        }
        return ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: EdgeInsets.zero,
          itemBuilder: (context, index) {
            return TradeInProgramCriteriaGroup(
              tradeInProgramCriteria: tradeInProgramCriteriaGroup[index],
            );
          },
          itemCount: tradeInProgramCriteriaGroup.length,
          separatorBuilder: (context, index) => BoxSpacer.s16,
        );
      },
    );
  }
}
