import 'package:c_pos/common/extensions/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/configs/box.dart';
import '../../../common/enum/enum.dart';
import '../../theme/themes.dart';
import '../widgets.dart';

class DiscountByHandDialog extends StatefulWidget {
  const DiscountByHandDialog({
    super.key,
    this.initValue = 0,
    this.maxAmountDiscount = 0,
    this.type = XDiscountType.amount,
    required this.onResult,
  });

  final double initValue;
  final XDiscountType type;
  final double maxAmountDiscount;
  final Function(double amount, XDiscountType type) onResult;

  @override
  State<DiscountByHandDialog> createState() => _DiscountByHandDialogState();
}

class _DiscountByHandDialogState extends State<DiscountByHandDialog> {
  final TextEditingController _amountController = TextEditingController();
  late final ValueNotifier<XDiscountType> discountTypeController;
  final ValueNotifier<bool> enableButtonSubmit = ValueNotifier(false);

  @override
  void initState() {
    super.initState();
    discountTypeController = ValueNotifier(widget.type);
    _amountController.text = widget.initValue.formatNumber;
  }

  @override
  void dispose() {
    _amountController.dispose();
    discountTypeController.dispose();
    enableButtonSubmit.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const HeaderDialog(title: 'Chiết khấu tay'),
        BoxSpacer.s16,
        _inputAmount(),
        BoxSpacer.s32,
        _submitButton(),
      ],
    );
  }

  ///
  /// WIDGET
  ///

  Widget _inputAmount() {
    return XTextField(
      controller: _amountController,
      isRequired: false,
      hintText: 'Nhập số tiền chiết khấu',
      inputFormatters: [NumberFormatter()],
      textInputType: TextInputType.number,
      suffixWidget: CustomizePopUpWidget(
        content: _discountType(),
        child: _contentType(),
      ),
      validator: (value) {
        double numAmount = value?.convertToNum ?? 0;
        final type = discountTypeController.value;
        if (type == XDiscountType.amount) {
          if (numAmount > widget.maxAmountDiscount) {
            return 'Không thể vượt quá ${widget.maxAmountDiscount.formatCurrency}';
          }
        }
        if (type == XDiscountType.percent) {
          if (numAmount > 100) {
            return 'Không thể vượt quá 100%';
          }
        }
        return null;
      },
      onChanged: (value) {
        validateAmount(value.toDouble());
      },
    );
  }

  Widget _discountType() {
    return ValueListenableBuilder(
      valueListenable: discountTypeController,
      builder: (context, value, child) {
        return SizedBox(
          width: 100.sp,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              XBaseButton(
                onPressed: () {
                  onSelectType(XDiscountType.amount);
                },
                child: Text(
                  XDiscountType.amount.title,
                  style: AppFont.t.s(),
                ),
              ),
              BoxSpacer.s12,
              XBaseButton(
                onPressed: () {
                  onSelectType(XDiscountType.percent);
                },
                child: Text(
                  XDiscountType.percent.title,
                  style: AppFont.t.s(),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _contentType() {
    return ValueListenableBuilder(
      valueListenable: discountTypeController,
      builder: (context, value, child) {
        return Container(
          padding: EdgeInsets.symmetric(vertical: 6.sp, horizontal: 10.sp),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(AppRadius.xxm),
            color: AppColors.primaryColor,
          ),
          child: Text(
            value.unit,
            style: AppFont.t.s().white,
          ),
        );
      },
    );
  }

  Widget _submitButton() {
    return ValueListenableBuilder(
      valueListenable: enableButtonSubmit,
      builder: (context, value, _) {
        return XButton(
          disable: !value,
          padding: EdgeInsets.symmetric(vertical: 12.sp, horizontal: 16.sp),
          onPressed: () {
            widget.onResult(
              _amountController.text.trim().convertToNum,
              discountTypeController.value,
            );
            Navigator.pop(context);
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Xong',
                style: AppFont.t.s().white,
              ),
            ],
          ),
        );
      },
    );
  }

  ///
  /// METHOD
  ///

  void onSelectType(XDiscountType type) {
    discountTypeController.value = type;
    _amountController.text = '0';
    Navigator.pop(context);
  }

  void validateAmount(double amount) {
    if (amount > 0 && amount <= widget.maxAmountDiscount) {
      enableButtonSubmit.value = true;
    } else {
      enableButtonSubmit.value = true;
    }
  }
}
