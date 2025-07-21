import 'package:c_pos/common/extensions/extension.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../common/enum/enum.dart';
import '../../presentation/utils/utils.dart';
import 'base_enum_model.dart';
import 'delivery_fee_model.dart';
import 'employee_model.dart';
import 'order_item.dart';
import 'order_sub_detail_model.dart';
import 'payment_model.dart';
import 'product_model.dart';
import 'store_model.dart';

class OrderModel {
  int? createdBy;
  String? createdByName;
  String? statusName;
  int? billNumber;
  int? totalDeposit;
  double? subtractPointAmount;
  double? totalAmount;
  double? totalAmountFinal;
  String? payCreditFeeTypeName;
  int? customerCity;
  int? customerDistrist;
  int? customerWard;
  String? customerEmail;
  int? customerGender;
  String? customerDOB;
  int? customerPoint;
  XCustomerType? customerType;
  int? customerAppellation;
  String? checkDate;
  String? createdAt;
  int? id;
  int? storeId;
  int? orderSourceId;
  int? saleId;
  String? saleNote;
  String? checkTime;
  int? orderType;
  String? orderTypeName;
  int? status;
  int? cancelStatus;
  int? customerId;
  String? customerName;
  String? customerMobile;
  String? customerAddress;
  String? customerNote;
  int? discountType;
  double? discountAmount;
  double? transferAmount;
  double? depositAmount;
  String? paymentDate;
  double? customerShipFee;
  double? shipFee;
  int? cashAccountId;
  int? transferAccountId;
  String? transferCode;
  int? installMoneyAccountId;
  String? installMoneyCode;
  String? codeShip;
  int? promotionId;
  int? updatedBy;
  int? companyId;
  String? transferReferenceCode;
  double? otherFees;
  String? creditCardNo;
  int? payCreditFeeType;
  String? creditFeeNote;
  int? creditFeeAccountId;
  String? customerTransferNo;
  String? customerBankName;
  double? installedMoneyAmount;
  String? customerIndentifyNo;
  double? creditAmount;
  int? creditAccountId;
  String? creditCode;
  int? insertType;
  String? vatCompanyName;
  String? vatCompanyAddress;
  String? taxCode;
  String? email;
  int? addPoint;
  int? subtractPoint;
  String? couponCode;
  int? preOrderId;
  double? pointAmount;
  int? installmentProgramId;
  String? installmentProgramMonthNo;
  int? loanApplicationId;
  int? installApplicationStatus;
  int? partnerPaymentStatus;
  String? warrantyNote;
  int? jobTitleId;
  int? saleStoreId;
  int? technicalId;
  String? technicalName;
  String? installmentProgramPrepayPercent;
  double? conversionFee;
  String? affiliateCode;
  String? cashAccountName;
  String? creditAccountName;
  String? transferAccountName;
  String? installMoneyAccountName;
  String? installmentProgramName;
  String? orderSourceName;
  String? storeName;
  String? saleName;
  List<OrderItemModel>? orderItems;
  List<PaymentModel>? payments;

  OrderModel({
    this.createdBy,
    this.createdByName,
    this.statusName,
    this.billNumber,
    this.totalDeposit,
    this.subtractPointAmount,
    this.totalAmount,
    this.totalAmountFinal,
    this.payCreditFeeTypeName,
    this.customerCity,
    this.customerDistrist,
    this.customerWard,
    this.customerEmail,
    this.customerGender,
    this.customerDOB,
    this.customerPoint,
    this.customerType,
    this.customerAppellation,
    this.checkDate,
    this.createdAt,
    this.id,
    this.storeId,
    this.orderSourceId,
    this.saleId,
    this.saleNote,
    this.checkTime,
    this.orderType,
    this.orderTypeName,
    this.status,
    this.cancelStatus,
    this.customerId,
    this.customerName,
    this.customerMobile,
    this.customerAddress,
    this.customerNote,
    this.discountType,
    this.discountAmount,
    this.transferAmount,
    this.depositAmount,
    this.paymentDate,
    this.customerShipFee,
    this.shipFee,
    this.cashAccountId,
    this.transferAccountId,
    this.transferCode,
    this.installMoneyAccountId,
    this.installMoneyCode,
    this.codeShip,
    this.promotionId,
    this.updatedBy,
    this.companyId,
    this.transferReferenceCode,
    this.otherFees,
    this.creditCardNo,
    this.payCreditFeeType,
    this.creditFeeNote,
    this.creditFeeAccountId,
    this.customerTransferNo,
    this.customerBankName,
    this.installedMoneyAmount,
    this.customerIndentifyNo,
    this.creditAmount,
    this.creditAccountId,
    this.creditCode,
    this.insertType,
    this.vatCompanyName,
    this.vatCompanyAddress,
    this.taxCode,
    this.email,
    this.addPoint,
    this.subtractPoint,
    this.couponCode,
    this.preOrderId,
    this.pointAmount,
    this.installmentProgramId,
    this.installmentProgramMonthNo,
    this.loanApplicationId,
    this.installApplicationStatus,
    this.partnerPaymentStatus,
    this.warrantyNote,
    this.jobTitleId,
    this.saleStoreId,
    this.technicalId,
    this.technicalName,
    this.installmentProgramPrepayPercent,
    this.conversionFee,
    this.affiliateCode,
    this.cashAccountName,
    this.creditAccountName,
    this.transferAccountName,
    this.installMoneyAccountName,
    this.installmentProgramName,
    this.orderSourceName,
    this.storeName,
    this.saleName,
    this.orderItems,
    this.payments,
  });

  OrderModel.fromJson(Map<String, dynamic> json) {
    createdBy = json['createdBy'];
    createdByName = json['createdByName'];
    statusName = json['statusName'];
    billNumber = json['billNumber'];
    totalDeposit = json['totalDeposit'];
    subtractPointAmount = Utils.toDouble(json['subtractPointAmount']);
    totalAmount = Utils.toDouble(json['totalAmount']);
    totalAmountFinal = Utils.toDouble(json['totalAmountFinal']);
    payCreditFeeTypeName = json['payCreditFeeTypeName'];
    customerCity = json['customerCity'];
    customerDistrist = json['customerDistrist'];
    customerWard = json['customerWard'];
    customerEmail = json['customerEmail'];
    customerGender = json['customerGender'];
    customerDOB = json['customerDOB'];
    customerPoint = json['customerPoint'];
    customerType = (json['customerType'] as int?)?.getCustomerType;
    customerAppellation = json['customerAppellation'];
    checkDate = json['checkDate'];
    createdAt = json['createdAt'];
    id = json['id'];
    storeId = json['storeId'];
    orderSourceId = json['orderSourceId'];
    saleId = json['saleId'];
    saleNote = json['saleNote'];
    checkTime = json['checkTime'];
    orderType = json['orderType'];
    orderTypeName = json['orderTypeName'];
    status = json['status'];
    cancelStatus = json['cancelStatus'];
    customerId = json['customerId'];
    customerName = json['customerName'];
    customerMobile = json['customerMobile'];
    customerAddress = json['customerAddress'];
    customerNote = json['customerNote'];
    discountType = json['discountType'];
    discountAmount = Utils.toDouble(json['discountAmount']);
    transferAmount = Utils.toDouble(json['transferAmount']);
    depositAmount = Utils.toDouble(json['depositAmount']);
    paymentDate = json['paymentDate'];
    customerShipFee = Utils.toDouble(json['customerShipFee']);
    shipFee = Utils.toDouble(json['shipFee']);
    cashAccountId = json['cashAccountId'];
    transferAccountId = json['transferAccountId'];
    transferCode = json['transferCode'];
    installMoneyAccountId = json['installMoneyAccountId'];
    installMoneyCode = json['installMoneyCode'];
    codeShip = json['codeShip'];
    promotionId = json['promotionId'];
    updatedBy = json['updatedBy'];
    companyId = json['companyId'];
    transferReferenceCode = json['transferReferenceCode'];
    otherFees = Utils.toDouble(json['otherFees']);
    creditCardNo = json['creditCardNo'];
    payCreditFeeType = json['payCreditFeeType'];
    creditFeeNote = json['creditFeeNote'];
    creditFeeAccountId = json['creditFeeAcountId'];
    customerTransferNo = json['customerTransferNo'];
    customerBankName = json['customerBankName'];
    installedMoneyAmount = Utils.toDouble(json['installedMoneyAmount']);
    customerIndentifyNo = json['customerIndentifyNo'];
    creditAmount = Utils.toDouble(json['creditAmount']);
    creditAccountId = json['creditAccountId'];
    creditCode = json['creditCode'];
    insertType = json['insertType'];
    vatCompanyName = json['vatCompanyName'];
    vatCompanyAddress = json['vatCompanyAddress'];
    taxCode = json['taxCode'];
    email = json['email'];
    addPoint = json['addPoint'];
    subtractPoint = json['subtractPoint'];
    couponCode = json['couponCode'];
    preOrderId = json['preOrderId'];
    pointAmount = Utils.toDouble(json['pointAmount']);
    installmentProgramId = json['installmentProgramId'];
    installmentProgramMonthNo = json['installmentProgramMonthNo'];
    loanApplicationId = json['loanApplicationId'];
    installApplicationStatus = json['installApplicationStatus'];
    partnerPaymentStatus = json['partnerPaymentStatus'];
    warrantyNote = json['warrantyNote'];
    jobTitleId = json['jobTitleId'];
    saleStoreId = json['saleStoreId'];
    technicalId = json['technicalId'];
    technicalName = json['technicalName'];
    installmentProgramPrepayPercent = json['installmentProgramPrepayPercent'];
    conversionFee = Utils.toDouble(json['conversionFee']);
    affiliateCode = json['affiliateCode'];
    cashAccountName = json['cashAccountName'];
    creditAccountName = json['creditAccountName'];
    transferAccountName = json['transferAccountName'];
    installMoneyAccountName = json['installMoneyAccountName'];
    installmentProgramName = json['installmentProgramName'];
    orderSourceName = json['orderSourceName'];
    storeName = json['storeName'];
    saleName = json['saleName'];
    if (json['orderItems'] != null) {
      orderItems = <OrderItemModel>[];
      json['orderItems'].forEach((v) {
        orderItems!.add(OrderItemModel.fromJson(v));
      });
    }
    if (json['payments'] != null) {
      payments = <PaymentModel>[];
      json['payments'].forEach((v) {
        payments!.add(PaymentModel.fromJson(v));
      });
    }
  }

  List<ProductModel> get products => (orderItems ?? [])
      .map((e) => ProductModel(
            productType: e.productType,
            productName: e.getName,
            imeiNo: e.getImeiNo,
            sellingPrice: e.getSellingPrice,
            discountAmount: e.getDiscountPrice,
            discountPrice: e.getDiscountPrice,
            quantity: e.getQuantity,
          ))
      .toList();

  String get getIdCard => '';

  String get getBillNumber => id?.toString() ?? '';

  String get getCustomerName => customerName ?? '';

  String get getCustomerPhone => customerMobile ?? '';

  String get getSaleNote => saleNote ?? '';

  String get getCustomerNote => customerNote ?? '';

  String get getWarrantyNote => warrantyNote ?? '';

  String get getStoreName => storeName ?? '';

  String get getSaleName => createdByName ?? '';

  String get getCustomerAddress => customerAddress ?? '';

  String get getCustomerBirthDate => '';

  String get getSubtractPoint => (subtractPoint ?? 0).formatNumber;

  String get getCreateDate {
    if (createdAt?.isNullOrEmpty ?? true) return '';

    // Chuỗi thời gian gốc
    String originalDateTime = createdAt!;

    // Định dạng chuỗi thời gian gốc "2025-07-20T07:11:30.000Z"
    DateFormat originalFormat = DateFormat('yyyy-MM-ddTHH:mm:ss.SSS');
    // Định dạng chuỗi thời gian mới
    DateFormat desiredFormat = DateFormat('HH:mm, dd/MM/yyyy');

    // Chuyển đổi chuỗi thời gian gốc thành đối tượng DateTime
    DateTime dateTime = originalFormat.parse(originalDateTime);

    // Chuyển đổi đối tượng DateTime thành chuỗi thời gian mới
    String formattedDateTime = desiredFormat.format(dateTime);

    return formattedDateTime; // Output: 01:12, 20/05/2024
  }

  double get getTotalAmount => totalAmount ?? 0;

  StatusEnum get getOrderStatus => status?.getStatusEnum ?? StatusEnum.none;

  List<PaymentModel> get paymentByCash => (payments ?? [])
      .where((e) => e.paymentType == PaymentTransaction.cash.getValue)
      .toList();

  List<PaymentModel> get paymentByCredit => (payments ?? [])
      .where((e) => e.paymentType == PaymentTransaction.credit.getValue)
      .toList();

  List<PaymentModel> get paymentByTransfer => (payments ?? [])
      .where((e) => e.paymentType == PaymentTransaction.transfer.getValue)
      .toList();

  List<PaymentModel> get paymentByInstallment => (payments ?? [])
      .where((e) => e.paymentType == PaymentTransaction.installment.getValue)
      .toList();

  double get getTotalAmountFinal => totalAmountFinal ?? 0;

  EmployeeModel get getSaleInfo => EmployeeModel(
        id: saleId ?? createdBy,
        fullName: saleName ?? createdByName,
      );

  EmployeeModel get getTechInfo => EmployeeModel(
        id: technicalId,
        fullName: technicalName,
      );

  DeliveryFeeModel get getDeliveryFee {
    return DeliveryFeeModel(
      customerFee: customerShipFee?.toInt() ?? 0,
      shippingCompanyFee: shipFee?.toInt() ?? 0,
    );
  }

  StatusEnum get getOrderStatusEnum =>
      orderSourceId?.getOrderStatus ?? StatusEnum.none;

  OrderSubDetailModel get getOrderSubDetail {
    return OrderSubDetailModel(
      orderSource: BaseEnumModel(
        id: orderSourceId,
        name: orderSourceName,
        // key: '',
        // conditionCancel: -1,
      ),
      orderType: BaseEnumModel(
        id: orderType,
        name: orderTypeName,
        // key: '',
        // conditionCancel: -1,
      ),
      orderStatus: BaseEnumModel(
        id: status,
        name: statusName,
        // key: '',
        // conditionCancel: -1,
      ),
      dateComeToShop: getDateTimeToStore,
      datePayFor: paymentDate?.toTypeDateTime(
        currentFormat: XDateTimeEnum.dayMonthYear,
        newFormat: XDateTimeEnum.dayMonthYear,
      ),
      timeComToShop: getTimeComeToShop,
      shipCode: codeShip,
    );
  }

  DateTime? get getDateTimeToStore {
    if (checkDate == null) {
      return null;
    }
    if (Utils.isValidFormatDateTime(
        checkDate!, XDateTimeEnum.dayMonthYear.getValue)) {
      return checkDate?.toTypeDateTime(
          currentFormat: XDateTimeEnum.dayMonthYear,
          newFormat: XDateTimeEnum.dayMonthYear);
    }

    if (Utils.isValidFormatDateTime(
        checkDate!, XDateTimeEnum.defaultDateTimeBasic.getValue)) {
      return checkDate?.toTypeDateTime(
          currentFormat: XDateTimeEnum.defaultDateTimeBasic,
          newFormat: XDateTimeEnum.dayMonthYear);
    }

    return null;
  }

  TimeOfDay get getTimeComeToShop {
    DateTime current =
        checkTime.isNullOrEmpty ? DateTime.now() : checkTime!.convertToDateTime;
    return TimeOfDay(hour: current.hour, minute: current.minute);
  }

  StoreModel get getStore => StoreModel(
        id: storeId,
        name: storeName,
      );
}
