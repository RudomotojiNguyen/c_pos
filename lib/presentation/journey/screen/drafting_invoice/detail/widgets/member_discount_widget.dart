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
            [
              CartType.tradeIn,
              CartType.warranty,
              CartType.order,
              CartType.updateOrder,
            ].contains(_draftingInvoiceBloc.state.cartType)) {
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
              _note(),
              // BlocSelector<DraftingInvoiceBloc, DraftingInvoiceState,
              //     CustomerDMemInfo?>(
              //   bloc: _draftingInvoiceBloc,
              //   selector: (state) => state.customerDMemInfo,
              //   builder: (context, state) {
              //     if (state == null) {
              //       return BoxSpacer.blank;
              //     }

              //     CustomerDMemInfo data = state;
              //     bool isOn = data.isValidOTP ?? false;
              //     return _dMemDiscount(data, isOn);
              //   },
              // ),
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

  Widget _note() {
    return Text.rich(
      TextSpan(
        text: 'Lưu ý: ',
        style: AppFont.t.s(),
        children: const [
          TextSpan(
            text: 'Chỉ có thể sử dụng 1 trong 2 loại chiết khấu',
          ),
        ],
      ),
    );
  }

  // chiết khấu thành viên
  // Widget _dMemDiscount(CustomerDMemInfo dMem, bool isOn) {
  //   return Column(
  //     crossAxisAlignment: CrossAxisAlignment.start,
  //     children: [
  //       BoxSpacer.s12,
  //       Row(
  //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //         crossAxisAlignment: CrossAxisAlignment.center,
  //         children: [
  //           Text(
  //             'Chiết khấu thành viên',
  //             style: context.appTheme.textTheme.titleMedium!
  //                 .copyWith(fontSize: 16.sp),
  //           ),
  //           XToggleButton(
  //             isOn: isOn,
  //             toggleSwitch: () {
  //               if (isOn) {
  //                 _disableDMem(dMem);
  //               } else {
  //                 onPressUseDMem();
  //               }
  //             },
  //           ),
  //         ],
  //       ),
  //     ],
  //   );
  // }

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
              style: AppFont.t.s(16),
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
              borderRadius: BorderRadius.circular(16.sp),
            ),
            child: Text.rich(
              TextSpan(
                text: 'Dùng ',
                style: AppFont.t.s(),
                children: [
                  TextSpan(
                    text:
                        '${(customerPoint.pointWillUse ?? 0).formatNumber} điểm',
                    style: AppFont.t.s(16).w800,
                  ),
                  const TextSpan(text: ' tương đương '),
                  TextSpan(
                    text: (customerPoint.amountTransferFromPoint ?? 0)
                        .formatCurrency,
                    style: AppFont.t.s(16).w800,
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

  // void _disableDMem(CustomerDMemInfo customerDMemInfo) {
  //   _draftingInvoiceBloc.add(UpdateCustomerDMemInformationEvent(
  //       customerDMemInfo.copyWith(isValidOTP: false)));
  // }

  // void onPressUseDMem() {
  //   // todo: kiểm tra nếu có dmem thì hỏi để xác nhận
  //   showXBottomSheet(
  //     context,
  //     padding: EdgeInsets.symmetric(vertical: 32.sp, horizontal: 32.sp),
  //     body: OtpFormWidget(
  //       length: 6,
  //       type: DiscountMemberType.dMem,
  //       customerPhone: customer?.getCustomerPhone ?? '',
  //       customerId: customer?.customerId,
  //       onCompleted: (point, amount, otpCodeDmem, newCustomerInfo) {
  //         _draftingInvoiceBloc.add(UpdateCustomerDMemInformationEvent(
  //             _draftingInvoiceBloc.state.customerDMemInfo
  //                 ?.copyWith(isValidOTP: true, otpCodeDmem: otpCodeDmem)));
  //       },
  //     ),
  //   );
  // }

  void _disableUsePoint() {
    _draftingInvoiceBloc
        .add(const UpdateDiscountBillByPointEvent(discountByPoint: null));
  }

  void onPressUsePoint() {
    // todo: kiểm tra nếu có dmem thì hỏi để xác nhận
    showXBottomSheet(
      context,
      padding: EdgeInsets.symmetric(vertical: 32.sp, horizontal: 32.sp),
      body: OtpFormWidget(
        length: 6,
        maxPoint: _draftingInvoiceBloc.state.customer!.getMaxPoint,
        type: DiscountMemberType.point,
        customerPhone: customer?.getCustomerPhone ?? '',
        customerId: customer?.customerId,
        onCompleted: (point, amount, otpCodeDmem, newCustomerInfo) {
          OtpCustomerPointModel discountByPoint =
              (_draftingInvoiceBloc.state.discountTotalBillByPoint ??
                      OtpCustomerPointModel())
                  .copyWith(
                      pointWillUse: point,
                      amountTransferFromPoint: amount,
                      isValidOTP: true,
                      otpCodeDmem: otpCodeDmem);

          _draftingInvoiceBloc.add(
              UpdateDiscountBillByPointEvent(discountByPoint: discountByPoint));
        },
      ),
    );
  }
}
