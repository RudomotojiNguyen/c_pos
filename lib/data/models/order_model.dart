import 'package:c_pos/common/extensions/extension.dart';
import 'package:intl/intl.dart';

import '../../common/enum/enum.dart';
import '../../presentation/utils/utils.dart';
import 'base_enum_model.dart';
import 'delivery_fee_model.dart';
import 'employee_model.dart';
import 'employee_sub_detail_model.dart';
import 'order_item.dart';
import 'order_sub_detail_model.dart';
import 'payment_model.dart';
import 'product_model.dart';
import 'store_model.dart';

class OrderModel {
  int? id;
  int? storeId;
  int? orderSourceId;
  int? saleId;
  String? saleNote;
  String? checkDate;
  String? checkTime;
  int? orderType;
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
  double? totalAmount;
  String? paymentDate;
  double? customerShipFee;
  double? shipFee;
  int? cashAccountId;
  int? transferAccountId;
  String? transferCode;
  int? installMoneyAccountId;
  String? installMoneyCode;
  int? deleted;
  String? createdAt;
  String? updatedAt;
  String? codeShip;
  int? promotionId;
  int? checkStatus;
  int? createdBy;
  int? updatedBy;
  int? companyId;
  String? transferReferenceCode;
  double? otherFees;
  String? creditCardNo;
  int? payCreditFeeType;
  String? creditFeeNote;
  double? installedMoneyAmount;
  String? customerTransferNo;
  int? creditFeeAcountId;
  String? customerBankName;
  double? creditAmount;
  String? customerIndentifyNo;
  int? creditAccountId;
  String? creditCode;
  int? insertType;
  List<OrderItemModel>? orderItems;
  String? couponCode;
  int? subtractPoint;
  int? partnerPaymentStatus;
  String? warrantyNote;
  int? jobTitleId;
  int? saleStoreId;
  int? technicalId;
  int? loanApplicationId;
  int? installApplicationStatus;
  double? pointAmount;
  bool? isInterestZero;
  int? installmentProgramId;
  String? installmentProgramMonthNo;
  String? installmentProgramPrepayPercent;
  int? conversionFee;
  String? orderTypeName;
  String? statusName;
  String? cancelStatusName;
  String? insertTypeName;
  int? orderId;
  String? createdByName;
  String? cashAccountName;
  String? transferAccountName;
  String? creditAccountName;
  String? creditFeeAccountName;
  String? installMoneyAccountName;
  String? installmentProgram;
  bool? editable;
  int? customerCity;
  int? customerDistrict;
  int? customerWard;
  XCustomerType? customerType;
  bool? companyBill;
  double? subtractPointAmount;
  String? storeName;
  String? orderSourceName;
  String? keepStockStatusName;
  String? saleStoreName;
  String? technicalName;
  List<PaymentModel>? payments;

  OrderModel({
    this.id,
    this.storeId,
    this.orderSourceId,
    this.saleId,
    this.saleNote,
    this.checkDate,
    this.checkTime,
    this.orderType,
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
    this.totalAmount,
    this.paymentDate,
    this.customerShipFee,
    this.shipFee,
    this.cashAccountId,
    this.transferAccountId,
    this.transferCode,
    this.installMoneyAccountId,
    this.installMoneyCode,
    this.deleted,
    this.createdAt,
    this.updatedAt,
    this.codeShip,
    this.promotionId,
    this.checkStatus,
    this.createdBy,
    this.updatedBy,
    this.companyId,
    this.transferReferenceCode,
    this.otherFees,
    this.creditCardNo,
    this.payCreditFeeType,
    this.creditFeeNote,
    this.installedMoneyAmount,
    this.customerTransferNo,
    this.creditFeeAcountId,
    this.customerBankName,
    this.creditAmount,
    this.customerIndentifyNo,
    this.creditAccountId,
    this.creditCode,
    this.insertType,
    this.orderItems,
    this.couponCode,
    this.subtractPoint,
    this.partnerPaymentStatus,
    this.warrantyNote,
    this.jobTitleId,
    this.saleStoreId,
    this.technicalId,
    this.loanApplicationId,
    this.installApplicationStatus,
    this.pointAmount,
    this.isInterestZero,
    this.installmentProgramId,
    this.installmentProgramMonthNo,
    this.installmentProgramPrepayPercent,
    this.conversionFee,
    this.orderTypeName,
    this.statusName,
    this.cancelStatusName,
    this.insertTypeName,
    this.orderId,
    this.createdByName,
    this.cashAccountName,
    this.transferAccountName,
    this.creditAccountName,
    this.creditFeeAccountName,
    this.installMoneyAccountName,
    this.installmentProgram,
    this.editable,
    this.customerCity,
    this.customerDistrict,
    this.customerWard,
    this.customerType,
    this.companyBill,
    this.subtractPointAmount,
    this.storeName,
    this.orderSourceName,
    this.keepStockStatusName,
    this.saleStoreName,
    this.technicalName,
    this.payments,
  });

  OrderModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    storeId = json['storeId'];
    orderSourceId = json['orderSourceId'];
    saleId = json['saleId'];
    saleNote = json['saleNote'];
    checkDate = json['checkDate'];
    checkTime = json['checkTime'];
    orderType = json['orderType'];
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
    totalAmount = Utils.toDouble(json['totalAmount']);
    paymentDate = json['paymentDate'];
    customerShipFee = Utils.toDouble(json['customerShipFee']);
    shipFee = Utils.toDouble(json['shipFee']);
    cashAccountId = json['cashAccountId'];
    transferAccountId = json['transferAccountId'];
    transferCode = json['transferCode'];
    installMoneyAccountId = json['installMoneyAccountId'];
    installMoneyCode = json['installMoneyCode'];
    deleted = json['deleted'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    codeShip = json['codeShip'];
    promotionId = json['promotionId'];
    checkStatus = json['checkStatus'];
    createdBy = json['createdBy'];
    updatedBy = json['updatedBy'];
    companyId = json['companyId'];
    transferReferenceCode = json['transferReferenceCode'];
    otherFees = Utils.toDouble(json['otherFees']);
    creditCardNo = json['creditCardNo'];
    payCreditFeeType = json['payCreditFeeType'];
    creditFeeNote = json['creditFeeNote'];
    installedMoneyAmount = Utils.toDouble(json['installedMoneyAmount']);
    customerTransferNo = json['customerTransferNo'];
    creditFeeAcountId = json['creditFeeAcountId'];
    customerBankName = json['customerBankName'];
    creditAmount = Utils.toDouble(json['creditAmount']);
    customerIndentifyNo = json['customerIndentifyNo'];
    creditAccountId = json['creditAccountId'];
    creditCode = json['creditCode'];
    insertType = json['insertType'];
    if (json['orderItems'] != null) {
      List<OrderItemModel> data = <OrderItemModel>[];
      json['orderItems'].forEach((v) {
        data.add(OrderItemModel.fromJson(v));
      });
      orderItems = formatProducts(data);
    }
    couponCode = json['couponCode'];
    subtractPoint = json['subtractPoint'];
    partnerPaymentStatus = json['partnerPaymentStatus'];
    warrantyNote = json['warrantyNote'];
    jobTitleId = json['jobTitleId'];
    saleStoreId = json['saleStoreId'];
    technicalId = json['technicalId'];
    loanApplicationId = json['loanApplicationId'];
    installApplicationStatus = json['installApplicationStatus'];
    pointAmount = Utils.toDouble(json['pointAmount']);
    isInterestZero = json['isInterestZero'];
    installmentProgramId = json['installmentProgramId'];
    installmentProgramMonthNo = json['installmentProgramMonthNo'];
    installmentProgramPrepayPercent = json['installmentProgramPrepayPercent'];
    conversionFee = json['conversionFee'];
    orderTypeName = json['orderTypeName'];
    statusName = json['statusName'];
    cancelStatusName = json['cancelStatusName'];
    insertTypeName = json['insertTypeName'];
    orderId = json['orderId'];
    createdByName = json['createdByName'];
    cashAccountName = json['cashAccountName'];
    transferAccountName = json['transferAccountName'];
    creditAccountName = json['creditAccountName'];
    creditFeeAccountName = json['creditFeeAccountName'];
    installMoneyAccountName = json['installMoneyAccountName'];
    installmentProgram = json['installmentProgram'];
    editable = json['editable'];
    customerCity = json['customerCity'];
    customerDistrict = json['customerDistrict'];
    customerWard = json['customerWard'];
    customerType = (json['customerType'] as int?)?.getCustomerType;
    companyBill = json['companyBill'];
    subtractPointAmount = Utils.toDouble(json['subtractPointAmount']);
    storeName = json['storeName'];
    orderSourceName = json['orderSourceName'];
    keepStockStatusName = json['keepStockStatusName'];
    saleStoreName = json['saleStoreName'];
    technicalName = json['technicalName'];
    if (json['payments'] != null) {
      payments = <PaymentModel>[];
      json['payments'].forEach((v) {
        payments!.add(PaymentModel.fromJson(v));
      });
    }
  }

  List<OrderItemModel> formatProducts(List<OrderItemModel> orderItems) {
    /// key là OrderItemModel id
    /// value là OrderItemModel
    // 1. Tạo một Map để dễ dàng tìm kiếm sản phẩm chính bằng ID
    final Map<String, OrderItemModel> parentMap = {};

    // 2. Phân loại và điền vào Map
    // Các item có 'belongBillDetailId' là null (hoặc không có) được coi là sản phẩm chính (parent)
    for (var item in orderItems) {
      String key = item.id ?? '';
      if (item.belongOrderDetailId.isNullOrEmpty) {
        // Đây là sản phẩm chính (parent)
        parentMap[key] = item;
      }
    }

    // 3. Gán các sản phẩm phụ (child) vào sản phẩm chính tương ứng
    for (var item in orderItems) {
      if (item.belongOrderDetailId.isNotNullOrEmpty) {
        // Đây là sản phẩm phụ (child)
        final parentId = item.belongOrderDetailId ?? '';
        final parent = parentMap[parentId];

        if (parent != null) {
          /// kiểm tra nó là quà tặng không
          if (item.isGift) {
            parent.gifts ??= <OrderItemModel>[];
            parent.gifts!.add(item);
          }

          /// nếu không là quà tặng thì thêm vào attachs
          if (item.isAttach) {
            parent.attaches ??= <OrderItemModel>[];
            parent.attaches!.add(item);
          }

          /// cập nhật lại parent
          parentMap[parentId] = parent;
        }
      }
    }

    return parentMap.values.toList();
  }

  List<ProductModel> get products => (orderItems ?? [])
      .map((e) => ProductModel(
            productType: e.productType,
            productName: e.getName,
            imeiNo: e.getImeiNo,
            sellingPrice: e.productPrice,
            discountAmount: e.discountAmount,
            discountPrice: e.discountAmount,
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

  EmployeeSubDetailModel get getSubEmployeeInfo => EmployeeSubDetailModel(
        employee: EmployeeModel(
          id: saleId,
          fullName: createdByName,
        ),
        // technical: EmployeeModel(
        //   id: technicalId,
        //   fullName: technicalName,
        // ),
        // cashier: EmployeeModel(
        //   id: cashierId,
        //   fullName: cashierName,
        // ),
        // manager: EmployeeModel(
        //   id: managerId,
        //   fullName: managerName,
        // ),
        // assistant: EmployeeModel(
        //   id: assistantId,
        //   fullName: assistantName,
        // ),
        // delivery: EmployeeModel(
        //   id: shipperId,
        //   fullName: shipperName,
        // ),
        // cdpk: EmployeeModel(
        //   id: accessoryStaffId,
        //   fullName: accessoryStaffName,
        // ),
        // receptionist: EmployeeModel(
        //   id: assistantId,
        //   fullName: assistantName,
        // ),
      );

  String get getOrderSource => orderSourceName ?? '';

  String get getOrderType => orderTypeName ?? '';

  String get getCheckDate => checkDate ?? '';

  String get getCheckTime => checkTime ?? '';

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

  double get getTotalAmount => totalAmount ?? -1;

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

  double get getTotalAmountFinal => totalAmount ?? 0;

  EmployeeModel get getSaleInfo => EmployeeModel(
        id: saleId ?? createdBy,
        fullName: createdByName,
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

  DateTime get getTimeComeToShop {
    // checkTime có dạng
    // web tạo -> "HH:mm"
    // mobile tạo -> "2025-06-05T06:30:19.288Z"
    return checkTime.isNullOrEmpty
        ? DateTime.now()
        : checkTime!.convertHourMinuteToDateTime;
  }

  StoreModel get getStore => StoreModel(
        id: storeId,
        name: storeName,
      );
}
