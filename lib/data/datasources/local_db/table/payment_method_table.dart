import 'dart:convert';

import 'package:isar/isar.dart';

import '../../../../common/enum/enum.dart';
import '../../../models/accountant_model.dart';
import '../../../models/installment_accounting_model.dart';

part 'payment_method_table.g.dart';

@Collection()
class PaymentMethodTable {
  Id id = Isar.autoIncrement;

  /// loại thanh toán
  @Enumerated(EnumType.ordinal)
  late PaymentType paymentType;

  /// loại trả góp
  @Enumerated(EnumType.ordinal)
  late MethodDeposit methodDeposit;

  /// id của mỗi item
  int? paymentId;

  /// thông tin tài khoản thanh toán
  String? transactionDetailJson;

  @ignore
  AccountantModel? get accountDetail => transactionDetailJson != null
      ? AccountantModel().toModel(transactionDetailJson!)
      : null;

  set accountDetail(AccountantModel? value) {
    transactionDetailJson = value?.toString();
  }

  String? installmentMethodJson;

  @ignore
  InstallmentAccountingModel? get installmentMethod =>
      installmentMethodJson != null
          ? InstallmentAccountingModel().toModel(installmentMethodJson!)
          : null;

  set installmentMethod(InstallmentAccountingModel? value) {
    installmentMethodJson = value != null ? jsonEncode(value.toJson()) : null;
  }

  /// mã tham chiếu
  String? refCode;

  /// mã hợp đồng
  String? conditionNumber;

  /// số cuối của thẻ
  String? cardNumber;

  /// CMND/CCCD
  String? idCard;

  /// số tiền thanh toán
  double? amount;
}

extension PaymentMethodTableExtension on PaymentMethodTable {
  Map<String, dynamic> formatTransactionPayment() {
    Map<String, dynamic> data = <String, dynamic>{};

    data['paymentRefId'] = accountDetail?.id;
    data['paymentRefCode'] = accountDetail?.code;
    data['paymentName'] = accountDetail?.name;
    data['paymentAmount'] = amount;
    data['isPaymentByQr'] = true;
    data['paymentType'] = paymentType.getValue;

    if (paymentType == PaymentType.transfer) {
      data['paymentCode'] = refCode;
    }

    if (paymentType == PaymentType.credit) {
      data['creditCardNo'] = cardNumber;
      data['payCreditFeeType'] = null;
      data['creditCardFee'] = null;
      data['creditFeeAccountantName'] = null;
    }

    return data;
  }

  Map<String, dynamic> formatDepositPayment() {
    Map<String, dynamic> data = <String, dynamic>{};

    data['paymentRefId'] = installmentMethod?.id;
    data['paymentRefCode'] = installmentMethod?.code;
    data['paymentName'] = installmentMethod?.name;
    data['paymentAmount'] = amount;
    data['isPaymentByQr'] = false;
    data['paymentType'] = paymentType.getValue;
    data['paymentCode'] = conditionNumber;
    data['customerIndentifyNo'] = idCard;

    return data;
  }

  /// kiểm tra thông tin thanh toán đã đủ hay chưa
  bool get checkProductEnoughInformation => true;
}
