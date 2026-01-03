part of 'discount_dialog.dart';

class DiscountByAmount extends StatefulWidget {
  const DiscountByAmount({
    super.key,
    this.discountAmount,
    required this.callBack,
    required this.products,
    this.customerId,
    this.maxAmountDiscount,
  });

  final double? discountAmount;
  final int? customerId;
  final List<ProductTable> products;
  final Function(
    String? couponCode,
    double? discountAmount,
  ) callBack;
  final double? maxAmountDiscount;

  @override
  State<DiscountByAmount> createState() => _DiscountByAmountState();
}

class _DiscountByAmountState extends State<DiscountByAmount>
    with AutomaticKeepAliveClientMixin {
  final TextEditingController _discountController = TextEditingController();
  final ValueNotifier<bool> _isEnableSubmit = ValueNotifier(false);
  final _keyAmount = GlobalKey<XTextFieldState>();

  @override
  void initState() {
    super.initState();
    if (widget.discountAmount != null) {
      _discountController.text = widget.discountAmount!.formatNumber;
    }
    if (widget.maxAmountDiscount != null) {
      if (widget.discountAmount != null &&
          widget.discountAmount! > 0 &&
          widget.discountAmount! <= widget.maxAmountDiscount!) {
        _isEnableSubmit.value = true;
      }
    } else {
      if (widget.discountAmount != null && widget.discountAmount! > 0) {
        _isEnableSubmit.value = true;
      }
    }
  }

  @override
  void dispose() {
    _discountController.dispose();
    _isEnableSubmit.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Form(
      key: _keyAmount,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _amount(),
          BoxSpacer.s32,
          _submitButton(),
        ],
      ),
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
      validator: (value) {
        double amount = value?.convertToNum ?? 0;
        if (widget.maxAmountDiscount != null) {
          if (amount > 0 && amount <= widget.maxAmountDiscount!) {
            _isEnableSubmit.value = true;
            return null;
          } else {
            _isEnableSubmit.value = false;
            return 'Không thể vượt quá tổng giá trị hóa đơn';
          }
        }
        if (amount > 0) {
          _isEnableSubmit.value = true;
          return null;
        } else {
          _isEnableSubmit.value = false;
          return 'Không thể vượt quá tổng giá trị hóa đơn';
        }
      },
    );
  }

  Widget _submitButton() {
    return ValueListenableBuilder(
      valueListenable: _isEnableSubmit,
      builder: (context, value, _) {
        return XButton(
          disable: !value,
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
      },
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
