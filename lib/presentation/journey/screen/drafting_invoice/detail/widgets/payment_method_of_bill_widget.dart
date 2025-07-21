part of '../drafting_detail_screen.dart';

class PaymentMethodOfBillWidget extends StatefulWidget {
  const PaymentMethodOfBillWidget({super.key});

  @override
  State<PaymentMethodOfBillWidget> createState() =>
      _PaymentMethodOfBillWidgetState();
}

class _PaymentMethodOfBillWidgetState extends State<PaymentMethodOfBillWidget>
    with DialogHelper {
  static final GlobalKey<XBaseButtonState> baseButtonKey =
      GlobalKey<XBaseButtonState>();

  final DraftingInvoiceBloc _draftingInvoiceBloc =
      getIt.get<DraftingInvoiceBloc>();
  final PaymentBloc _paymentBloc = getIt.get<PaymentBloc>();

  // thông tin thanh toán hiển thị khi có thông tin sản phẩm
  // widget render lại khi state hiện tại là:
  //    - lấy thông tin đơn
  //    - nếu danh sách sản phẩm trước đó trống và state hiện tại là cập nhật sản phầm
  //    - nếu danh sách sản phẩm hiện tại trống và state hiện tại là cập nhật sản phầm
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DraftingInvoiceBloc, DraftingInvoiceState>(
      bloc: _draftingInvoiceBloc,
      buildWhen: (previous, current) =>
          current is GetCurrentDraftDataSuccess ||
          (((previous.products?.isEmpty ?? true) ||
                  (current.products?.isEmpty ?? true)) &&
              current is UpdateProductsSuccess),
      listener: (context, state) {
        if (state is GetCurrentDraftDataSuccess) {
          getAccountants(state.cartType ?? CartType.retail);
        }
      },
      builder: (context, state) {
        if ((state.products?.isEmpty ?? true) ||
            {CartType.tradeIn}.contains(state.cartType)) {
          return BoxSpacer.blank;
        }

        return XContainer(
          margin: EdgeInsets.only(top: 16.sp),
          iconTitle: Assets.svg.wallet.svg(
            width: 24.sp,
            height: 24.sp,
          ),
          title: 'Phương thức thanh toán',
          rightIcon: XBaseButton(
            key: baseButtonKey,
            baseButtonType: BaseButtonType.tapOperation,
            // secondaryWidget: _widgetAddMethod(),
            secondaryWidgetBuilder: (closeOverlay) =>
                _widgetAddMethod(closeOverlay),
            child: Icon(
              Icons.add_circle_rounded,
              color: AppColors.primaryColor,
              size: 24.sp,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              _warning(),
              _payByCash(),
              _payByCredit(),
              _payByTransfer(),
              _payByInstallment(),
            ],
          ),
        );
      },
    );
  }

  Widget _warning() {
    return BlocSelector<DraftingInvoiceBloc, DraftingInvoiceState, double>(
      bloc: _draftingInvoiceBloc,
      selector: (state) => state.mustPay,
      builder: (context, state) {
        if (state > 0) {
          return Container(
            decoration: BoxDecoration(
              color: AppColors.warningColor.withValues(alpha: .1),
              borderRadius: BorderRadius.all(AppRadius.xxm),
              border: Border.all(width: 1.sp, color: AppColors.warningColor),
            ),
            padding: EdgeInsets.symmetric(vertical: 8.sp, horizontal: 8.sp),
            child: Text.rich(
              TextSpan(
                text: 'Còn thiếu',
                style: AppFont.t.s(),
                children: [
                  const TextSpan(text: ' '),
                  TextSpan(
                    text: state.formatCurrency,
                    style: AppFont.t.s().copyWith(
                          fontWeight: FontWeight.w900,
                        ),
                  ),
                  const TextSpan(text: ' '),
                  const TextSpan(text: 'để hoàn thành đơn'),
                ],
              ),
            ),
          );
        }
        if (state < 0) {
          return Container(
            decoration: BoxDecoration(
              color: AppColors.warningColor.withValues(alpha: .1),
              borderRadius: BorderRadius.all(AppRadius.xxm),
              border: Border.all(width: 1.sp, color: AppColors.warningColor),
            ),
            padding: EdgeInsets.symmetric(vertical: 8.sp, horizontal: 8.sp),
            child: Text.rich(
              TextSpan(
                text: 'Đã thêm dư',
                style: AppFont.t.s(),
                children: [
                  const TextSpan(text: ' '),
                  TextSpan(
                    text: state.formatCurrency,
                    style: AppFont.t.s().copyWith(
                          fontWeight: FontWeight.w900,
                        ),
                  ),
                  const TextSpan(text: ' '),
                  const TextSpan(text: 'điều chỉnh lại để tránh sai sót'),
                ],
              ),
            ),
          );
        }
        return BoxSpacer.blank;
      },
    );
  }

  Widget _payByCash() {
    return BlocSelector<DraftingInvoiceBloc, DraftingInvoiceState,
        List<PaymentMethodTable>?>(
      bloc: _draftingInvoiceBloc,
      selector: (state) => state.paymentByCash,
      builder: (context, state) {
        return PaymentMethodDetailWidget(
          title: 'Tiền mặt',
          payments: state ?? [],
          onRemove: (paymentMethodId) {
            _draftingInvoiceBloc
                .add(RemovePaymentMethodEvent(id: paymentMethodId));
          },
          onUpdate: (paymentMethod) {
            _onSelectMethod(
              context,
              paymentType: PaymentType.cash,
              paymentMethod: paymentMethod,
            );
          },
        );
      },
    );
  }

  Widget _payByCredit() {
    return BlocSelector<DraftingInvoiceBloc, DraftingInvoiceState,
        List<PaymentMethodTable>?>(
      bloc: _draftingInvoiceBloc,
      selector: (state) => state.paymentByCredit,
      builder: (context, state) {
        return PaymentMethodDetailWidget(
          title: 'Cà thẻ',
          payments: state ?? [],
          onRemove: (paymentMethodId) {
            _draftingInvoiceBloc
                .add(RemovePaymentMethodEvent(id: paymentMethodId));
          },
          onUpdate: (paymentMethod) {
            _onSelectMethod(
              context,
              paymentType: PaymentType.credit,
              paymentMethod: paymentMethod,
            );
          },
        );
      },
    );
  }

  Widget _payByTransfer() {
    return BlocSelector<DraftingInvoiceBloc, DraftingInvoiceState,
        List<PaymentMethodTable>?>(
      bloc: _draftingInvoiceBloc,
      selector: (state) => state.paymentByTransfer,
      builder: (context, state) {
        return PaymentMethodDetailWidget(
          title: 'Chuyển khoản',
          payments: state ?? [],
          onRemove: (paymentMethodId) {
            _draftingInvoiceBloc
                .add(RemovePaymentMethodEvent(id: paymentMethodId));
          },
          onUpdate: (paymentMethod) {
            _onSelectMethod(
              context,
              paymentType: PaymentType.transfer,
              paymentMethod: paymentMethod,
            );
          },
        );
      },
    );
  }

  Widget _payByInstallment() {
    return BlocSelector<DraftingInvoiceBloc, DraftingInvoiceState,
        List<PaymentMethodTable>?>(
      bloc: _draftingInvoiceBloc,
      selector: (state) => state.paymentByInstallment,
      builder: (context, state) {
        return PaymentMethodDetailWidget(
          title: 'Trả góp',
          payments: state ?? [],
          onRemove: (paymentMethodId) {
            _draftingInvoiceBloc
                .add(RemovePaymentMethodEvent(id: paymentMethodId));
          },
          onUpdate: (paymentMethod) {
            _onSelectMethod(
              context,
              paymentType: PaymentType.installment,
              paymentMethod: paymentMethod,
            );
          },
        );
      },
    );
  }

  Widget _widgetAddMethod(Future<void> Function() closeOverlay) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4.sp),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BlocBuilder<DraftingInvoiceBloc, DraftingInvoiceState>(
            bloc: _draftingInvoiceBloc,
            buildWhen: (previous, current) =>
                current is UpdatePaymentMethodSuccess ||
                current is IsGettingDetail,
            builder: (context, state) {
              if ((state.paymentByCash ?? []).isNotEmpty) {
                return BoxSpacer.blank;
              }
              return _rowPayment(
                onPressed: () async {
                  await closeOverlay();
                  _onSelectMethod(context, paymentType: PaymentType.cash);
                },
                title: PaymentType.cash.getTitle,
              );
            },
          ),
          _rowPayment(
            onPressed: () async {
              await closeOverlay();
              _onSelectMethod(context, paymentType: PaymentType.credit);
            },
            title: PaymentType.credit.getTitle,
          ),
          _rowPayment(
            onPressed: () async {
              await closeOverlay();
              _onSelectMethod(context, paymentType: PaymentType.transfer);
            },
            title: PaymentType.transfer.getTitle,
          ),
          BlocBuilder<DraftingInvoiceBloc, DraftingInvoiceState>(
            bloc: _draftingInvoiceBloc,
            buildWhen: (previous, current) =>
                current is UpdatePaymentMethodSuccess ||
                current is IsGettingDetail,
            builder: (context, state) {
              if ((state.paymentByInstallment ?? []).isNotEmpty) {
                return BoxSpacer.blank;
              }
              return _rowPayment(
                onPressed: () async {
                  await closeOverlay();
                  _onSelectMethod(
                    context,
                    paymentType: PaymentType.installment,
                  );
                },
                title: PaymentType.installment.getTitle,
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _rowPayment({required String title, required Function()? onPressed}) {
    return XBaseButton(
      padding: EdgeInsets.symmetric(vertical: 6.sp, horizontal: 18.sp),
      onPressed: onPressed,
      child: Text(
        title,
        style: AppFont.t.s(),
      ),
    );
  }

  ///
  /// method
  ///

  void getAccountants(CartType cartType) {
    _paymentBloc.add(GetCashAccountsEvent());
    _paymentBloc.add(GetTransferAccountsEvent(cartType: cartType));
    _paymentBloc.add(GetCreditAccountsEvent(cartType: cartType));
    _paymentBloc.add(GetInstallmentAccountsEvent());
    _paymentBloc.add(GetPaymentEnumEvent());
  }

  _onSelectMethod(
    BuildContext context, {
    required PaymentType paymentType,
    PaymentMethodTable? paymentMethod,
  }) {
    baseButtonKey.currentState?.removeOverlay();
    showXBottomSheet(
      context,
      isScrollControlled: true,
      key: GlobalAppKey.methodDialogKey,
      body: ModifyPaymentMethodDialog(
        paymentType: paymentType,
        paymentBloc: _paymentBloc,
        detail: paymentMethod,
        callBack: (detail) {
          _draftingInvoiceBloc.add(UpdatePaymentMethodEvent(payment: detail));
        },
      ),
    );
  }
}
