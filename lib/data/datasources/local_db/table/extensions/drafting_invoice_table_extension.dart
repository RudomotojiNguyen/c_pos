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

  /// tính số tiền còn lại cần phải thêm để hoàn tất đơn
  double get calculatorMustPay => calculatorFinalPrice - totalPayment;

  /// tổng phí vận chuyển
  double get totalDeliveryFee => deliveryFee?.getTotalDeliveryFee ?? 0.0;

  /// tổng tiền bill (chưa giảm)
  double get totalPriceNoneDiscount =>
      getProducts.totalPriceNoneDiscount + totalDeliveryFee;

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

    data = {
      ...data,
      'id': draftBillId,
      'orderId': orderId,
      'billNumber': billNumber,
      'preOrderId': preOrderId,
      'discountType': XDiscountType.amount.value,
      'discountAmount': discountTotalBill ?? 0,
      'couponCode': couponDiscountCode,
      'listBillItem': listBillItemInfo,
      ...getCustomer?.formatCustomerCreateBill() ?? {},
      ...discountByPoint?.formatCustomerPointCreateBill() ?? {},
      ...userInfo.formatCreatorInfoCreateBill(),
      'saleStoreId': null,
      'technicalId': null,
      'storeId': store?.getStoreId,
    };

    /// ghi chú
    data = {
      ...data,
      'customerNote': customerNote, // ghi chú của khách hàng
      'saleNote': saleNote, // Ghi chú CSKH
      'warrantyNote': warrantyNote, // Ghi chú bảo hành
    };

    /// thanh toán
    data = {
      ...data,
      // thông tin thanh toán
      'installments': installments,
      'credits': credits,
      'transfer': transfers,
      'cash': cashes,
      'refunds': [],
      'refundAmount': 0,
      // thông tin tiền trả trước
      'depositAmount': totalCashPrePay,
      'transferAmount': totalTransferPrePay,
      'creditAmount': totalCreditPrePay,
      'installedMoneyAmount': totalInstallmentPrePay,
    };

    /// thông tin lãi suất
    /// todo: hỏi lại phần trả góp
    // data = {
    //   ...data,
    //   'isInterestZero': false,
    //   'intallmentProgram': null,
    //   'installmentShinhan': null,
    //   'conversionFee': 0,
    // };

    if ({CartType.updateOrder, CartType.order}.contains(typeCart)) {
      /// thông tin đơn hàng sẽ hơi khác nên sẽ format thêm ở đây
      data.remove(
          'listBillItem'); // do là order nên không truyền listBillItem => xóa trường này
      data = {
        ...data,
        ...orderSubDetail?.formatOrderSubDetailCreateBill() ?? {},
        ...deliveryFee?.formatDeliveryFeeCreateBill() ?? {},
        'orderItems': listBillItemInfo,
        'draftBillId': draftBillId,
        'id': orderId,
      };
    }

    return data;
  }
}
