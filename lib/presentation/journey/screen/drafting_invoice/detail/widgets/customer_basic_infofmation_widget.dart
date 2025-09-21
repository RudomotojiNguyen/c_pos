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
        BlocListener(
          bloc: _customerBloc,
          listener: (context, state) {
            if (state is GetCustomerDetailSuccess) {
              /// cập nhật lại thông tin khách hàng sau khi lấy lại
              _draftingInvoiceBloc.add(
                UpdateCustomerInfoOfBillEvent(state.customer),
              );
            }
          },
        ),
        BlocListener<DraftingInvoiceBloc, DraftingInvoiceState>(
          bloc: _draftingInvoiceBloc,
          listener: (context, state) {
            if (state is GetCurrentDraftDataSuccess && mounted) {
              /// lấy lại thông tin khách hàng
              if (state.customer != null &&
                  state.customer!.customerId != null) {
                _customerBloc.add(
                  GetCustomerByIdEvent(state.customer!.customerId!),
                );
              }
            }
          },
        ),
      ],
      child: BlocSelector<DraftingInvoiceBloc, DraftingInvoiceState,
          CustomerTable?>(
        bloc: _draftingInvoiceBloc,
        selector: (state) => state.customer,
        builder: (context, state) {
          return XContainer(
            iconTitle: Assets.svg.customer.svg(
              width: 22.sp,
              height: 22.sp,
            ),
            rightIcon: _rightButton(state),
            title: state == null || state.gender == XGenderType.none
                ? 'Khách hàng'
                : 'Khách ${state.gender.getTitle}',
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                BoxSpacer.s4,
                if (state == null || state.isNullCustomer) ...[
                  BoxSpacer.s8,
                  Text.rich(
                    TextSpan(
                      text: 'Thêm thông tin khách hàng để tiếp tục',
                      style: AppFont.t.s(14).copyWith(
                            fontWeight: FontWeight.w600,
                            color: AppColors.neutral3Color,
                          ),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ] else ...[
                  _customerDetail(state),
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

  ///
  /// METHOD
  ///

  void onPressedEdit(CustomerTable? customer) {
    showXBottomSheet(
      context,
      body: UpdateCustomerInformationDialog(
        cartType: _draftingInvoiceBloc.state.cartType,
        initCustomerDetail: customer?.convertToModel,
        onUpdateCustomer: updateCustomer,
      ),
    );
  }

  void clearCustomerInfo() {
    _draftingInvoiceBloc.add(ClearCustomerEvent());
  }

  void updateCustomer(customerInfo) {
    _draftingInvoiceBloc.add(UpdateCustomerInfoOfBillEvent(customerInfo));
  }
}
