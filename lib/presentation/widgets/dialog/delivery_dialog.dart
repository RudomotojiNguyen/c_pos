import 'package:c_pos/common/extensions/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/configs/box.dart';
import '../../theme/themes.dart';
import '../widgets.dart';

class DeliveryDialog extends StatefulWidget {
  const DeliveryDialog(
      {super.key,
      required this.onResult,
      required this.shippingCompanyFee,
      required this.customerFee});

  final Function(int customerFee, int shippingCompanyFee) onResult;
  final int shippingCompanyFee;
  final int customerFee;

  @override
  State<DeliveryDialog> createState() => _DeliveryDialogState();
}

class _DeliveryDialogState extends State<DeliveryDialog> {
  final TextEditingController _customerFeeController = TextEditingController();
  final TextEditingController _shippingCompanyFeeController =
      TextEditingController();

  @override
  void initState() {
    super.initState();
    _customerFeeController.text = widget.customerFee.formatNumber;
    _shippingCompanyFeeController.text = widget.shippingCompanyFee.formatNumber;
  }

  @override
  void dispose() {
    _customerFeeController.dispose();
    _shippingCompanyFeeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.zero
          .copyWith(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const HeaderDialog(title: 'Thông tin phí vận chuyển'),
          BoxSpacer.s16,
          _customerFeeInput(),
          BoxSpacer.s16,
          _shippingCompanyFeeInput(),
          BoxSpacer.s32,
          _submitButton(),
        ],
      ),
    );
  }

  Widget _customerFeeInput() {
    return XTextField(
      controller: _customerFeeController,
      isRequired: false,
      labelText: 'Phí giao hàng (khách trả)',
      hintText: 'Nhập số tiền phí khách cần trả',
      inputFormatters: [NumberFormatter()],
      textInputType: TextInputType.number,
    );
  }

  Widget _shippingCompanyFeeInput() {
    return XTextField(
      controller: _shippingCompanyFeeController,
      isRequired: false,
      labelText: 'Phí trả hãng vận chuyển',
      hintText: 'Nhập số tiền phí khách cần trả',
      inputFormatters: [NumberFormatter()],
      textInputType: TextInputType.number,
    );
  }

  Widget _submitButton() {
    return XButton(
      padding: EdgeInsets.symmetric(vertical: 12.sp, horizontal: 16.sp),
      onPressed: () {
        widget.onResult(
          _customerFeeController.text.trim().convertToNum.toInt(),
          _shippingCompanyFeeController.text.trim().convertToNum.toInt(),
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
