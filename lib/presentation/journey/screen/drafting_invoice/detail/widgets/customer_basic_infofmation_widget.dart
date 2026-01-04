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
            iconTitle:
                Icon(Icons.person, size: 18.sp, color: AppColors.neutral3Color),
            rightIcon: _rightButton(state),
            title: state == null || state.gender == XGenderType.none
                ? 'Khách hàng'
                : 'Khách ${state.gender.getTitle}',
            child: XBaseButton(
              onPressed: () => onPressedEdit(state),
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
    return XBaseButton(
      onPressed: () => onPressedEdit(customer),
      child: Icon(Icons.edit, size: 18.sp, color: AppColors.iconColor),
    );
  }

  Widget _customerDetail(CustomerTable customer) {
    return XCustomerBasicInfo(
      customerName: customer.getFullName,
      customerPhone: customer.getCustomerPhone,
      customerBirthday: customer.dateOfBirth,
      customerPoint: customer.point,
      customerId: customer.customerId,
    );
  }

  ///
  /// METHOD
  ///

  void onPressedEdit(CustomerTable? customer) {
    showXBottomSheet(
      context,
      key: GlobalAppKey.customerDetailDialogKey,
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
