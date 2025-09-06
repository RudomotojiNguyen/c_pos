import 'package:c_pos/common/extensions/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/configs/box.dart';
import '../widgets.dart';

class RepurchasePriceDialog extends StatefulWidget {
  const RepurchasePriceDialog({
    super.key,
    this.initValue = 0,
    required this.onResult,
  });

  final double initValue;
  final Function(double amount) onResult;

  @override
  State<RepurchasePriceDialog> createState() => _RepurchasePriceDialogState();
}

class _RepurchasePriceDialogState extends State<RepurchasePriceDialog> {
  final TextEditingController _amountController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _amountController.text = widget.initValue.formatNumber;
  }

  @override
  void dispose() {
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const HeaderDialog(title: 'Giá thu lại'),
        BoxSpacer.s16,
        _inputAmount(),
        BoxSpacer.s32,
        _submitButton(),
      ],
    );
  }

  Widget _inputAmount() {
    return XTextField(
      controller: _amountController,
      isRequired: false,
      hintText: 'Nhập số tiền chiết khấu',
      inputFormatters: [NumberFormatter()],
      textInputType: TextInputType.number,
    );
  }

  Widget _submitButton() {
    return XButton(
      padding: EdgeInsets.symmetric(vertical: 12.sp, horizontal: 16.sp),
      onPressed: () {
        widget.onResult(
          _amountController.text.trim().convertToNum,
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
  }
}
