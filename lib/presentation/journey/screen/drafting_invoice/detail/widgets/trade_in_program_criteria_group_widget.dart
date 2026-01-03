part of '../drafting_detail_screen.dart';

class TradeInProgramCriteriaGroup extends StatelessWidget {
  const TradeInProgramCriteriaGroup({
    super.key,
    required this.tradeInProgramCriteria,
  });

  final TradeInProgramCriteriaGroupModel tradeInProgramCriteria;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          tradeInProgramCriteria.getGroupName,
          style: AppFont.t.s(),
        ),
        BoxSpacer.s8,
        TradeInProgramCreteriaGroupOpition(
          tradeInProgramCreteriaGroupOption:
              tradeInProgramCriteria.getTradeInProgramCreteriaGroupOptions,
          typeSelect: tradeInProgramCriteria.getTypeSelect,
        ),
      ],
    );
  }
}

class TradeInProgramCreteriaGroupOpition extends StatefulWidget {
  const TradeInProgramCreteriaGroupOpition({
    super.key,
    required this.tradeInProgramCreteriaGroupOption,
    required this.typeSelect,
  });

  final List<TradeInProgramCreteriaGroupOptionModel>
      tradeInProgramCreteriaGroupOption;
  final TypeSelect typeSelect;

  @override
  State<TradeInProgramCreteriaGroupOpition> createState() =>
      _TradeInProgramCreteriaGroupOpitionState();
}

class _TradeInProgramCreteriaGroupOpitionState
    extends State<TradeInProgramCreteriaGroupOpition> {
  Map<int, TradeInProgramCreteriaGroupOptionModel> programSelected = {};

  final DraftingInvoiceBloc _draftingInvoiceBloc =
      getIt.get<DraftingInvoiceBloc>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.sp),
      decoration: BoxDecoration(
        color: AppColors.white,
        border: Border.all(width: 1.sp, color: AppColors.dividerColor),
        borderRadius: BorderRadius.all(AppRadius.l),
      ),
      child: ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.zero,
        itemBuilder: (context, index) {
          final TradeInProgramCreteriaGroupOptionModel option =
              widget.tradeInProgramCreteriaGroupOption[index];
          bool isSelected = programSelected.containsKey(option.id);
          return XBaseButton(
            onPressed: () => _onSelectItem(option),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        option.getCreteriaName,
                        style: AppFont.t.s(),
                      ),
                      Text.rich(
                        TextSpan(
                          text: option.getOperator.getExpressionStr,
                          style: AppFont.t.s(),
                          children: [
                            const TextSpan(text: ' '),
                            TextSpan(text: option.getAmount.formatCurrency),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                BoxSpacer.s8,
                _iconSelect(isSelected),
              ],
            ),
          );
        },
        separatorBuilder: (context, index) => const XDivider(),
        itemCount: widget.tradeInProgramCreteriaGroupOption.length,
      ),
    );
  }

  Widget _iconSelect(bool isSelected) {
    if (widget.typeSelect == TypeSelect.multiple) {
      if (isSelected) {
        return Icon(
          Icons.check_box,
          size: 18.sp,
          color: AppColors.primaryColor,
        );
      } else {
        return Icon(
          Icons.square_outlined,
          size: 18.sp,
          color: AppColors.iconColor,
        );
      }
    }
    if (widget.typeSelect == TypeSelect.single) {
      if (isSelected) {
        return Icon(
          Icons.check_circle,
          size: 18.sp,
          color: AppColors.primaryColor,
        );
      } else {
        return Icon(
          Icons.circle_outlined,
          size: 18.sp,
          color: AppColors.iconColor,
        );
      }
    }
    return BoxSpacer.blank;
  }

  ///
  /// METHOD
  ///
  _onSelectItem(TradeInProgramCreteriaGroupOptionModel option) {
    final programingSelected =
        _draftingInvoiceBloc.selectTradeInProgramCreteriaGroupOption(
      oldProgram: programSelected,
      option: option,
      typeSelect: widget.typeSelect,
    );

    setState(() {
      programSelected = programingSelected;
    });
    _draftingInvoiceBloc.add(
      OnSelectProgramEvent(
        tradeInProgramCreteriaGroupOption: option,
        typeSelect: widget.typeSelect,
      ),
    );
  }
}
