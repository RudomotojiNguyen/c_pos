part of '../drafting_detail_screen.dart';

class TypeTradeInWidget extends StatefulWidget {
  const TypeTradeInWidget({super.key});

  @override
  State<TypeTradeInWidget> createState() => _TypeTradeInWidgetState();
}

class _TypeTradeInWidgetState extends State<TypeTradeInWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  final DraftingInvoiceBloc _draftingInvoiceBloc =
      getIt.get<DraftingInvoiceBloc>();
  final List<TradeInType> types = [
    TradeInType.tradeIn,
    TradeInType.buyingOldItems,
    TradeInType.exchangeWarranty,
    TradeInType.testDevice,
  ];
  final SingleSelectController<TradeInType?> selectedItemNotifier =
      SingleSelectController(null);

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
    selectedItemNotifier.value = types.first;
  }

  @override
  void dispose() {
    _controller.dispose();
    selectedItemNotifier.dispose();
    super.dispose();
  }

  /// chỉ hiển thị cho loại phiếu là định giá
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DraftingInvoiceBloc, DraftingInvoiceState>(
      bloc: _draftingInvoiceBloc,
      buildWhen: (previous, current) =>
          current is GetCurrentDraftDataSuccess ||
          current is UpdateTradeInTypeSuccess,
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
            title: 'Loại giao dịch',
            child: _typeTradeInWidget(context),
          );
        }

        return BoxSpacer.blank;
      },
    );
  }

  Widget _typeTradeInWidget(BuildContext context) {
    return XBasicDropDown<TradeInType>(
      hintText: 'Loại giao dịch',
      expandedHeaderPadding: EdgeInsets.zero,
      items: types,
      selectedItemNotifier: selectedItemNotifier,
      listItemBuilder: (BuildContext context, TradeInType result,
          bool isSelected, VoidCallback onItemSelect) {
        return Text(
          result.getTitle,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: AppFont.t.s(12).neutral2,
        );
      },
      headerBuilder:
          (BuildContext context, TradeInType result, bool isSelected) {
        return Text(
          result.getTitle,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: AppFont.t.s(12).neutral2,
        );
      },
      onChanged: (value) {
        if (value != null) {
          _draftingInvoiceBloc.add(UpdateTradeInTypeEvent(value));
        }
      },
      validator: (value) {
        return null;
      },
    );
  }
}
