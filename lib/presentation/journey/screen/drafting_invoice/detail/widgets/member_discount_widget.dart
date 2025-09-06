part of '../drafting_detail_screen.dart';

class MemberDiscountWidget extends StatefulWidget {
  const MemberDiscountWidget({super.key});

  @override
  State<MemberDiscountWidget> createState() => _MemberDiscountWidgetState();
}

class _MemberDiscountWidgetState extends State<MemberDiscountWidget>
    with DialogHelper {
  final DraftingInvoiceBloc _draftingInvoiceBloc =
      getIt.get<DraftingInvoiceBloc>();

  CustomerTable? get customer => _draftingInvoiceBloc.state.customer;

  ///
  @override
  Widget build(BuildContext context) {
    return BlocSelector<DraftingInvoiceBloc, DraftingInvoiceState,
        CustomerTable?>(
      bloc: _draftingInvoiceBloc,
      selector: (state) => state.customer,
      builder: (context, state) {
        if (state == null ||
            state.getCustomerPhone.isNullOrEmpty ||
            state.isDefaultAccount ||
            {
              CartType.tradeIn,
              CartType.order,
              CartType.updateOrder,
            }.contains(_draftingInvoiceBloc.state.cartType)) {
          return BoxSpacer.blank;
        }
        return XContainer(
          margin: EdgeInsets.only(top: 16.sp),
          iconTitle: Assets.svg.discountCoupon.svg(
            width: 24.sp,
            height: 24.sp,
          ),
          title: 'Chiết khấu khách hàng',
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              BlocSelector<DraftingInvoiceBloc, DraftingInvoiceState,
                  OtpCustomerPointModel?>(
                bloc: _draftingInvoiceBloc,
                selector: (state) => state.discountTotalBillByPoint,
                builder: (context, state) {
                  OtpCustomerPointModel data = state ?? OtpCustomerPointModel();
                  bool isOn = data.isValidOTP ?? false;
                  return _pointDiscount(data, isOn);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  ///
  /// WIDGET
  ///

  // chiết khấu điểm
  Widget _pointDiscount(OtpCustomerPointModel customerPoint, bool isOn) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        BoxSpacer.s12,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Tiêu điểm',
              style: AppFont.t.s(),
            ),
            XToggleButton(
              isOn: isOn,
              toggleSwitch: () {
                if (isOn) {
                  _disableUsePoint();
                } else {
                  onPressUsePoint();
                }
              },
            ),
          ],
        ),
        if (isOn) ...[
          Container(
            padding: EdgeInsets.symmetric(vertical: 16.sp, horizontal: 16.sp),
            margin: EdgeInsets.only(top: 8.sp),
            decoration: BoxDecoration(
              color: AppColors.lightGreyColor,
              borderRadius: BorderRadius.all(AppRadius.l),
            ),
            child: Text.rich(
              TextSpan(
                text: 'Dùng ',
                style: AppFont.t.s(),
                children: [
                  TextSpan(
                    text:
                        '${(customerPoint.pointWillUse ?? 0).formatNumber} điểm',
                    style: AppFont.t.s().copyWith(
                          fontWeight: FontWeight.w800,
                          fontSize: 16.sp,
                        ),
                  ),
                  const TextSpan(text: ' tương đương '),
                  TextSpan(
                    text: (customerPoint.amountTransferFromPoint ?? 0)
                        .formatCurrency,
                    style: AppFont.t.s().copyWith(
                          fontWeight: FontWeight.w800,
                          fontSize: 16.sp,
                        ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ],
    );
  }

  ///
  /// METHOD
  ///

  void _disableUsePoint() {
    _draftingInvoiceBloc.add(ClearCouponEvent());
  }

  void onPressUsePoint() {
    showXBottomSheet(
      context,
      body: OtpFormWidget(
        length: 6,
        maxPoint: _draftingInvoiceBloc.state.customer!.getMaxPoint,
        type: DiscountMemberType.point,
        customerPhone: customer?.getCustomerPhone ?? '',
        customerId: customer?.customerId,
        onCompleted: (point, amount, otpCode, newCustomerInfo) {
          OtpCustomerPointModel discountByPoint =
              (_draftingInvoiceBloc.state.discountTotalBillByPoint ??
                      OtpCustomerPointModel())
                  .copyWith(
            pointWillUse: point,
            amountTransferFromPoint: amount,
            isValidOTP: true,
            otpCode: otpCode,
          );

          _draftingInvoiceBloc
              .add(UpdateDiscountBillByPointEvent(discountByPoint));
        },
      ),
    );
  }
}
