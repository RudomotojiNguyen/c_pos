import 'package:c_pos/common/extensions/extension.dart';

import '../../common/enum/enum.dart';
import '../../presentation/utils/utils.dart';
import '../datasources/local_db/local_db.dart';
import 'bill_item_model.dart';
import 'employee_model.dart';
import 'employee_sub_detail_model.dart';
import 'payment_model.dart';
import 'product_model.dart';
import 'store_model.dart';

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
  String? managerName;
  int? assistantId;
  String? assistantName;
  int? accessoryStaffId;
  String? accessoryStaffName;
  String? couponCode;
  bool? isCountPoint;
  String? email;
  int? deviceType;
  String? codeShip;
  int? shipperId;
  String? shipperName;
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
  String? customerCity;
  String? customerDistrict;
  String? customerWard;
  String? customerDOB;
  String? orderSourceName;
  int? moneyUsePoint;
  String? storeName;
  List<BillItemModel>? billItems;
  List<PaymentModel>? payments;
  bool? editable;
  OrderResourceModel? order;
  int? customerAppellation;

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
    this.managerName,
    this.assistantName,
    this.accessoryStaffName,
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
    this.customerDOB,
    this.orderSourceName,
    this.moneyUsePoint,
    this.storeName,
    this.billItems,
    this.payments,
    this.editable,
    this.order,
    this.customerAppellation,
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
    technicalName = json['technicalName'] ?? json['techName'];
    cashierId = json['cashierId'];
    cashierName = json['cashierName'];
    status = json['status'];
    customerId = json['customerId'];
    customerName = json['customerName'];
    customerMobile = json['customerPhone'] ?? json['customerMobile'];
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
    managerName = json['managerName'];
    assistantId = json['assistantId'];
    assistantName = json['assistantName'];
    accessoryStaffId = json['accessoryStaffId'];
    accessoryStaffName = json['accessoryStaffName'];
    couponCode = json['couponCode'];
    isCountPoint = json['isCountPoint'];
    email = json['email'];
    deviceType = json['deviceType'];
    codeShip = json['codeShip'];
    shipperId = json['shipperId'];
    shipperName = json['shipperName'];
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
    customerCity = json['customerCity']?.toString();
    customerDistrict = json['customerDistrist']?.toString();
    customerWard = json['customerWard']?.toString();
    customerDOB = json['customerDOB']?.toString();
    orderSourceName = json['orderSourceName']?.toString();
    moneyUsePoint = json['moneyUsePoint'];
    storeName = json['storeName'];
    if (json['billItems'] != null) {
      List<BillItemModel> data = <BillItemModel>[];
      json['billItems'].forEach((v) {
        data.add(BillItemModel.fromJson(v));
      });

      ///
      billItems = formatProducts(data);
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
    customerAppellation = json['customerAppellation'];
  }

  EmployeeSubDetailModel get getSubEmployeeInfo => EmployeeSubDetailModel(
        employee: EmployeeModel(
          id: saleId,
          fullName: saleName,
        ),
        technical: EmployeeModel(
          id: technicalId,
          fullName: technicalName,
        ),
        cashier: EmployeeModel(
          id: cashierId,
          fullName: cashierName,
        ),
        manager: EmployeeModel(
          id: managerId,
          fullName: managerName,
        ),
        assistant: EmployeeModel(
          id: assistantId,
          fullName: assistantName,
        ),
        delivery: EmployeeModel(
          id: shipperId,
          fullName: shipperName,
        ),
        cdpk: EmployeeModel(
          id: accessoryStaffId,
          fullName: accessoryStaffName,
        ),
        receptionist: EmployeeModel(
          id: assistantId,
          fullName: assistantName,
        ),
      );

  String get getBillNumber => billNumber?.toString() ?? '';

  String get getCustomerName => customerName ?? '';

  String get getCustomerPhone => customerMobile ?? '';

  String get getCreateDate => createdAt ?? '';

  double get getTotalAmount => totalAmount ?? 0;

  String get getBillId => id?.toString() ?? '';

  double get getTotalAmountFinal => totalAmount ?? 0;

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
          productType: e.isCombo ? ProductType.combo : e.productType,
          productName: e.getName,
          imeiNo: e.getImeiNo,
          listedPrice: e.listedPrice,
          sellingPrice: e.getSellingPrice,
          discountAmount: e.getDiscountPrice,
          discountPrice: e.getDiscountPrice,
          discountType: e.discountType,
          quantity: e.getQuantity,
          warrantyMonthNo: e.warrantyMonthNo,
          warrantyAddress: e.warrantyAddress,
          warrantyPhone: e.warrantyPhone,
          warrantyDescription: e.warrantyDescription,
          gifts: e.gifts?.map((e) => e.toProductModel()).toList(),
          attachs: e.attaches?.map((e) => e.toProductModel()).toList(),
          barCode: e.barCode,
          productsCombo:
              e.listProductInCombo?.map((e) => e.toProductModel()).toList(),
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

  CustomerTable get getCustomerInfo => CustomerTable()
    ..customerId = customerId
    ..fullName = customerName
    ..phoneNo = getCustomerPhone
    ..email = customerEmail
    ..dateOfBirth = customerDOB
    // ..city = customerCity
    // ..district = customerDistrict
    // ..ward = customerWard
    ..address = customerAddress
    ..indentifyNo = customerIndentifyNo
    ..gender = customerAppellation?.getGender ?? XGenderType.other
    ..appellation = customerAppellation?.getGender ?? XGenderType.other;

  /// tính lại giá tiền chưa giảm giá của bill item
  double get getTotalPriceNoneDiscount {
    double totalPrice = 0;

    for (var item in billItems ?? []) {
      if (item.isCombo) {
        for (var product in item.listProductInCombo ?? []) {
          totalPrice += product.calculateTotalPrice;
        }
      } else {
        totalPrice += item.calculateTotalPrice;
      }
    }

    return totalPrice;
  }

  /// tính lại giảm giá của bill item
  double get getTotalDiscountPriceOfBillItem {
    double totalDiscount = 0;
    for (var item in billItems ?? []) {
      if (item.isCombo) {
        for (var product in item.listProductInCombo ?? []) {
          totalDiscount += product.calculateDiscountPrice;
        }
      } else {
        totalDiscount += item.calculateDiscountPrice;
      }
    }
    return totalDiscount;
  }

  /// tính lại giảm giá của bill
  double get calculateDiscountOfBill {
    double totalDiscount = 0;

    if (discountType == XDiscountType.amount.value) {
      totalDiscount += discountAmount ?? 0;
    }
    if (discountType == XDiscountType.percent.value) {
      totalDiscount +=
          (getTotalPriceNoneDiscount * (discountAmount ?? 0) / 100);
    }
    return totalDiscount;
  }

  /// tính lại giảm giá của điểm
  double get calculateDiscountOfPoint => pointAmount ?? 0;

  /// tính lại giảm giá của thanh toán trước
  double get calculateTotalPrePayment {
    if (order == null) return 0;

    return order!.totalDeposit ?? 0;
  }

  /// tính lại giá tiền cuối cùng của bill
  double get calculateFinalPrice =>
      getTotalPriceNoneDiscount -
      getTotalDiscountPriceOfBillItem -
      calculateDiscountOfBill -
      calculateDiscountOfPoint -
      calculateTotalPrePayment;

  StoreModel get getStore => StoreModel(
        id: storeId,
        name: storeName,
      );

  /// todo: xem lại format sản phẩm combo
  ///
  ///

  List<BillItemModel> formatProducts(List<BillItemModel> billItems) {
    /// key là BillItemModel id
    /// value là BillItemModel
    // 1. Tạo một Map để dễ dàng tìm kiếm sản phẩm chính bằng ID
    final Map<String, BillItemModel> parentMap = {};

    // 2. Gom các sản phẩm có cùng flexibleComboId
    final Map<String, List<BillItemModel>> comboGroups = {};
    final List<BillItemModel> nonComboItems = [];

    for (var item in billItems) {
      if (item.flexibleComboId.isNotNullOrEmpty) {
        // Sản phẩm thuộc combo
        final comboId = item.flexibleComboId!;
        comboGroups[comboId] ??= [];
        comboGroups[comboId]!.add(item);
      } else {
        // Sản phẩm không thuộc combo
        nonComboItems.add(item);
      }
    }

    // 3. Tạo BillItemModel cho mỗi combo
    for (var comboEntry in comboGroups.entries) {
      final comboId = comboEntry.key;
      final comboItems = comboEntry.value;

      if (comboItems.isNotEmpty) {
        // Lấy thông tin combo từ item đầu tiên
        final firstItem = comboItems.first;

        /// tạo product model cho combo
        final comboProduct = BillItemModel(
          id: comboId,
          productType: ProductType.combo,
          productId: comboId,
          barCode: firstItem.barCode,
          productName: firstItem.flexibleComboName,
          productNameVat: firstItem.productNameVat,
          productNote: firstItem.productNote,
          warrantyMonthNo: firstItem.warrantyMonthNo,
          productVatAmount: firstItem.productVatAmount,
          quantity: 1,
          listProductInCombo: comboItems,
          flexibleComboId: comboId,
          flexibleComboName: firstItem.flexibleComboName,
          flexibleComboItemId: firstItem.flexibleComboItemId,
          warrantyReasonName: firstItem.warrantyReasonName,
          newProductId: firstItem.newProductId,
          newProductName: firstItem.newProductName,
          newProductCode: firstItem.newProductCode,
          newQuantity: firstItem.newQuantity,
          newProductPrice: firstItem.newProductPrice,
          newProductType: firstItem.newProductType,
          newTotalPrice: firstItem.newTotalPrice,
          newImeiCode: firstItem.newImeiCode,
          isLostProduct: firstItem.isLostProduct,
          voucherId: firstItem.voucherId,
          voucherDetailId: firstItem.voucherDetailId,
          voucherCode: firstItem.voucherCode,
          accessoryGroupId: firstItem.accessoryGroupId,
          accessoryGroupCode: firstItem.accessoryGroupCode,
          repurchasePrice: firstItem.repurchasePrice,
          belongBillDetailId: firstItem.belongBillDetailId,
          note: firstItem.note,
          listAccessoryPromotion: firstItem.listAccessoryPromotion,
          listProductPromotion: firstItem.listProductPromotion,
        );

        parentMap[comboId] = comboProduct;
      }
    }

    // 4. Thêm các sản phẩm không thuộc combo vào parentMap
    for (var item in nonComboItems) {
      String key = item.id ?? '';
      if (item.belongBillDetailId.isNullOrEmpty) {
        // Đây là sản phẩm chính (parent)
        parentMap[key] = item;
      }
    }

    // 5. Gán các sản phẩm phụ (child) vào sản phẩm chính tương ứng
    for (var item in billItems) {
      if (item.belongBillDetailId.isNotNullOrEmpty) {
        // Đây là sản phẩm phụ (child)
        final parentId = item.belongBillDetailId ?? '';
        final parent = parentMap[parentId];

        if (parent != null) {
          /// kiểm tra nó là quà tặng không
          if (item.isGift) {
            parent.gifts ??= <BillItemModel>[];
            parent.gifts!.add(item);
          }

          /// nếu không là quà tặng thì thêm vào attachs
          if (item.isAttach) {
            parent.attaches ??= <BillItemModel>[];
            parent.attaches!.add(item);
          }

          /// cập nhật lại parent
          parentMap[parentId] = parent;
        }
      }
    }

    return parentMap.values.toList();
  }
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
