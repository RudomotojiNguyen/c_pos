part of 'discount_dialog.dart';

class DiscountByCode extends StatefulWidget {
  const DiscountByCode({
    super.key,
    this.couponCode,
    this.discountAmount,
    required this.callBack,
    required this.products,
    this.customerId,
  });

  final String? couponCode;
  final double? discountAmount;
  final int? customerId;
  final List<ProductTable> products;
  final Function(
    String? couponCode,
    double? discountAmount,
  ) callBack;

  @override
  State<DiscountByCode> createState() => _DiscountByCodeState();
}

class _DiscountByCodeState extends State<DiscountByCode>
    with AutomaticKeepAliveClientMixin {
  final TextEditingController _codeController = TextEditingController();
  final ValueNotifier<double?> _discountAmount = ValueNotifier(null);
  final ValueNotifier<CouponModel?> _couponSelected = ValueNotifier(null);
  final ValueNotifier<bool> _showBottomApply = ValueNotifier(false);
  Timer? _debounceTimeDiscount;

  final CouponBloc _couponBloc = getIt.get<CouponBloc>();

  double? get getDiscountAmount => _discountAmount.value;

  String? get getCode => _couponSelected.value?.getCode ?? _codeController.text;

  @override
  void initState() {
    super.initState();

    if (widget.couponCode != null) {
      _codeController.text = widget.couponCode ?? '';
      _discountAmount.value = widget.discountAmount;
    }

    if (widget.products.isNotEmpty) {
      _couponBloc.add(SearchCouponEvent(
        products: widget.products,
        customerId: widget.customerId,
      ));
    }
  }

  @override
  void dispose() {
    _codeController.dispose();
    _discountAmount.dispose();
    _couponSelected.dispose();
    _showBottomApply.dispose();
    _debounceTimeDiscount?.cancel();
    super.dispose();
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocListener<CouponBloc, CouponState>(
      bloc: _couponBloc,
      listener: (context, state) {
        if (state is UpdateDiscountAmount) {
          _onChangeDiscount(coupon: null, discountAmount: state.discountAmount);
        }
      },
      child: Container(
        constraints: BoxConstraints(
          maxHeight: 0.5.sh,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _couponCode(),
            BoxSpacer.s16,
            _coupons(),
            BoxSpacer.s8,
            _submitButton(),
          ],
        ),
      ),
    );
  }

  ///
  /// WIDGET
  ///
  Widget _couponCode() {
    return XTextField(
      controller: _codeController,
      isRequired: false,
      labelText: 'Mã coupon',
      hintText: 'Nhập mã tại đây',
      onChanged: _onChangeCode,
      suffixWidget: ValueListenableBuilder(
        valueListenable: _showBottomApply,
        builder: (context, value, child) {
          if (!value) {
            return BoxSpacer.blank;
          }
          return XBaseButton(
            onPressed: _checkCoupon,
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 4.sp, horizontal: 16.sp),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(AppRadius.xxm),
                color: AppColors.primaryColor,
                boxShadow: [
                  BoxShadow(
                    color: AppColors.shadowColor,
                    spreadRadius: 5,
                    blurRadius: 5.0,
                    offset: const Offset(0, 4), // changes position of shadow
                  ),
                ],
              ),
              child: Text(
                'Áp dụng',
                style: AppFont.t.s().white,
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _coupons() {
    return BlocBuilder<CouponBloc, CouponState>(
      bloc: _couponBloc,
      builder: (context, state) {
        if (state is IsLoading) {
          return Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 20.sp,
              mainAxisSpacing: 20.sp,
              childAspectRatio: 1,
              children: [
                ...List.generate(
                  8,
                  (index) => const CouponItemLoading(),
                )
              ],
            ),
          );
        }

        if (state.coupons.isEmpty) {
          const EmptyDataWidget(
              emptyMessage: 'Không tìm thấy coupon trong list');
        }
        return Expanded(
          child: ListView.separated(
            itemBuilder: (context, index) => ValueListenableBuilder(
                valueListenable: _couponSelected,
                builder: (context, value, _) {
                  final CouponModel coupon = state.coupons[index];
                  bool isSelected = value?.getCode == coupon.getCode;
                  return CouponItemInfo(
                    isSelected: isSelected,
                    coupon: coupon,
                    onSelect: () {
                      if (!isSelected) {
                        _onChangeDiscount(coupon: coupon);
                      }
                    },
                  );
                }),
            separatorBuilder: (context, index) => BoxSpacer.s8,
            itemCount: state.coupons.length,
          ),
        );
      },
    );
  }

  Widget _submitButton() {
    return ValueListenableBuilder(
        valueListenable: _discountAmount,
        builder: (context, discountAmount, child) {
          if (discountAmount == null) {
            return BoxSpacer.blank;
          }
          return XButton(
            padding: EdgeInsets.symmetric(vertical: 12.sp, horizontal: 16.sp),
            onPressed: _onSubmit,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Được giảm:',
                      style: AppFont.t.s().white,
                    ),
                    Text(
                      discountAmount.formatNumber,
                      style: AppFont.t.s().white,
                    ),
                  ],
                ),
                Text(
                  'Xong',
                  style: AppFont.t.s().white,
                ),
              ],
            ),
          );
        });
  }

  ///
  /// MEHOTD
  ///
  _onChangeCode(String? value) {
    _onChangeDiscount(
      coupon: _couponSelected.value,
      discountAmount: _couponSelected.value?.discountMoney,
    );
    if (value.isNotNullOrEmpty && !_showBottomApply.value) {
      _showBottomApply.value = true;
    }
    if (value.isNullOrEmpty && _showBottomApply.value) {
      _showBottomApply.value = false;
    }

    if (_debounceTimeDiscount?.isActive ?? false) {
      _debounceTimeDiscount!.cancel();
    }
    _debounceTimeDiscount = Timer(
        const Duration(milliseconds: AppConstants.timeSearchValue), () async {
      _couponBloc.add(SearchCouponEvent(
        code: value?.trim(),
        customerId: widget.customerId,
        products: widget.products,
      ));
    });
  }

  _checkCoupon() {
    _couponBloc.add(CheckCouponEvent(
      code: _codeController.text.trim(),
      products: widget.products,
      customerId: widget.customerId,
    ));
  }

  _onChangeDiscount({
    CouponModel? coupon,
    double? discountAmount,
  }) {
    _couponSelected.value = coupon;
    _discountAmount.value = coupon?.discountMoney ?? discountAmount;
  }

  _onSubmit() {
    widget.callBack(getCode, getDiscountAmount);
    Navigator.pop(context);
  }
}
