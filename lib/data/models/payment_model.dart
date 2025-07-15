import 'package:c_pos/common/extensions/extension.dart';

import '../../common/enum/enum.dart';
import '../../presentation/utils/utils.dart';
import 'accountant_model.dart';
import 'installment_accounting_model.dart';

class PaymentModel {
  int? id;
  String? paymentName;
  int? paymentRefId;
  String? paymentRefCode;
  double? paymentAmount;
  int? paymentType;
  String? entityRefId;
  int? entityRefType;
  String? creditCardNo;
  String? customerIndentifyNo;
  String? paymentCode;
  int? status;

  // int? status;
  // int? viaQRCode;
  String? createdAt;
  String? updatedAt;

  // int? deleted;

  // Null? paymentOptionType;
  // Null? parentId;
  // Null? pendingTransactionId;
  // Null? pendingTransactionStatus;
  // Null? child;

  PaymentModel({
    this.id,
    this.paymentName,
    this.paymentRefId,
    this.paymentRefCode,
    this.paymentAmount,
    this.paymentType,
    this.entityRefId,
    this.entityRefType,
    this.creditCardNo,
    this.customerIndentifyNo,
    this.paymentCode,
    this.status,
    // this.viaQRCode,
    this.createdAt,
    this.updatedAt,
    // this.deleted,
    // this.paymentOptionType,
    // this.parentId,
    // this.pendingTransactionId,
    // this.pendingTransactionStatus,
    // this.child,
  });

  PaymentModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    paymentName = json['paymentName'];
    paymentRefId = json['paymentRefId'];
    paymentRefCode = json['paymentRefCode'];
    paymentAmount = Utils.toDouble(json['paymentAmount']);
    paymentType = json['paymentType'];
    entityRefId = json['entityRefId'];
    entityRefType = json['entityRefType'];
    creditCardNo = json['creditCardNo'];
    customerIndentifyNo = json['customerIndentifyNo'];
    paymentCode = json['paymentCode'];
    status = json['status'];
    // viaQRCode = json['viaQRCode'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    // deleted = json['deleted'];
    // paymentOptionType = json['paymentOptionType'];
    // parentId = json['parentId'];
    // pendingTransactionId = json['pendingTransactionId'];
    // pendingTransactionStatus = json['pendingTransactionStatus'];
    // child = json['child'];
  }

  double get getPaymentAmount => paymentAmount ?? 0;

  String get getPaymentName => paymentName ?? '';

  String get getAmount => (paymentAmount ?? 0).formatCurrency;

  PaymentType get getPaymentType =>
      paymentType?.getPaymentType ?? PaymentType.cash;

  MethodDeposit get getMethodDeposit => MethodDeposit.none;

  // todo: check với phần cập nhật bill
  AccountantModel get getAccountDetail => AccountantModel(
        id: paymentRefId?.toString(),
        type: paymentType,
        code: paymentRefCode,
        name: paymentName,
        // parentId: ,
        // level: ,
        // accountBankNo: ,
        // accountGateWay: ,
        // status: ,
        // createdBy: '',
        // deleted: '',
        // subAccount: '',
      );

  InstallmentAccountingModel get getInstallmentAccountingDetail =>
      InstallmentAccountingModel(
        id: paymentRefId?.toString(),
        name: paymentName,
        code: paymentRefCode,
        // phone: ,
        // address: ,
        // createdBy: ,
        // deleted: ,
        // createdAt: ,
        // updatedAt: ,
      );
}
