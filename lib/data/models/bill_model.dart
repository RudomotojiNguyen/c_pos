import 'package:intl/intl.dart';
import 'package:c_pos/common/extensions/extension.dart';

import '../../common/enum/enum.dart';
import '../../presentation/utils/utils.dart';
import 'bill_item_model.dart';
import 'customer_model.dart';
import 'customer_type_model.dart';
import 'employee_model.dart';
import 'payment_model.dart';
import 'product_model.dart';

class BillModel {
  String? id;
  int? billNumber;
  int? storeId;
  int? relatedStoreId;
  int? providerId;
  int? orderSourceId;
  int? saleId;
  String? saleName;
  String? saleNote;
  int? technicalId;
  String? technicalName;
  int? cashierId;
  String? cashierName;
  int? status;
  int? customerId;
  String? customerName;
  String? customerMobile;
  String? customerAddress;
  String? customerNote;
  int? discountType;
  double? discountAmount;
  double? creditAmount;
  int? creditAccountId;
  String? creditCode;
  int? cashAmount;
  int? cashAccountID;
  int? transferAmount;
  int? transferAccountId;
  String? transferCode;
  String? customerTransferNo;
  String? customerBankName;
  double? installedMoneyAmount;
  int? installMoneyAccountId;
  String? installMoneyCode;
  String? customerIndentifyNo;
  double? totalAmount;
  double? customerShipFee;
  double? shipFee;
  double? returnFee;
  int? orderId;
  String? relatedBillId;
  int? relatedUserID;
  BillType? type;
  dynamic mode;
  String? createdAt;
  dynamic saleBonus;
  int? promotionId;
  String? vatCompanyName;
  String? taxCode;
  String? contractCode;
  String? contractSigningDate;
  String? warrantyNote;
  int? createdBy;
  int? updatedBy;
  int? warrantyCustomerId;
  String? warrantyCustomerName;
  String? warrantyCustomerPhone;
  String? vatCompanyAddress;
  int? addPoint;
  int? subtractPoint;
  double? pointAmount;
  bool? isSubtractPointValidated;
  bool? isReCreateBillDone;
  String? transferReferenceCode;
  double? otherFees;
  String? creditCardNo;
  int? payCreditFeeType;
  String? creditFeeNote;
  int? creditFeeAccountId;
  int? companyId;
  String? cashAccountCode;
  String? transferAccountCode;
  String? creditAccountCode;
  String? creditFeeAccountCode;
  String? installMoneyAccountCode;
  int? customerReceptionId;
  int? managerId;
  int? assistantId;
  int? accessoryStaffId;
  String? couponCode;
  bool? isCountPoint;
  String? email;
  int? deviceType;
  String? codeShip;
  int? shipperId;
  int? installmentProgramId;
  String? installmentProgramMonthNo;
  bool? isInterestZero;
  bool? isOnTransfer;
  int? warrantyErrorBy;
  double? installmentProgramPrepayPercent;
  double? conversionFee;
  String? verifyRevenueDate;
  int? installmentConfirmedBy;
  String? customerEmail;
  int? customerCity;
  int? customerDistrict;
  int? customerWard;
  int? customerGender;
  String? customerDOB;
  CustomerModel? customer;
  String? orderSourceName;
  int? moneyUsePoint;
  CustomerTypeModel? customerType;
  String? storeName;
  List<BillItemModel>? billItems;
  List<PaymentModel>? payments;
  bool? editable;
  OrderResourceModel? order;
  BillModel({
    this.id,
    this.billNumber,
    this.storeId,
    this.relatedStoreId,
    this.providerId,
    this.orderSourceId,
    this.saleId,
    this.saleName,
    this.saleNote,
    this.technicalId,
    this.technicalName,
    this.cashierId,
    this.cashierName,
    this.status,
    this.customerId,
    this.customerName,
    this.customerMobile,
    this.customerAddress,
    this.customerNote,
    this.discountType,
    this.discountAmount,
    this.creditAmount,
    this.creditAccountId,
    this.creditCode,
    this.cashAmount,
    this.cashAccountID,
    this.transferAmount,
    this.transferAccountId,
    this.transferCode,
    this.customerTransferNo,
    this.customerBankName,
    this.installedMoneyAmount,
    this.installMoneyAccountId,
    this.installMoneyCode,
    this.customerIndentifyNo,
    this.totalAmount,
    this.customerShipFee,
    this.shipFee,
    this.returnFee,
    this.orderId,
    this.relatedBillId,
    this.relatedUserID,
    this.type,
    this.mode,
    this.createdAt,
    this.saleBonus,
    this.promotionId,
    this.vatCompanyName,
    this.taxCode,
    this.contractCode,
    this.contractSigningDate,
    this.warrantyNote,
    this.createdBy,
    this.updatedBy,
    this.warrantyCustomerId,
    this.warrantyCustomerName,
    this.warrantyCustomerPhone,
    this.vatCompanyAddress,
    this.addPoint,
    this.subtractPoint,
    this.pointAmount,
    this.isSubtractPointValidated,
    this.isReCreateBillDone,
    this.transferReferenceCode,
    this.otherFees,
    this.creditCardNo,
    this.payCreditFeeType,
    this.creditFeeNote,
    this.creditFeeAccountId,
    this.companyId,
    this.cashAccountCode,
    this.transferAccountCode,
    this.creditAccountCode,
    this.creditFeeAccountCode,
    this.installMoneyAccountCode,
    this.customerReceptionId,
    this.managerId,
    this.assistantId,
    this.accessoryStaffId,
    this.couponCode,
    this.isCountPoint,
    this.email,
    this.deviceType,
    this.codeShip,
    this.shipperId,
    this.installmentProgramId,
    this.installmentProgramMonthNo,
    this.isInterestZero,
    this.isOnTransfer,
    this.warrantyErrorBy,
    this.installmentProgramPrepayPercent,
    this.conversionFee,
    this.verifyRevenueDate,
    this.installmentConfirmedBy,
    this.customerEmail,
    this.customerCity,
    this.customerDistrict,
    this.customerWard,
    this.customerGender,
    this.customerDOB,
    this.customer,
    this.orderSourceName,
    this.moneyUsePoint,
    this.customerType,
    this.storeName,
    this.billItems,
    this.payments,
    this.editable,
    this.order,
  });

  BillModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    billNumber = json['billNumber'];
    storeId = json['storeId'];
    relatedStoreId = json['relatedStoreId'];
    providerId = json['providerId'];
    orderSourceId = json['orderSourceId'];
    saleId = json['saleId'];
    saleName = json['saleName'];
    saleNote = json['saleNote'];
    technicalId = json['technicalId'];
    technicalName = json['technicalName'];
    cashierId = json['cashierId'];
    cashierName = json['cashierName'];
    status = json['status'];
    customerId = json['customerId'];
    customerName = json['customerName'];
    customerMobile = json['customerMobile'];
    customerAddress = json['customerAddress'];
    customerNote = json['customerNote'];
    discountType = json['discountType'];
    discountAmount = Utils.toDouble(json['discountAmount']);
    creditAmount = Utils.toDouble(json['creditAmount']);
    creditAccountId = json['creditAccountId'];
    creditCode = json['creditCode'];
    cashAmount = json['cashAmount'];
    cashAccountID = json['cashAccountID'];
    transferAmount = json['transferAmount'];
    transferAccountId = json['transferAccountId'];
    transferCode = json['transferCode'];
    customerTransferNo = json['customerTransferNo'];
    customerBankName = json['customerBankName'];
    installedMoneyAmount = Utils.toDouble(json['installedMoneyAmount']);
    installMoneyAccountId = json['installMoneyAccountId'];
    installMoneyCode = json['installMoneyCode'];
    customerIndentifyNo = json['customerIndentifyNo'];
    totalAmount = Utils.toDouble(json['totalAmount']);
    customerShipFee = Utils.toDouble(json['customerShipFee']);
    shipFee = Utils.toDouble(json['shipFee']);
    returnFee = Utils.toDouble(json['returnFee']);
    orderId = json['orderId'];
    relatedBillId = json['relatedBillId'];
    relatedUserID = json['relatedUserID'];
    type = (json['type'] as int?)?.getBillType ?? BillType.undefine;
    mode = json['mode'];
    createdAt = json['createdAt'];
    saleBonus = json['saleBonus'];
    promotionId = json['promotionId'];
    vatCompanyName = json['vatCompanyName'];
    taxCode = json['taxCode'];
    contractCode = json['contractCode'];
    contractSigningDate = json['contractSigningDate'];
    warrantyNote = json['warrantyNote'];
    createdBy = json['createdBy'];
    updatedBy = json['updatedBy'];
    warrantyCustomerId = json['warrantyCustomerId'];
    warrantyCustomerName = json['warrantyCustomerName'];
    warrantyCustomerPhone = json['warrantyCustomerPhone'];
    vatCompanyAddress = json['vatCompanyAddress'];
    addPoint = json['addPoint'];
    subtractPoint = json['subtractPoint'];
    pointAmount = Utils.toDouble(json['pointAmount']);
    isSubtractPointValidated = json['isSubtractPointValidated'];
    isReCreateBillDone = json['isReCreateBillDone'];
    transferReferenceCode = json['transferReferenceCode'];
    otherFees = Utils.toDouble(json['otherFees']);
    creditCardNo = json['creditCardNo'];
    payCreditFeeType = json['payCreditFeeType'];
    creditFeeNote = json['creditFeeNote'];
    creditFeeAccountId = json['creditFeeAcountId'];
    companyId = json['companyId'];
    cashAccountCode = json['cashAccountCode'];
    transferAccountCode = json['transferAccountCode'];
    creditAccountCode = json['creditAccountCode'];
    creditFeeAccountCode = json['creditFeeAcountCode'];
    installMoneyAccountCode = json['installMoneyAccountCode'];
    customerReceptionId = json['customerReceptionId'];
    managerId = json['managerId'];
    assistantId = json['assistantId'];
    accessoryStaffId = json['accessoryStaffId'];
    couponCode = json['couponCode'];
    isCountPoint = json['isCountPoint'];
    email = json['email'];
    deviceType = json['deviceType'];
    codeShip = json['codeShip'];
    shipperId = json['shipperId'];
    installmentProgramId = json['installmentProgramId'];
    installmentProgramMonthNo = json['installmentProgramMonthNo']?.toString();
    isInterestZero = json['isInterestZero'];
    isOnTransfer = json['isOnTransfer'];
    warrantyErrorBy = json['warrantyErrorBy'];
    installmentProgramPrepayPercent =
        Utils.toDouble(json['installmentProgramPrepayPercent']);
    conversionFee = Utils.toDouble(json['conversionFee']);
    verifyRevenueDate = json['verifyRevenueDate'];
    installmentConfirmedBy = json['installmentConfirmedBy'];
    customerEmail = json['customerEmail'];
    customerCity = json['customerCity'];
    customerDistrict = json['customerDistrist'];
    customerWard = json['customerWard'];
    customerGender = json['customerGender'];
    customerDOB = json['customerDOB'];
    customer = json['Customer'] != null
        ? CustomerModel.fromJson(json['Customer'])
        : null;
    orderSourceName = json['orderSourceName'];
    moneyUsePoint = json['moneyUsePoint'];
    customerType = json['customerType'] != null
        ? CustomerTypeModel.fromJson(json['customerType'])
        : null;
    storeName = json['storeName'];
    if (json['billItems'] != null) {
      billItems = <BillItemModel>[];
      json['billItems'].forEach((v) {
        billItems!.add(BillItemModel.fromJson(v));
      });
    }
    if (json['payments'] != null) {
      payments = <PaymentModel>[];
      json['payments'].forEach((v) {
        payments!.add(PaymentModel.fromJson(v));
      });
    }
    editable = json['editable'];
    order = json['order'] != null
        ? OrderResourceModel.fromJson(json['order'])
        : null;
  }

  String get getBillNumber => billNumber?.toString() ?? '';

  String get getCustomerName => customerName ?? '';

  String get getCustomerPhone => customerMobile ?? '';

  String get getCreateDate {
    if (createdAt.isNullOrEmpty) return '';

    // Chuỗi thời gian gốc
    String originalDateTime = createdAt!;

    // Định dạng chuỗi thời gian gốc
    DateFormat originalFormat = DateFormat('yyyy-MM-dd HH:mm:ss');
    // Định dạng chuỗi thời gian mới
    DateFormat desiredFormat = DateFormat('HH:mm, dd/MM/yyyy');

    // Chuyển đổi chuỗi thời gian gốc thành đối tượng DateTime
    DateTime dateTime = originalFormat.parse(originalDateTime);

    // Chuyển đổi đối tượng DateTime thành chuỗi thời gian mới
    String formattedDateTime = desiredFormat.format(dateTime);

    return formattedDateTime; // Output: 01:12, 20/05/2024
  }

  double get getTotalAmount => totalAmount ?? 0;

  String get getBillId => id?.toString() ?? '';

  double get getTotalAmountFinal => totalAmount ?? 0;

  String get getCustomerRankName => customerType?.name ?? '';

  int get getOrderId => orderId ?? 0;

  String get getStoreName => storeName ?? '';

  String get getSaleName => saleName ?? '';

  String get getCashierName => cashierName ?? '';

  String get getTechName => technicalName ?? '';

  int get getSubtractPoint => subtractPoint ?? 0;

  String get getCustomerAddress => customerAddress ?? '';

  String get getCustomerDOB => customerDOB ?? '';

  List<ProductModel> get products => (billItems ?? []).map((e) {
        return ProductModel(
          id: e.productId,
          productType: e.productType,
          productName: e.getName,
          imeiNo: e.getImeiNo,
          sellingPrice: e.getSellingPrice,
          discountAmount: e.getDiscountPrice,
          discountPrice: e.getDiscountPrice,
          quantity: e.getQuantity,
          externalImeiNo: e.externalImeiNo,
          warrantyMonthNo: e.warrantyMonthNo,
          warrantyAddress: e.warrantyAddress,
          warrantyPhone: e.warrantyPhone,
          warrantyDescription: e.warrantyDescription,
          gifts: e.gifts?.map((e) => e.toProductModel()).toList(),
          attachs: e.attaches?.map((e) => e.toProductModel()).toList(),
          barCode: e.barCode,
        );
      }).toList();

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

  String get getSaleNote => saleNote ?? '';

  String get getCustomerNote => customerNote ?? '';

  String get getWarrantyNote => warrantyNote ?? '';

  bool get checkCanEditBill => editable ?? false;

  EmployeeModel get getSaleInfo => EmployeeModel(
        id: saleId ?? createdBy,
        fullName: saleName,
      );

  EmployeeModel get getTechInfo => EmployeeModel(
        id: technicalId,
        fullName: technicalName,
      );

  // CustomerTable get getCustomerInfo => CustomerTable()
  //   ..customerId = customerId
  //   ..fullName = customerName
  //   ..phoneNo = getCustomerPhone
  //   ..email = customerEmail
  //   ..dateOfBirth = customerDOB
  //   ..city = customerCity
  //   ..district = customerDistrict
  //   ..ward = customerWard
  //   ..address = customerAddress
  //   ..type = customerType?.id
  //   ..indentifyNo = customerIndentifyNo
  //   ..gender = customerGender?.getGender ?? XGenderType.other
  //   ..appellation = customerGender?.getGender ?? XGenderType.other;

  String get customerRankName => customerType?.name ?? '';

  double get getTotalPriceNoneDiscount => (billItems ?? []).fold(0,
      (previousValue, element) => previousValue + element.calculateTotalPrice);

  double get getTotalDiscountPriceOfBillItem => (billItems ?? []).fold(
      0, (previousValue, element) => previousValue + element.getDiscountPrice);

  double get calculateDiscountOfBill => discountAmount ?? 0;

  double get calculateDiscountOfPoint => pointAmount ?? 0;

  double get calculateTotalPrePayment {
    if (order == null) return 0;

    return order!.totalDeposit ?? 0;
  }

  double get calculateFinalPrice =>
      getTotalPriceNoneDiscount -
      getTotalDiscountPriceOfBillItem -
      calculateDiscountOfBill -
      calculateDiscountOfPoint -
      calculateTotalPrePayment;
}

class OrderResourceModel {
  int? id;
  double? installedMoneyAmount;
  String? customerIndentifyNo;
  double? creditAmount;
  String? creditAccountId;
  String? creditCode;
  double? transferAmount;
  double? depositAmount;
  String? cashAccountId;
  String? transferAccountId;
  String? installMoneyAccountId;
  String? customerName;
  String? customerMobile;
  String? cashAccountName;
  String? creditAccountName;
  String? transferAccountName;
  String? installMoneyAccountName;
  double? totalDeposit;

  OrderResourceModel(
      {this.id,
      this.installedMoneyAmount,
      this.customerIndentifyNo,
      this.creditAmount,
      this.creditAccountId,
      this.creditCode,
      this.transferAmount,
      this.depositAmount,
      this.cashAccountId,
      this.transferAccountId,
      this.installMoneyAccountId,
      this.customerName,
      this.customerMobile,
      this.cashAccountName,
      this.creditAccountName,
      this.transferAccountName,
      this.installMoneyAccountName,
      this.totalDeposit});

  OrderResourceModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    installedMoneyAmount = json['installedMoneyAmount']?.toDouble();
    customerIndentifyNo = json['customerIndentifyNo'];
    creditAmount = json['creditAmount']?.toDouble();
    creditAccountId = json['creditAccountId'];
    creditCode = json['creditCode'];
    transferAmount = json['transferAmount']?.toDouble();
    depositAmount = json['depositAmount']?.toDouble();
    cashAccountId = json['cashAccountId'];
    transferAccountId = json['transferAccountId'];
    installMoneyAccountId = json['installMoneyAccountId'];
    customerName = json['customerName'];
    customerMobile = json['customerMobile'];
    cashAccountName = json['cashAccountName'];
    creditAccountName = json['creditAccountName'];
    transferAccountName = json['transferAccountName'];
    installMoneyAccountName = json['installMoneyAccountName'];
    totalDeposit = json['totalDeposit']?.toDouble();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['installedMoneyAmount'] = installedMoneyAmount;
    data['customerIndentifyNo'] = customerIndentifyNo;
    data['creditAmount'] = creditAmount;
    data['creditAccountId'] = creditAccountId;
    data['creditCode'] = creditCode;
    data['transferAmount'] = transferAmount;
    data['depositAmount'] = depositAmount;
    data['cashAccountId'] = cashAccountId;
    data['transferAccountId'] = transferAccountId;
    data['installMoneyAccountId'] = installMoneyAccountId;
    data['customerName'] = customerName;
    data['customerMobile'] = customerMobile;
    data['cashAccountName'] = cashAccountName;
    data['creditAccountName'] = creditAccountName;
    data['transferAccountName'] = transferAccountName;
    data['installMoneyAccountName'] = installMoneyAccountName;
    data['totalDeposit'] = totalDeposit;
    return data;
  }
}
