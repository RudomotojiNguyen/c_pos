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
    TradeInType.exchangeWarranty
  ];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  /// chỉ hiển thị cho loại phiếu là định giá
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DraftingInvoiceBloc, DraftingInvoiceState>(
      bloc: _draftingInvoiceBloc,
      buildWhen: (previous, current) =>
          current is GetDraftingInvoiceDetailSuccess ||
          current is UpdateTradeInTypeSuccess,
      builder: (context, state) {
        if (!state.checkNullDraft &&
            [CartType.tradeIn].contains(state.cartType)) {
          return XContainer(
            margin: EdgeInsets.only(top: 16.sp),
            iconTitle: Assets.svg.checklist.svg(
              width: 22.sp,
              height: 22.sp,
            ),
            title: 'Loại giao dịch',
            child: ListView.separated(
              padding: EdgeInsets.zero,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                final TradeInType type = types[index];
                bool isSelected = type == state.tradeInType;
                return XBaseButton(
                  onPressed: () {
                    if (!isSelected) {
                      _draftingInvoiceBloc.add(UpdateTradeInTypeEvent(type));
                    }
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(
                        vertical: 16.sp, horizontal: 16.sp),
                    decoration: BoxDecoration(
                      color: isSelected
                          ? AppColors.pinkLightColor
                          : AppColors.white,
                      borderRadius: BorderRadius.circular(8.sp),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            type.getTitle,
                            style: AppFont.t.s().neutral,
                          ),
                        ),
                        if (isSelected) ...[
                          BoxSpacer.s16,
                          Icon(
                            Icons.check,
                            size: 18.sp,
                            color: AppColors.neutralColor,
                          ),
                        ],
                      ],
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) => BoxSpacer.s16,
              itemCount: types.length,
            ),
          );
        }

        return BoxSpacer.blank;
      },
    );
  }
}
