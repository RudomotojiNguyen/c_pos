import 'dart:async';

import 'package:c_pos/common/extensions/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/configs/box.dart';
import '../../../common/enum/enum.dart';
import '../../../data/datasources/local_db/local_db.dart';
import '../../../data/models/accountant_model.dart';
import '../../../data/models/installment_accounting_model.dart';
import '../../journey/screen/payment/bloc/payment_bloc.dart';
import '../widgets.dart';

class ModifyPaymentMethodDialog extends StatefulWidget {
  const ModifyPaymentMethodDialog({
    super.key,
    required this.paymentType,
    this.detail,
    required this.paymentBloc,
    required this.callBack,
  });

  final PaymentType paymentType;
  final PaymentMethodTable? detail;
  final PaymentBloc paymentBloc;

  final Function(PaymentMethodTable detail) callBack;

  @override
  State<ModifyPaymentMethodDialog> createState() =>
      _ModifyPaymentMethodDialogState();
}

class _ModifyPaymentMethodDialogState extends State<ModifyPaymentMethodDialog> {
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _accountController = TextEditingController();
  final TextEditingController _creditNumberController = TextEditingController();
  final TextEditingController _refCodeController = TextEditingController();
  final TextEditingController _conditionController = TextEditingController();
  final TextEditingController _idCardController = TextEditingController();
  SingleSelectController<MethodDeposit?> selectedItemNotifier =
      SingleSelectController(MethodDeposit.none);

  AccountantModel? accountingModel;
  InstallmentAccountingModel? installmentAccounting;
  final _kForm = GlobalKey<FormState>();
  Timer? _timer;

  final ValueNotifier<bool> _validateButton = ValueNotifier(false);

  @override
  void initState() {
    super.initState();
    if (widget.detail != null) {
      initData();
    }
  }

  void initData() {
    _amountController.text = widget.detail!.amount?.formatNumber ?? '0';

    if (widget.detail!.accountDetail != null) {
      _accountController.text = widget.detail!.accountDetail!.getName;
      accountingModel = widget.detail!.accountDetail;
    }
    if (widget.detail!.installmentMethod != null) {
      installmentAccounting = widget.detail!.installmentMethod;
      _accountController.text = widget.detail!.installmentMethod!.getName;
    }

    _conditionController.text = widget.detail!.conditionNumber ?? '';
    _idCardController.text = widget.detail!.idCard ?? '';
    selectedItemNotifier.value = widget.detail!.methodDeposit;

    _creditNumberController.text = widget.detail!.cardNumber ?? '';
    _refCodeController.text = widget.detail!.refCode ?? '';

    _onValidate();
  }

  @override
  void dispose() {
    selectedItemNotifier.dispose();
    _amountController.dispose();
    _accountController.dispose();
    _creditNumberController.dispose();
    _refCodeController.dispose();
    _conditionController.dispose();
    _idCardController.dispose();
    _validateButton.dispose();
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom +
            10.sp, // Đặt padding theo bàn phím
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _renderHeader(),
            BoxSpacer.s32,
            _renderBody(),
            BoxSpacer.s32,
            _renderBottom(),
          ],
        ),
      ),
    );
  }

  ///
  /// WIDGET
  ///

  Widget _renderBody() {
    return Form(
      key: _kForm,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if ([PaymentType.cash, PaymentType.transfer, PaymentType.credit]
              .contains(widget.paymentType)) ...[
            _renderAccount(),
            BoxSpacer.s16,
          ],
          XTextField(
            controller: _amountController,
            isRequired: true,
            labelText: 'Số tiền thanh toán',
            hintText: 'Nhập số tiền',
            inputFormatters: [NumberFormatter()],
            textInputType: TextInputType.number,
            onChanged: (value) => _onValidate(),
            validator: (value) {
              if (value.isNullOrEmpty) {
                return 'Vui lòng nhập số tiền hợp lệ';
              }
              return null;
            },
          ),
          if (widget.paymentType == PaymentType.credit) ...[
            _creditForm(),
          ],
          if (widget.paymentType == PaymentType.transfer) ...[
            _transferForm(),
          ],
          if (widget.paymentType == PaymentType.installment) ...[
            _installmentForm(),
          ],
        ],
      ),
    );
  }

  Widget _creditForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        BoxSpacer.s16,
        XTextField(
          controller: _creditNumberController,
          isRequired: false,
          labelText: 'Số thẻ',
          hintText: 'Nhập 4 số cuối thẻ',
          textInputType: TextInputType.text,
          onChanged: (value) => _onValidate(),
        ),
      ],
    );
  }

  Widget _transferForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        BoxSpacer.s16,
        XTextField(
          controller: _refCodeController,
          isRequired: false,
          labelText: 'Mã tham chiếu',
          hintText: 'Nhập mã tham chiếu',
          textInputType: TextInputType.text,
          onChanged: (value) => _onValidate(),
        ),
      ],
    );
  }

  Widget _installmentForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        BoxSpacer.s16,
        XBasicDropDown<MethodDeposit>(
          labelText: 'Hình thức trả góp',
          isRequired: true,
          hintText: 'Chọn hình thức trả góp',
          expandedHeaderPadding: EdgeInsets.zero,
          items: const [
            MethodDeposit.none,
            MethodDeposit.interestPayment,
            MethodDeposit.noneInterestPayment
          ],
          selectedItemNotifier: selectedItemNotifier,
          listItemBuilder: (BuildContext context, MethodDeposit result,
              bool isSelected, VoidCallback onItemSelect) {
            return Text(
              result.getTitle,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: AppFont.t.s(),
            );
          },
          headerBuilder:
              (BuildContext context, MethodDeposit result, bool isSelected) {
            return Text(
              result.getTitle,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: AppFont.t.s(),
            );
          },
          onChanged: (value) => _onValidate(),
        ),
        BoxSpacer.s8,
        XTextField<InstallmentAccountingModel>(
          controller: _accountController,
          hintText: 'Chọn dịch vụ trả góp',
          onChanged: _onChangeText,
          textInputType: TextInputType.text,
          textInputAction: TextInputAction.next,
          onSelectData: onSelectAccountInstallment,
          initItems: widget.paymentBloc.state.installmentAccountants,
          validator: (value) {
            if ([PaymentType.cash, PaymentType.transfer, PaymentType.credit]
                .contains(widget.paymentType)) {
              return null;
            }
            if (installmentAccounting == null) {
              return 'Vui lòng chọn dịch vụ';
            }
            return null;
          },
          itemSearchBuilder: (context, index, data) {
            return Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 8.sp,
                vertical: 8.sp,
              ),
              child: Text.rich(
                TextSpan(
                  text: data.getName,
                  style: AppFont.t.s(),
                ),
              ),
            );
          },
          futureRequest: (value) async {
            return await getInstallmentAccountants(value);
          },
        ),
        BoxSpacer.s16,
        XTextField(
          controller: _conditionController,
          isRequired: false,
          labelText: 'Mã hợp đồng',
          hintText: 'Nhập mã hợp đồng',
          textInputType: TextInputType.text,
          onChanged: (value) => _onValidate(),
        ),
        BoxSpacer.s16,
        XTextField(
          controller: _idCardController,
          isRequired: false,
          labelText: 'Số CMND/CCCD',
          hintText: 'Nhập số CMND/CCCD',
          textInputType: TextInputType.text,
          onChanged: (value) => _onValidate(),
        ),
      ],
    );
  }

  Widget _renderAccount() {
    List<AccountantModel>? initItems = [];
    switch (widget.paymentType) {
      case PaymentType.cash:
        initItems = widget.paymentBloc.state.cashAccountants;
        break;
      case PaymentType.transfer:
        initItems = widget.paymentBloc.state.transferAccountants;
        break;
      case PaymentType.credit:
        initItems = widget.paymentBloc.state.creditAccountants;
        break;
      default:
        initItems = [];
        break;
    }

    return XTextField<AccountantModel>(
      controller: _accountController,
      labelText: 'Tài khoản thanh toán',
      isRequired: true,
      hintText: 'Chọn tài khoản thanh toán',
      onChanged: _onChangeText,
      textInputType: TextInputType.text,
      textInputAction: TextInputAction.next,
      onSelectData: onSelectAccount,
      initItems: initItems,
      validator: (value) {
        if (widget.paymentType == PaymentType.installment) {
          return null;
        }
        if (accountingModel == null) {
          return 'Vui lòng chọn tài khoản thanh toán';
        }
        return null;
      },
      itemSearchBuilder: (context, index, data) {
        return Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 8.sp,
            vertical: 8.sp,
          ),
          child: Text.rich(
            TextSpan(
              text: data.getName,
              style: AppFont.t.s(),
            ),
          ),
        );
      },
      futureRequest: (value) async {
        return await getAccountants(value);
      },
    );
  }

  Widget _renderBottom() {
    return ValueListenableBuilder(
        valueListenable: _validateButton,
        builder: (context, value, _) {
          return XButton(
            disable: !value,
            padding: EdgeInsets.symmetric(vertical: 12.sp),
            onPressed: () {
              if (_kForm.currentState!.validate()) {
                context.hideKeyboard;
                PaymentMethodTable paymentMethod = PaymentMethodTable();

                if (widget.detail != null) {
                  paymentMethod.id = widget.detail!.id;
                }
                double amount = _amountController.text.trim().convertToNum;

                paymentMethod
                  ..amount = amount
                  ..cardNumber = _creditNumberController.text.trim()
                  ..refCode = _refCodeController.text.trim()
                  ..conditionNumber = _conditionController.text.trim()
                  ..idCard = _idCardController.text.trim()
                  ..accountDetail = accountingModel
                  ..methodDeposit =
                      selectedItemNotifier.value ?? MethodDeposit.none
                  ..installmentMethod = installmentAccounting
                  ..paymentType = widget.paymentType;

                widget.callBack(paymentMethod);
                Navigator.pop(context);
              }
            },
            title: 'Hoàn tất',
          );
        });
  }

  Widget _renderHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Thông tin thanh toán',
          style: AppFont.t.s(16).w700,
        ),
      ],
    );
  }

  ///
  /// METHOD
  ///

  _onValidate() {
    bool result = false;
    if (widget.paymentType == PaymentType.cash) {
      result = _amountController.text.trim().isNotNullOrEmpty;
    }
    if (widget.paymentType == PaymentType.transfer) {
      result = _amountController.text.trim().isNotNullOrEmpty &&
          accountingModel != null;
    }
    if (widget.paymentType == PaymentType.credit) {
      result = _amountController.text.trim().isNotNullOrEmpty &&
          accountingModel != null;
    }
    if (widget.paymentType == PaymentType.installment) {
      result = _amountController.text.trim().isNotNullOrEmpty &&
          selectedItemNotifier.value != null &&
          installmentAccounting != null;
    }

    if (_validateButton.value != result) {
      _validateButton.value = result;
    }
  }

  _onChangeText(String? value) {
    accountingModel = null;
    installmentAccounting = null;
    _onValidate();
  }

  onSelectAccount(dynamic result) {
    final data = result as AccountantModel;
    accountingModel = data;
    _accountController.text = data.getName;
    _onValidate();
  }

  onSelectAccountInstallment(dynamic result) {
    final data = result as InstallmentAccountingModel;
    installmentAccounting = data;
    _accountController.text = data.getName;
    _onValidate();
  }

  Future<List<AccountantModel>> getAccountants(String value) async {
    try {
      if (widget.paymentType == PaymentType.cash) {
        return widget.paymentBloc.searchCashAccountant(value: value.trim());
      }
      if (widget.paymentType == PaymentType.credit) {
        return widget.paymentBloc.searchCreditAccountant(value: value.trim());
      }
      if (widget.paymentType == PaymentType.transfer) {
        return widget.paymentBloc.searchTransferAccountant(value: value.trim());
      }
      return [];
    } catch (e) {
      return [];
    }
  }

  Future<List<InstallmentAccountingModel>> getInstallmentAccountants(
      String value) async {
    try {
      return widget.paymentBloc
          .searchInstallmentAccountant(value: value.trim());
    } catch (e) {
      return [];
    }
  }
}
