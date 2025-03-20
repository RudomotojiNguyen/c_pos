part of '../drafting_detail_screen.dart';

class CustomerBillInformationWidget extends StatefulWidget {
  const CustomerBillInformationWidget({super.key});

  @override
  State<CustomerBillInformationWidget> createState() =>
      _CustomerBillInformationWidgetState();
}

class _CustomerBillInformationWidgetState
    extends State<CustomerBillInformationWidget> with DialogHelper {
  final CustomerBloc _customerBloc = getIt.get<CustomerBloc>();
  final DraftingInvoiceBloc _draftingInvoiceBloc =
      getIt.get<DraftingInvoiceBloc>();

  // thông tin khách hàng luôn hiển thị đầu tiên
  // widget render lại khi state hiện tại là:
  //    - lấy thông tin đơn
  //    - thông tin khách hàng được cập nhật
  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<CustomerBloc, CustomerState>(
          bloc: _customerBloc,
          listener: (context, state) {
            if (state is GetCustomerDetailSuccess) {
              /// cập nhật lại thông tin khách hàng sau khi lấy lại
              _draftingInvoiceBloc
                  .add(UpdateCustomerEvent(customer: state.customer));
            }
          },
        ),
        BlocListener<DraftingInvoiceBloc, DraftingInvoiceState>(
          bloc: _draftingInvoiceBloc,
          listener: (context, state) {
            if (state is GetDraftingInvoiceDetailSuccess && mounted) {
              /// lấy lại thông tin khách hàng
              if (state.customer?.customerId != null) {
                _customerBloc
                    .add(GetCustomerByIdEvent(state.customer!.customerId!));
              }
            }

            /// chỉ những loại liên quan tới bill mới gọi lấy loại khách
            if ((state is GetDraftingInvoiceDetailSuccess ||
                    state is UpdateCustomerSuccess) &&
                [
                  CartType.order,
                  CartType.updateOrder,
                  CartType.retail,
                  CartType.updateBill
                ].contains(state.cartType)) {
              /// nếu lúc lấy thông tin đơn nháp có thông tin khách hàng thì lấy lại loại khách hàng
              if (state.customer != null) {
                // _customerBloc.add(
                //     GetCustomerStatisticEvent(state.customer!.phoneNo ?? ''));
              }
            }
          },
        ),
      ],
      child: BlocBuilder<DraftingInvoiceBloc, DraftingInvoiceState>(
        bloc: _draftingInvoiceBloc,
        buildWhen: (previous, current) =>
            current is GetDraftingInvoiceDetailSuccess ||
            current is UpdateCustomerSuccess,
        builder: (context, state) {
          final customer = state.customer;
          return XContainer(
            iconTitle: Assets.svg.customer.svg(
              width: 22.sp,
              height: 22.sp,
            ),
            rightIcon: _rightButton(customer),
            title: customer == null || customer.appellation == XGenderType.none
                ? 'Khách hàng'
                : 'Khách ${customer.appellation.getTitle}',
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                BoxSpacer.s4,
                if (customer == null || customer.isNullCustomer) ...[
                  BoxSpacer.s8,
                  Text.rich(
                    TextSpan(
                      text: 'Thêm thông tin khách hàng để tiếp tục',
                      style: AppFont.t.s(14).w600.neutral3,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ] else ...[
                  // if (!customer.isDefaultAccount &&
                  //     [
                  //       CartType.order,
                  //       CartType.updateOrder,
                  //       CartType.retail,
                  //       CartType.updateBill
                  //     ].contains(_draftingInvoiceBloc.state.cartType)) ...[
                  //   /// nếu không phải là thông tin mặc định
                  //   /// và phải trong thể loại bill mới hiện lên
                  //   // _loyaltyRank(customer),
                  //   BoxSpacer.s4,
                  // ],
                  _customerDetail(customer),
                ],
              ],
            ),
          );
        },
      ),
    );
  }

  ///
  /// WIDGET
  ///
  Widget _rightButton(CustomerTable? customer) {
    if (customer?.isNullCustomer ?? true) {
      return XBaseButton(
        onPressed: () => onPressedEdit(customer),
        child: Assets.svg.edit.svg(
          width: 24.sp,
          height: 24.sp,
        ),
      );
    }

    return XBaseButton(
      onPressed: clearCustomerInfo,
      child: Assets.svg.remove.svg(
        width: 24.sp,
        height: 24.sp,
      ),
    );
  }

  Widget _customerDetail(CustomerTable customer) {
    return XCustomerBasicInfo(
      customerName: customer.getFullName,
      customerPhone: customer.getCustomerPhone,
      customerBirthday: customer.dateOfBirth,
      customerPoint: customer.point,
      customerId: customer.customerId,
      onPressedEdit: () => onPressedEdit(customer),
    );
  }

  // Widget _loyaltyRank(CustomerTable customer) {
  //   return BlocSelector<DraftDetailBloc, DraftDetailState, CustomerDMemInfo?>(
  //     bloc: _draftDetailBloc,
  //     selector: (state) => state.customerDMemInfo,
  //     builder: (context, customerDMemInfo) {
  //       bool isOn = customerDMemInfo?.isValidOTP ?? false;
  //       return Column(
  //         crossAxisAlignment: CrossAxisAlignment.start,
  //         children: [
  //           BlocConsumer<CustomerBloc, CustomerState>(
  //             bloc: _customerBloc,
  //             buildWhen: (previous, current) => current is UpdateIsLoading,
  //             listener: (context, customerState) {
  //               if (customerState is GetCustomerStatisticSuccess) {
  //                 late CustomerDMemInfo data;

  //                 if (customerDMemInfo == null) {
  //                   data = CustomerDMemInfo(
  //                     customerTypeId: customerState.customerType?.id,
  //                     isValidOTP: false,
  //                     customerTypeName: customerState.customerType?.name,
  //                   );
  //                 } else {
  //                   data = customerDMemInfo.copyWith(
  //                     customerTypeId: customerState.customerType?.id,
  //                     customerTypeName: customerState.customerType?.name,
  //                   );
  //                 }

  //                 _draftDetailBloc
  //                     .add(UpdateCustomerDMemInformationEvent(data));
  //               }
  //             },
  //             builder: (context, state) {
  //               if (state.isLoading) {
  //                 return XPlaceHolder(
  //                   width: 100.sp,
  //                   height: 16.sp,
  //                 );
  //               }
  //               return BoxSpacer.blank;
  //             },
  //           ),
  //           BlocBuilder<CustomerBloc, CustomerState>(
  //             bloc: _customerBloc,
  //             buildWhen: (previous, current) =>
  //                 current is GetCustomerStatisticSuccess,
  //             builder: (context, state) {
  //               if (state is GetCustomerStatisticSuccess) {
  //                 return Row(
  //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                   crossAxisAlignment: CrossAxisAlignment.center,
  //                   children: [
  //                     Row(
  //                       mainAxisSize: MainAxisSize.min,
  //                       crossAxisAlignment: CrossAxisAlignment.center,
  //                       children: [
  //                         Assets.svg.crown.svg(
  //                           width: 24.sp,
  //                           height: 24.sp,
  //                           package: AssetPackage.dpos,
  //                         ),
  //                         BoxSpacer.s4,
  //                         if (customerDMemInfo != null) ...[
  //                           XBaseButton(
  //                             baseButtonType: BaseButtonType.tapOperation,
  //                             onPressed: () {},
  //                             secondaryWidget: Container(
  //                               padding: EdgeInsets.all(12.sp),
  //                               decoration: BoxDecoration(
  //                                   color: AppColors.white,
  //                                   borderRadius: BorderRadius.circular(8.sp)),
  //                               child: Text(
  //                                 state.customerType?.description ?? '',
  //                               ),
  //                             ),
  //                             child: Row(
  //                               children: [
  //                                 Text(
  //                                   customerDMemInfo.customerTypeName ?? '',
  //                                   style: context.appTheme.textTheme.bodySmall!
  //                                       .copyWith(
  //                                     fontWeight: FontWeight.w700,
  //                                     fontSize: 14.sp,
  //                                   ),
  //                                 ),
  //                                 BoxSpacer.s8,
  //                                 Icon(
  //                                   Icons.info,
  //                                   color: AppColors.informationColor,
  //                                   size: 16.sp,
  //                                 ),
  //                               ],
  //                             ),
  //                           )
  //                         ] else ...[
  //                           // todo: check lại chỗ này
  //                           // Text.rich(
  //                           //   TextSpan(
  //                           //     text: 'Nhấn để đăng ký DMem',
  //                           //     style: context.appTheme.textTheme.bodySmall!
  //                           //         .copyWith(
  //                           //       fontWeight: FontWeight.w500,
  //                           //       fontSize: 12.sp,
  //                           //       color: AppColors.informationColor,
  //                           //     ),
  //                           //     recognizer: TapGestureRecognizer()
  //                           //       ..onTap = () {
  //                           //         // gọi api đăng ký khách hàng mới
  //                           //       },
  //                           //   ),
  //                           // )
  //                         ],
  //                       ],
  //                     ),
  //                     if ([CartType.retail, CartType.updateBill]
  //                         .contains(_draftDetailBloc.state.cartType)) ...[
  //                       XToggleButton(
  //                         isOn: isOn,
  //                         toggleSwitch: () {
  //                           if (isOn) {
  //                             _disableDMem(
  //                                 customerDMemInfo ?? CustomerDMemInfo());
  //                           } else {
  //                             onPressUseDMem(
  //                               customerPhone: customer.getCustomerPhone,
  //                               customerId: customer.customerId!,
  //                             );
  //                           }
  //                         },
  //                       ),
  //                     ],
  //                   ],
  //                 );
  //               }
  //               return BoxSpacer.blank;
  //             },
  //           ),
  //         ],
  //       );
  //     },
  //   );
  // }

  ///
  /// METHOD
  ///

  // void _disableDMem(CustomerDMemInfo customerDMemInfo) {
  //   _draftDetailBloc.add(UpdateCustomerDMemInformationEvent(
  //       customerDMemInfo.copyWith(isValidOTP: false)));
  // }

  // void onPressUseDMem(
  //     {required String customerPhone, required int customerId}) {
  //   showXBottomSheet(
  //     context,
  //     padding: EdgeInsets.symmetric(vertical: 32.sp, horizontal: 32.sp),
  //     body: OtpFormWidget(
  //       length: 6,
  //       type: DiscountMemberType.dMem,
  //       customerPhone: customerPhone,
  //       customerId: customerId,
  //       onCompleted: (point, amount, otpCodeDmem, newCustomerInfo) {
  //         _draftDetailBloc.add(UpdateCustomerDMemInformationEvent(
  //             _draftDetailBloc.state.customerDMemInfo
  //                 ?.copyWith(isValidOTP: true, otpCodeDmem: otpCodeDmem)));
  //       },
  //     ),
  //   );
  // }

  void onPressedEdit(CustomerTable? customer) {
    showXBottomSheet(
      context,
      isScrollControlled: true,
      padding: EdgeInsets.symmetric(vertical: 32.sp, horizontal: 32.sp),
      body: UpdateCustomerInformationDialog(
        initCustomerDetail: customer?.convertToModel,
        onUpdateCustomer: updateCustomer,
      ),
    );
  }

  void clearCustomerInfo() {
    _draftingInvoiceBloc.add(ClearCustomerEvent());
  }

  void updateCustomer(customerInfo) {
    if (customerInfo != null &&
        customerInfo.phoneNo != _draftingInvoiceBloc.state.customer?.phoneNo) {
      // nếu số điện thoại có thay đổi thì gọi lấy lại loại khách hàng
      // _customerBloc.add(GetCustomerStatisticEvent(customerInfo.phoneNo ?? ''));
    }
    _draftingInvoiceBloc.add(UpdateCustomerEvent(customer: customerInfo));
  }
}
