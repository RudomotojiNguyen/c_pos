part of '../drafting_invoice_table.dart';

extension DraftingInvoiceTableExtension on DraftingInvoiceTable {
  /// GETTER ISAR LINK
  // lấy thông tin customer
  CustomerTable? get getCustomer => customer.value;

  // lấy thông tin product
  ProductTable? get getProduct => product.value;

  // lấy thông tin products
  List<ProductTable> get getProducts => products.toList();

  List<PaymentMethodTable> get getPaymentMethods =>
      paymentMethods.map((e) => e).toList();

  List<PaymentMethodTable> get getPaymentMethodsPrePay =>
      paymentMethodsPrePay.map((e) => e).toList();

  /// phân từng loại khách chọn cần thanh toán
  List<PaymentMethodTable> get paymentByCash => getPaymentMethods
      .where((item) => item.paymentType == PaymentType.cash)
      .toList();

  List<PaymentMethodTable> get paymentByTransfer => getPaymentMethods
      .where((item) => item.paymentType == PaymentType.transfer)
      .toList();

  List<PaymentMethodTable> get paymentByCredit => getPaymentMethods
      .where((item) => item.paymentType == PaymentType.credit)
      .toList();

  List<PaymentMethodTable> get paymentByInstallment => getPaymentMethods
      .where((item) => item.paymentType == PaymentType.installment)
      .toList();

  /// phân từng loại khách đã thanh toán
  List<PaymentMethodTable> get prePaymentByCash => getPaymentMethodsPrePay
      .where((item) => item.paymentType == PaymentType.cash)
      .toList();

  List<PaymentMethodTable> get prePaymentByTransfer => getPaymentMethodsPrePay
      .where((item) => item.paymentType == PaymentType.transfer)
      .toList();

  List<PaymentMethodTable> get prePaymentByCredit => getPaymentMethodsPrePay
      .where((item) => item.paymentType == PaymentType.credit)
      .toList();

  List<PaymentMethodTable> get prePaymentByInstallment =>
      getPaymentMethodsPrePay
          .where((item) => item.paymentType == PaymentType.installment)
          .toList();

  /// MORE EXTENSION FUNCTION
  String get getCustomerName => getCustomer?.fullName ?? '';
  String get getCustomerPhone => getCustomer?.phoneNo ?? '';
  int get getCustomerId => getCustomer?.customerId ?? 0;

  OtpCustomerPointModel? get discountByPoint => getCustomer?.discountByPoint;

  bool get validateBill {
    /// notes: tạm thời để true
    return true;
  }

  /// todo: tính số tiền sau khi có sản phẩm

  /// tính số tiền còn lại cần phải thêm để hoàn tất đơn
  double get calculatorMustPay => calculatorFinalPrice - totalPayment;

  /// tổng tiền được giảm trên bill
  double get totalPriceNoneDiscount => getProducts.totalPriceNoneDiscount;

  /// tổng số tiền được giảm của các sản phẩm
  double get totalDiscountPriceOfBillItem =>
      getProducts.totalDiscountPriceOfBillItem;

  /// giảm giá của tổng bill
  double get getDiscountOfTotalBill => discountTotalBill ?? 0;

  /// tính tổng tiền khách đã thanh toán
  double get calculatorTotalPrePayment =>
      totalCashPrePayment +
      totalTransferPrePayment +
      totalCreditPrePayment +
      totalInstallmentPrePayment;

  /// Tính thành tiền = tổng tiền chưa giảm
  ///     - tiền được giảm trên từng item
  ///     - tiền được giảm trên tổng bill
  ///     - tiền giảm khi trừ điểm
  ///     - tiền khách đã thanh toán trước
  double get calculatorFinalPrice =>
      totalPriceNoneDiscount -
      totalDiscountPriceOfBillItem -
      getDiscountOfTotalBill -
      getDiscountByPoint -
      calculatorTotalPrePayment;

  /// lấy số tiền giảm giá bằng điểm
  double get getDiscountByPoint {
    if (discountByPoint == null) return 0;
    return discountByPoint?.isValidOTP == true
        ? (discountByPoint?.amountTransferFromPoint ?? 0)
        : 0;
  }

  /// tính tổng theo từng loại khách đã thanh toán
  double get totalCashPrePayment =>
      prePaymentByCash.fold(0, (total, currentItem) {
        return total + (currentItem.amount ?? 0);
      });

  double get totalTransferPrePayment =>
      prePaymentByTransfer.fold(0, (total, currentItem) {
        return total + (currentItem.amount ?? 0);
      });

  double get totalCreditPrePayment =>
      prePaymentByCredit.fold(0, (total, currentItem) {
        return total + (currentItem.amount ?? 0);
      });

  double get totalInstallmentPrePayment =>
      prePaymentByInstallment.fold(0, (total, currentItem) {
        return total + (currentItem.amount ?? 0);
      });

  /// tính tổng theo từng loại khách chọn cần thanh toán
  double get totalCashPayment => paymentByCash.fold(0, (total, currentItem) {
        return total + (currentItem.amount ?? 0);
      });

  double get totalTransferPayment =>
      paymentByTransfer.fold(0, (total, currentItem) {
        return total + (currentItem.amount ?? 0);
      });

  double get totalCreditPayment =>
      paymentByCredit.fold(0, (total, currentItem) {
        return total + (currentItem.amount ?? 0);
      });

  double get totalInstallmentPayment =>
      paymentByInstallment.fold(0, (total, currentItem) {
        return total + (currentItem.amount ?? 0);
      });

  /// tổng tiền khách chọn cần thanh toán
  double get totalPayment =>
      totalCashPayment +
      totalTransferPayment +
      totalCreditPayment +
      totalInstallmentPayment;

  /// format lại data để gửi lên core
  /// todo: validate lại thông tin param cho thật kỹ
  Map<String, dynamic> formatBodyData() {
    Map<String, dynamic> data = <String, dynamic>{};

    List<Map<String, dynamic>> cashes =
        paymentByCash.map((e) => e.formatTransactionPayment()).toList();
    List<Map<String, dynamic>> transfers =
        paymentByTransfer.map((e) => e.formatTransactionPayment()).toList();
    List<Map<String, dynamic>> credits =
        paymentByCredit.map((e) => e.formatTransactionPayment()).toList();
    List<Map<String, dynamic>> installments =
        paymentByInstallment.map((e) => e.formatDepositPayment()).toList();

    double totalCashPrePay = prePaymentByCash.fold(0, (total, currentItem) {
      return total + (currentItem.amount ?? 0);
    });
    double totalTransferPrePay = prePaymentByTransfer.fold(0, (
      total,
      currentItem,
    ) {
      return total + (currentItem.amount ?? 0);
    });
    double totalCreditPrePay = prePaymentByCredit.fold(0, (total, currentItem) {
      return total + (currentItem.amount ?? 0);
    });
    double totalInstallmentPrePay = prePaymentByInstallment.fold(0, (
      total,
      currentItem,
    ) {
      return total + (currentItem.amount ?? 0);
    });

    dynamic draftBillId = id;
    if (typeCart == CartType.updateBill) {
      draftBillId = billId;
    }
    if (typeCart == CartType.updateOrder) {
      draftBillId = orderId;
    }

    final listBillItemInfo = getProducts.formatBodyData;
    final AuthModel userInfo = getIt.get<AuthBloc>().state.userInfo!;

    data['id'] = draftBillId;
    data['billNumber'] = billNumber;
    // data['isChoosingQrToPay'] = '';
    data['storeId'] = userInfo.getStoreId;
    if (!(getCustomer?.isDefaultAccount ?? false)) {
      data['customerId'] = getCustomer?.customerId;
    }
    data['customerMobile'] = getCustomer?.phoneNo;
    data['customerName'] = getCustomer?.fullName;
    data['customerAddress'] = getCustomer?.address;
    data['customerCity'] = getCustomer?.city;
    data['customerDistrict'] = getCustomer?.district;
    data['customerWard'] = getCustomer?.ward;
    data['customerLastName'] = getCustomer?.lastName;
    data['customerAppellation'] = getCustomer?.appellation.getValue;
    data['customerDOB'] = getCustomer?.dateOfBirth?.formatDate();
    data['customerNote'] = customerNote ?? saleNote;
    data['saleNote'] = saleNote;
    data['warrantyNote'] = warrantyNote;
    data['discountType'] = XDiscountType.amount.value;
    data['discountAmount'] = discountTotalBill ?? 0;
    data['listBillItem'] = listBillItemInfo;
    data['orderId'] = orderId;
    data['pointUse'] = discountByPoint?.pointWillUse ?? 0;
    data['isCountPoint'] = false;
    data['isValidCouponCode'] = false;
    data['couponCode'] = couponDiscountCode;
    data['installments'] = installments;
    data['credits'] = credits;
    data['transfer'] = transfers;
    data['cash'] = cashes;
    data['refunds'] = [];
    data['isMultiplePayment'] = true;
    data['cancelStatus'] = orderSubDetail?.getCancelStatusId;
    data['status'] = orderSubDetail?.getOrderStatusId;

    // số tiền thanh toán trước
    data['depositAmount'] = totalCashPrePay; // tiền mặt
    data['transferAmount'] = totalTransferPrePay; // chuyển khoản
    data['creditAmount'] = totalCreditPrePay; // cà thẻ
    data['installedMoneyAmount'] = totalInstallmentPrePay; // trả góp

    if ({CartType.updateOrder, CartType.order}.contains(typeCart)) {
      data['listBillItem'] =
          null; // do là order nên không truyền listBillItem => set null
      data['checkDate'] = orderSubDetail?.getCheckDate;
      data['checkTime'] = orderSubDetail?.getCheckTime;
      data['paymentDate'] = orderSubDetail?.getPaymentDate;
      data['codeShip'] = orderSubDetail?.getShipCode;
      data['orderType'] = orderSubDetail?.getOrderTypeId;
      data['orderSourceId'] = orderSubDetail?.getOrderSourceId;
      data['cancelStatus'] = orderSubDetail?.getCancelStatusId;
      data['customerShipFee'] = deliveryFee?.customerFee;
      data['shipFee'] = deliveryFee?.shippingCompanyFee;
      data['insertType'] = 5;
      data['orderItems'] = listBillItemInfo;
      data['subtractPoint'] = discountByPoint?.pointWillUse ?? 0;
      data['subtractPointAmount'] =
          discountByPoint?.amountTransferFromPoint ?? 0;
      data['id'] = orderId;
      data['draftBillId'] = draftBillId;
    }

    return data;
  }
}
