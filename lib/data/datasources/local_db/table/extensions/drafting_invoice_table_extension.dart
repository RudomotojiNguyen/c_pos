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
  String get getCustomerRank => '';

  OtpCustomerPointModel? get discountByPoint => getCustomer?.discountByPoint;

  /// todo: tính số tiền sau khi có sản phẩm

  /// tính số tiền còn lại cần phải thêm để hoàn tất đơn
  double get calculatorMustPay => calculatorFinalPrice - totalPayment;

  /// tổng tiền được giảm trên bill
  double get totalPriceNoneDiscount => 0;

  /// tổng số tiền được giảm của các sản phẩm
  double get totalDiscountPriceOfBillItem => 0;

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
  ///     todo: tính thêm phí vận chuyển
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
}
