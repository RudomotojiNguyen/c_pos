part of 'discount_dialog.dart';

class DiscountByAmount extends StatefulWidget {
  const DiscountByAmount({
    super.key,
    this.discountAmount,
    required this.callBack,
    required this.products,
    this.customerId,
  });

  final double? discountAmount;
  final int? customerId;
  final List<ProductTable> products;
  final Function(
    String? couponCode,
    double? discountAmount,
  ) callBack;

  @override
  State<DiscountByAmount> createState() => _DiscountByAmountState();
}

class _DiscountByAmountState extends State<DiscountByAmount>
    with AutomaticKeepAliveClientMixin {
  final TextEditingController _discountController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.discountAmount != null) {
      _discountController.text = widget.discountAmount!.formatNumber;
    }
  }

  @override
  void dispose() {
    _discountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Column(
      children: [
        _amount(),
        BoxSpacer.s32,
        _submitButton(),
      ],
    );
  }

  @override
  bool get wantKeepAlive => true;

  ///
  /// WIDGET
  ///
  Widget _amount() {
    return XTextField(
      controller: _discountController,
      isRequired: false,
      labelText: 'Chiết khấu tổng hóa đơn',
      hintText: 'Nhập số tiền chiết khấu',
      inputFormatters: [NumberFormatter()],
      textInputType: TextInputType.number,
    );
  }

  Widget _submitButton() {
    return XButton(
      padding: EdgeInsets.symmetric(vertical: 12.sp, horizontal: 16.sp),
      onPressed: _onSubmit,
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

  ///
  /// MEHOTD
  ///
  _onSubmit() {
    widget.callBack(null, _discountController.text.trim().convertToNum);
    Navigator.pop(context);
  }
}
