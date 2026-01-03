part of 'drafting_invoice_bloc.dart';

@immutable
sealed class DraftingInvoiceState extends Equatable {
  const DraftingInvoiceState({
    this.currentDraftId,
    this.customer,
    this.products,
    this.billId,
    this.orderId,
    this.customerNote,
    this.warrantyNote,
    this.saleNote,
    this.discountTotalBillByPoint,
    this.isDefaultInfo,
    this.vatChecked,
    this.isCountPoint,
    this.cartType,
    this.discountTotalBill,
    this.couponDiscountCode,
    this.productTradeIn,
    this.productImei,
    this.isEstimateCost,
    this.isSoldByCompany,
    this.method,
    this.billNumber,
    this.currentStore,
    required this.employeeSubDetail,
    //
    required this.totalPriceNoneDiscount,
    required this.totalDiscountPriceOfBillItem,
    required this.discountOfBill,
    required this.totalPrePayment,
    required this.finalPrice,
    required this.mustPay,
    this.paymentByCash,
    this.paymentByTransfer,
    this.paymentByCredit,
    // this.paymentByInstallment,
    //
    this.deliveryFee,
    this.orderSubDetail,
    //
    this.product,
    required this.tradeInType,
    required this.programingSelected,
    required this.productBuyingPrice,
    required this.estimationBuyingPrice,
    required this.totalCriteriaPrice,
    this.tradeInProgramId,
  });

  final int? currentDraftId;

  ///
  final CustomerTable? customer;
  final List<ProductTable>? products;
  final String? billId;
  final int? orderId;
  final int? billNumber; // số hóa đơn
  final String? customerNote;
  final String? warrantyNote;
  final String? saleNote;
  final OtpCustomerPointModel? discountTotalBillByPoint;
  final bool? isDefaultInfo;
  final bool? vatChecked;
  final bool? isCountPoint;
  final StoreModel? currentStore;

  final CartType? cartType;
  final double? discountTotalBill;
  final String? couponDiscountCode;

  //trade in
  final ProductTable? productTradeIn;
  final String? productImei;
  final bool? isEstimateCost;
  final bool? isSoldByCompany;
  final bool? method;

  /// notes: chưa cộng thêm vào phần chi tiết thanh toán
  //for order
  final DeliveryFeeModel? deliveryFee;
  final OrderSubDetailModel? orderSubDetail;

  /// trade in
  final ProductTable? product;
  final TradeInType tradeInType;
  final Map<int, Map<int, TradeInProgramCreteriaGroupOptionModel>>
      programingSelected; // lưu danh sách option được chọn, phân biệt bằng id thằng cha
  final double productBuyingPrice; // giá thu lại
  final double estimationBuyingPrice; //Giá thu dự kiến
  final double totalCriteriaPrice; //Tổng tiền trừ hao
  final int? tradeInProgramId; //

  /// tổng số tiền các sản phẩm chưa được giảm
  final double totalPriceNoneDiscount;

  /// tổng số tiền được giảm của các sản phẩm
  /// tính thêm phầm mua sản phẩm combo
  final double totalDiscountPriceOfBillItem;

  /// số tiền được giảm trên tổng bill
  final double discountOfBill;

  /// số tiền khách đã thanh toán trước
  final double totalPrePayment;

  /// số tiền khách cần thanh toán sau khi trừ các thành phần
  final double finalPrice;

  /// số tiền khách cần thanh toán để hoàn tất
  final double mustPay;

  final List<PaymentMethodTable>? paymentByCash;
  final List<PaymentMethodTable>? paymentByTransfer;
  final List<PaymentMethodTable>? paymentByCredit;
  // final List<PaymentMethodTable>? paymentByInstallment;
  final EmployeeSubDetailModel employeeSubDetail;

  @override
  List<Object?> get props => [
        currentDraftId,
        customer,
        products,
        billId,
        orderId,
        customerNote,
        warrantyNote,
        saleNote,
        discountTotalBillByPoint,
        isDefaultInfo,
        vatChecked,
        isCountPoint,
        cartType,
        discountTotalBill,
        couponDiscountCode,
        productTradeIn,
        productImei,
        isEstimateCost,
        isSoldByCompany,
        method,
        totalPriceNoneDiscount,
        totalDiscountPriceOfBillItem,
        discountOfBill,
        totalPrePayment,
        finalPrice,
        mustPay,
        paymentByCash,
        paymentByTransfer,
        paymentByCredit,
        // paymentByInstallment,
        billNumber,
        deliveryFee,
        orderSubDetail,
        product,
        tradeInType,
        programingSelected,
        productBuyingPrice,
        estimationBuyingPrice,
        totalCriteriaPrice,
        tradeInProgramId,
        currentStore,
        employeeSubDetail,
      ];

  bool get checkNullDraft => currentDraftId == null;

  int get getCustomerFee => deliveryFee?.getCustomerFee ?? 0;

  int get getShippingCompanyFee => deliveryFee?.getShippingCompanyFee ?? 0;

  /// số tiền được giảm khi dùng điểm
  double get discountOfPoint => (discountTotalBillByPoint?.isValidOTP ?? false)
      ? (discountTotalBillByPoint?.amountTransferFromPoint ?? 0)
      : 0;

  /// kiểm tra đã có thông tin khách hay chưa
  bool get isHasEnoughCustomerInfo =>
      customer != null &&
      customer?.getCustomerPhoneNumber?.isNotNullOrEmpty == true;
}

final class DraftingInvoiceInitial extends DraftingInvoiceState {
  const DraftingInvoiceInitial({
    required super.totalPriceNoneDiscount,
    required super.totalDiscountPriceOfBillItem,
    required super.discountOfBill,
    required super.totalPrePayment,
    required super.finalPrice,
    required super.mustPay,
    required super.tradeInType,
    required super.programingSelected,
    required super.productBuyingPrice,
    required super.estimationBuyingPrice,
    required super.totalCriteriaPrice,
    required super.employeeSubDetail,
  });
}

final class CreateFailed extends DraftingInvoiceState {
  CreateFailed({required DraftingInvoiceState state})
      : super(
          currentDraftId: state.currentDraftId,
          products: state.products,
          employeeSubDetail: state.employeeSubDetail,

          customer: state.customer,
          discountTotalBillByPoint: state.discountTotalBillByPoint,
          billId: state.billId,
          billNumber: state.billNumber,
          orderId: state.orderId,
          customerNote: state.customerNote,
          warrantyNote: state.warrantyNote,
          saleNote: state.saleNote,
          isDefaultInfo: state.isDefaultInfo,
          vatChecked: state.vatChecked,
          isCountPoint: state.isCountPoint,
          cartType: state.cartType,
          discountTotalBill: state.discountTotalBill,
          couponDiscountCode: state.couponDiscountCode,
          productTradeIn: state.productTradeIn,
          productImei: state.productImei,
          isEstimateCost: state.isEstimateCost,
          isSoldByCompany: state.isSoldByCompany,
          method: state.method,
          totalPriceNoneDiscount: state.totalPriceNoneDiscount,
          totalDiscountPriceOfBillItem: state.totalDiscountPriceOfBillItem,
          discountOfBill: state.discountOfBill,
          totalPrePayment: state.totalPrePayment,
          finalPrice: state.finalPrice,
          mustPay: state.mustPay,
          paymentByCash: state.paymentByCash,
          paymentByTransfer: state.paymentByTransfer,
          paymentByCredit: state.paymentByCredit,
          // paymentByInstallment: state.paymentByInstallment,
          deliveryFee: state.deliveryFee,
          orderSubDetail: state.orderSubDetail,
          //
          product: state.product,
          programingSelected: state.programingSelected,
          estimationBuyingPrice: state.estimationBuyingPrice,
          productBuyingPrice: state.productBuyingPrice,
          totalCriteriaPrice: state.totalCriteriaPrice,
          tradeInType: state.tradeInType,
          tradeInProgramId: state.tradeInProgramId,
          currentStore: state.currentStore,
        );
}

final class DraftingInvoiceCreated extends DraftingInvoiceState {
  DraftingInvoiceCreated({
    required DraftingInvoiceState state,
    required super.currentDraftId,
  }) : super(
          totalPriceNoneDiscount: 0,
          totalDiscountPriceOfBillItem: 0,
          discountOfBill: 0,
          totalPrePayment: 0,
          finalPrice: 0,
          mustPay: 0,
          tradeInType: TradeInType.tradeIn,
          programingSelected: {},
          productBuyingPrice: 0,
          estimationBuyingPrice: 0,
          totalCriteriaPrice: 0,
          employeeSubDetail: state.employeeSubDetail,
        );
}

final class GetCurrentDraftDataError extends DraftingInvoiceState {
  GetCurrentDraftDataError({required DraftingInvoiceState state})
      : super(
          totalPriceNoneDiscount: 0,
          totalDiscountPriceOfBillItem: 0,
          discountOfBill: 0,
          totalPrePayment: 0,
          finalPrice: 0,
          mustPay: 0,
          tradeInType: TradeInType.tradeIn,
          programingSelected: const {},
          estimationBuyingPrice: 0,
          productBuyingPrice: 0,
          totalCriteriaPrice: 0,
          employeeSubDetail: EmployeeSubDetailModel(),
        );
}

final class IsGettingDetail extends DraftingInvoiceState {
  IsGettingDetail()
      : super(
          totalPriceNoneDiscount: 0,
          totalDiscountPriceOfBillItem: 0,
          discountOfBill: 0,
          totalPrePayment: 0,
          finalPrice: 0,
          mustPay: 0,
          tradeInType: TradeInType.tradeIn,
          programingSelected: const {},
          estimationBuyingPrice: 0,
          productBuyingPrice: 0,
          totalCriteriaPrice: 0,
          employeeSubDetail: EmployeeSubDetailModel(),
        );
}

final class GetCurrentDraftDataSuccess extends DraftingInvoiceState {
  const GetCurrentDraftDataSuccess({
    required DraftingInvoiceState state,
    //
    required super.employeeSubDetail,
    super.currentDraftId,
    super.customer,
    super.products,
    super.billId,
    super.billNumber,
    super.orderId,
    super.customerNote,
    super.warrantyNote,
    super.saleNote,
    super.discountTotalBillByPoint,
    super.isDefaultInfo,
    super.vatChecked,
    super.isCountPoint,
    super.paymentByCash,
    super.paymentByTransfer,
    super.paymentByCredit,
    // super.paymentByInstallment,
    super.cartType,
    super.discountTotalBill,
    super.couponDiscountCode,
    super.productTradeIn,
    super.productImei,
    super.isEstimateCost,
    super.isSoldByCompany,
    super.method,
    required super.totalPriceNoneDiscount,
    required super.totalDiscountPriceOfBillItem,
    required super.discountOfBill,
    required super.totalPrePayment,
    required super.finalPrice,
    required super.mustPay,
    super.deliveryFee,
    super.orderSubDetail,

    ///
    required super.tradeInType,
    super.product,
    required super.programingSelected,
    required super.estimationBuyingPrice,
    required super.productBuyingPrice,
    required super.totalCriteriaPrice,
    super.currentStore,
  });
}

final class UpdateCustomerSuccess extends DraftingInvoiceState {
  UpdateCustomerSuccess({
    required DraftingInvoiceState state,
    required super.customer,
    required super.discountTotalBillByPoint,
  }) : super(
          currentDraftId: state.currentDraftId,
          products: state.products,
          employeeSubDetail: state.employeeSubDetail,
          billId: state.billId,
          billNumber: state.billNumber,
          orderId: state.orderId,
          customerNote: state.customerNote,
          warrantyNote: state.warrantyNote,
          saleNote: state.saleNote,
          isDefaultInfo: state.isDefaultInfo,
          vatChecked: state.vatChecked,
          isCountPoint: state.isCountPoint,
          cartType: state.cartType,
          discountTotalBill: state.discountTotalBill,
          couponDiscountCode: state.couponDiscountCode,
          productTradeIn: state.productTradeIn,
          productImei: state.productImei,
          isEstimateCost: state.isEstimateCost,
          isSoldByCompany: state.isSoldByCompany,
          method: state.method,
          totalPriceNoneDiscount: state.totalPriceNoneDiscount,
          totalDiscountPriceOfBillItem: state.totalDiscountPriceOfBillItem,
          discountOfBill: state.discountOfBill,
          totalPrePayment: state.totalPrePayment,
          finalPrice: state.finalPrice,
          mustPay: state.mustPay,
          paymentByCash: state.paymentByCash,
          paymentByTransfer: state.paymentByTransfer,
          paymentByCredit: state.paymentByCredit,
          // paymentByInstallment: state.paymentByInstallment,
          deliveryFee: state.deliveryFee,
          orderSubDetail: state.orderSubDetail,
          //
          product: state.product,
          programingSelected: state.programingSelected,
          estimationBuyingPrice: state.estimationBuyingPrice,
          productBuyingPrice: state.productBuyingPrice,
          totalCriteriaPrice: state.totalCriteriaPrice,
          tradeInType: state.tradeInType,
          tradeInProgramId: state.tradeInProgramId,
          currentStore: state.currentStore,
        );
}

//

final class IsLoadingDetailState extends DraftingInvoiceState {
  IsLoadingDetailState({required DraftingInvoiceState state})
      : super(
          currentDraftId: state.currentDraftId,
          employeeSubDetail: state.employeeSubDetail,
          customer: state.customer,
          products: state.products,
          billId: state.billId,
          billNumber: state.billNumber,
          orderId: state.orderId,
          customerNote: state.customerNote,
          warrantyNote: state.warrantyNote,
          saleNote: state.saleNote,
          isDefaultInfo: state.isDefaultInfo,
          vatChecked: state.vatChecked,
          isCountPoint: state.isCountPoint,
          cartType: state.cartType,
          discountTotalBill: state.discountTotalBill,
          couponDiscountCode: state.couponDiscountCode,
          productTradeIn: state.productTradeIn,
          productImei: state.productImei,
          isEstimateCost: state.isEstimateCost,
          isSoldByCompany: state.isSoldByCompany,
          method: state.method,
          totalPriceNoneDiscount: state.totalPriceNoneDiscount,
          totalDiscountPriceOfBillItem: state.totalDiscountPriceOfBillItem,
          discountOfBill: state.discountOfBill,
          totalPrePayment: state.totalPrePayment,
          finalPrice: state.finalPrice,
          mustPay: state.mustPay,
          paymentByCash: state.paymentByCash,
          paymentByTransfer: state.paymentByTransfer,
          paymentByCredit: state.paymentByCredit,
          // paymentByInstallment: state.paymentByInstallment,
          deliveryFee: state.deliveryFee,
          orderSubDetail: state.orderSubDetail,
          tradeInType: state.tradeInType,
          product: state.product,
          programingSelected: state.programingSelected,
          estimationBuyingPrice: state.estimationBuyingPrice,
          productBuyingPrice: state.productBuyingPrice,
          totalCriteriaPrice: state.totalCriteriaPrice,
          tradeInProgramId: state.tradeInProgramId,
          currentStore: state.currentStore,
        );
}

//

final class UpdateBillNoteSuccess extends DraftingInvoiceState {
  UpdateBillNoteSuccess({
    required DraftingInvoiceState state,
    super.saleNote,
    super.warrantyNote,
    super.customerNote,
  }) : super(
          currentDraftId: state.currentDraftId,
          employeeSubDetail: state.employeeSubDetail,
          products: state.products,
          billId: state.billId,
          billNumber: state.billNumber,
          orderId: state.orderId,
          isDefaultInfo: state.isDefaultInfo,
          vatChecked: state.vatChecked,
          isCountPoint: state.isCountPoint,
          cartType: state.cartType,
          customer: state.customer,
          couponDiscountCode: null,
          productTradeIn: state.productTradeIn,
          productImei: state.productImei,
          isEstimateCost: state.isEstimateCost,
          isSoldByCompany: state.isSoldByCompany,
          method: state.method,
          totalPriceNoneDiscount: state.totalPriceNoneDiscount,
          totalDiscountPriceOfBillItem: state.totalDiscountPriceOfBillItem,
          discountOfBill: state.discountOfBill,
          totalPrePayment: state.totalPrePayment,
          finalPrice: state.finalPrice,
          mustPay: state.mustPay,
          paymentByCash: state.paymentByCash,
          paymentByTransfer: state.paymentByTransfer,
          paymentByCredit: state.paymentByCredit,
          // paymentByInstallment: state.paymentByInstallment,
          deliveryFee: state.deliveryFee,
          orderSubDetail: state.orderSubDetail,
          tradeInType: state.tradeInType,
          product: state.product,
          programingSelected: state.programingSelected,
          estimationBuyingPrice: state.estimationBuyingPrice,
          productBuyingPrice: state.productBuyingPrice,
          totalCriteriaPrice: state.totalCriteriaPrice,
          tradeInProgramId: state.tradeInProgramId,
          currentStore: state.currentStore,
        );
}

final class UpdateProductsSuccess extends DraftingInvoiceState {
  UpdateProductsSuccess({
    required DraftingInvoiceState state,
    required super.products,
  }) : super(
          currentDraftId: state.currentDraftId,
          employeeSubDetail: state.employeeSubDetail,
          customer: state.customer,
          billId: state.billId,
          billNumber: state.billNumber,
          orderId: state.orderId,
          customerNote: state.customerNote,
          warrantyNote: state.warrantyNote,
          saleNote: state.saleNote,
          isDefaultInfo: state.isDefaultInfo,
          vatChecked: state.vatChecked,
          isCountPoint: state.isCountPoint,
          cartType: state.cartType,
          discountTotalBill: state.discountTotalBill,
          couponDiscountCode: state.couponDiscountCode,
          productTradeIn: state.productTradeIn,
          productImei: state.productImei,
          isEstimateCost: state.isEstimateCost,
          isSoldByCompany: state.isSoldByCompany,
          method: state.method,
          totalPriceNoneDiscount: state.totalPriceNoneDiscount,
          totalDiscountPriceOfBillItem: state.totalDiscountPriceOfBillItem,
          discountOfBill: state.discountOfBill,
          totalPrePayment: state.totalPrePayment,
          finalPrice: state.finalPrice,
          mustPay: state.mustPay,
          paymentByCash: state.paymentByCash,
          paymentByTransfer: state.paymentByTransfer,
          paymentByCredit: state.paymentByCredit,
          // paymentByInstallment: state.paymentByInstallment,
          deliveryFee: state.deliveryFee,
          orderSubDetail: state.orderSubDetail,
          tradeInType: state.tradeInType,
          product: state.product,
          programingSelected: state.programingSelected,
          estimationBuyingPrice: state.estimationBuyingPrice,
          productBuyingPrice: state.productBuyingPrice,
          totalCriteriaPrice: state.totalCriteriaPrice,
          tradeInProgramId: state.tradeInProgramId,
          currentStore: state.currentStore,
        );
}

final class UpdatePaymentMethodSuccess extends DraftingInvoiceState {
  UpdatePaymentMethodSuccess({
    required DraftingInvoiceState state,
    required super.paymentByCash,
    required super.paymentByTransfer,
    required super.paymentByCredit,
    // required super.paymentByInstallment,
  }) : super(
          currentDraftId: state.currentDraftId,
          employeeSubDetail: state.employeeSubDetail,
          products: state.products,
          billId: state.billId,
          billNumber: state.billNumber,
          orderId: state.orderId,
          customerNote: state.customerNote,
          warrantyNote: state.warrantyNote,
          saleNote: state.saleNote,
          isDefaultInfo: state.isDefaultInfo,
          vatChecked: state.vatChecked,
          isCountPoint: state.isCountPoint,
          customer: state.customer,
          cartType: state.cartType,
          discountTotalBill: state.discountTotalBill,
          couponDiscountCode: state.couponDiscountCode,
          productTradeIn: state.productTradeIn,
          productImei: state.productImei,
          isEstimateCost: state.isEstimateCost,
          isSoldByCompany: state.isSoldByCompany,
          method: state.method,
          totalPriceNoneDiscount: state.totalPriceNoneDiscount,
          totalDiscountPriceOfBillItem: state.totalDiscountPriceOfBillItem,
          finalPrice: state.finalPrice,
          mustPay: state.mustPay,
          discountOfBill: state.discountOfBill,
          totalPrePayment: state.totalPrePayment,
          deliveryFee: state.deliveryFee,
          orderSubDetail: state.orderSubDetail,
          tradeInType: state.tradeInType,
          product: state.product,
          programingSelected: state.programingSelected,
          estimationBuyingPrice: state.estimationBuyingPrice,
          productBuyingPrice: state.productBuyingPrice,
          totalCriteriaPrice: state.totalCriteriaPrice,
          tradeInProgramId: state.tradeInProgramId,
          currentStore: state.currentStore,
        );
}

final class UpdateCouponDiscountSuccess extends DraftingInvoiceState {
  UpdateCouponDiscountSuccess({
    required DraftingInvoiceState state,
    required super.couponDiscountCode,
    required super.discountTotalBill,
  }) : super(
          currentDraftId: state.currentDraftId,
          employeeSubDetail: state.employeeSubDetail,
          products: state.products,
          billId: state.billId,
          billNumber: state.billNumber,
          orderId: state.orderId,
          customerNote: state.customerNote,
          warrantyNote: state.warrantyNote,
          saleNote: state.saleNote,
          isDefaultInfo: state.isDefaultInfo,
          vatChecked: state.vatChecked,
          isCountPoint: state.isCountPoint,
          cartType: state.cartType,
          customer: state.customer,
          productTradeIn: state.productTradeIn,
          productImei: state.productImei,
          isEstimateCost: state.isEstimateCost,
          isSoldByCompany: state.isSoldByCompany,
          method: state.method,
          totalPriceNoneDiscount: state.totalPriceNoneDiscount,
          totalDiscountPriceOfBillItem: state.totalDiscountPriceOfBillItem,
          discountOfBill: state.discountOfBill,
          totalPrePayment: state.totalPrePayment,
          finalPrice: state.finalPrice,
          mustPay: state.mustPay,
          paymentByCash: state.paymentByCash,
          paymentByTransfer: state.paymentByTransfer,
          paymentByCredit: state.paymentByCredit,
          // paymentByInstallment: state.paymentByInstallment,
          deliveryFee: state.deliveryFee,
          orderSubDetail: state.orderSubDetail,
          tradeInType: state.tradeInType,
          product: state.product,
          programingSelected: state.programingSelected,
          estimationBuyingPrice: state.estimationBuyingPrice,
          productBuyingPrice: state.productBuyingPrice,
          totalCriteriaPrice: state.totalCriteriaPrice,
          tradeInProgramId: state.tradeInProgramId,
          currentStore: state.currentStore,
        );
}

final class UpdateAmountDiscountTotalBillSuccess extends DraftingInvoiceState {
  UpdateAmountDiscountTotalBillSuccess({
    required DraftingInvoiceState state,
    required super.discountTotalBill,
  }) : super(
          currentDraftId: state.currentDraftId,
          employeeSubDetail: state.employeeSubDetail,
          products: state.products,
          billId: state.billId,
          billNumber: state.billNumber,
          orderId: state.orderId,
          customerNote: state.customerNote,
          warrantyNote: state.warrantyNote,
          saleNote: state.saleNote,
          isDefaultInfo: state.isDefaultInfo,
          vatChecked: state.vatChecked,
          isCountPoint: state.isCountPoint,
          cartType: state.cartType,
          customer: state.customer,
          couponDiscountCode: null,
          productTradeIn: state.productTradeIn,
          productImei: state.productImei,
          isEstimateCost: state.isEstimateCost,
          isSoldByCompany: state.isSoldByCompany,
          method: state.method,
          totalPriceNoneDiscount: state.totalPriceNoneDiscount,
          totalDiscountPriceOfBillItem: state.totalDiscountPriceOfBillItem,
          discountOfBill: state.discountOfBill,
          totalPrePayment: state.totalPrePayment,
          finalPrice: state.finalPrice,
          mustPay: state.mustPay,
          paymentByCash: state.paymentByCash,
          paymentByTransfer: state.paymentByTransfer,
          paymentByCredit: state.paymentByCredit,
          // paymentByInstallment: state.paymentByInstallment,
          deliveryFee: state.deliveryFee,
          orderSubDetail: state.orderSubDetail,
          tradeInType: state.tradeInType,
          product: state.product,
          programingSelected: state.programingSelected,
          estimationBuyingPrice: state.estimationBuyingPrice,
          productBuyingPrice: state.productBuyingPrice,
          totalCriteriaPrice: state.totalCriteriaPrice,
          tradeInProgramId: state.tradeInProgramId,
          currentStore: state.currentStore,
        );
}

final class UpdateDiscountBillByPointSuccess extends DraftingInvoiceState {
  UpdateDiscountBillByPointSuccess({
    required DraftingInvoiceState state,
    required super.discountTotalBillByPoint,
  }) : super(
          currentDraftId: state.currentDraftId,
          employeeSubDetail: state.employeeSubDetail,
          products: state.products,
          billId: state.billId,
          billNumber: state.billNumber,
          orderId: state.orderId,
          customerNote: state.customerNote,
          warrantyNote: state.warrantyNote,
          saleNote: state.saleNote,
          discountTotalBill: state.discountTotalBill,
          isDefaultInfo: state.isDefaultInfo,
          vatChecked: state.vatChecked,
          isCountPoint: state.isCountPoint,
          cartType: state.cartType,
          customer: state.customer,
          couponDiscountCode: null,
          productTradeIn: state.productTradeIn,
          productImei: state.productImei,
          isEstimateCost: state.isEstimateCost,
          isSoldByCompany: state.isSoldByCompany,
          method: state.method,
          totalPriceNoneDiscount: state.totalPriceNoneDiscount,
          totalDiscountPriceOfBillItem: state.totalDiscountPriceOfBillItem,
          discountOfBill: state.discountOfBill,
          totalPrePayment: state.totalPrePayment,
          finalPrice: state.finalPrice,
          mustPay: state.mustPay,
          paymentByCash: state.paymentByCash,
          paymentByTransfer: state.paymentByTransfer,
          paymentByCredit: state.paymentByCredit,
          // paymentByInstallment: state.paymentByInstallment,
          deliveryFee: state.deliveryFee,
          orderSubDetail: state.orderSubDetail,
          tradeInType: state.tradeInType,
          product: state.product,
          programingSelected: state.programingSelected,
          estimationBuyingPrice: state.estimationBuyingPrice,
          productBuyingPrice: state.productBuyingPrice,
          totalCriteriaPrice: state.totalCriteriaPrice,
          tradeInProgramId: state.tradeInProgramId,
          currentStore: state.currentStore,
        );
}

///cập nhật state này nếu những thứ ảnh hưởng tới giá như:
///   GetCurrentDraftDataSuccess,
///   UpdateProductsSuccess,
///   UpdatePaymentMethodSuccess,
///   UpdateCouponDiscountSuccess,
///   UpdateAmountDiscountTotalBillSuccess,
///   UpdateDeliveryFeeSuccess,
final class UpdateCalculatorPriceSuccess extends DraftingInvoiceState {
  UpdateCalculatorPriceSuccess({
    required DraftingInvoiceState state,
    required super.totalPriceNoneDiscount,
    required super.totalDiscountPriceOfBillItem,
    required super.discountOfBill,
    required super.totalPrePayment,
    required super.finalPrice,
    required super.mustPay,
  }) : super(
          currentDraftId: state.currentDraftId,
          employeeSubDetail: state.employeeSubDetail,
          customer: state.customer,
          products: state.products,
          billId: state.billId,
          billNumber: state.billNumber,
          orderId: state.orderId,
          customerNote: state.customerNote,
          warrantyNote: state.warrantyNote,
          saleNote: state.saleNote,
          isDefaultInfo: state.isDefaultInfo,
          vatChecked: state.vatChecked,
          isCountPoint: state.isCountPoint,
          cartType: state.cartType,
          discountTotalBill: state.discountTotalBill,
          couponDiscountCode: state.couponDiscountCode,
          productTradeIn: state.productTradeIn,
          productImei: state.productImei,
          isEstimateCost: state.isEstimateCost,
          isSoldByCompany: state.isSoldByCompany,
          method: state.method,
          paymentByCash: state.paymentByCash,
          paymentByTransfer: state.paymentByTransfer,
          paymentByCredit: state.paymentByCredit,
          // paymentByInstallment: state.paymentByInstallment,
          deliveryFee: state.deliveryFee,
          orderSubDetail: state.orderSubDetail,
          tradeInType: state.tradeInType,
          product: state.product,
          programingSelected: state.programingSelected,
          estimationBuyingPrice: state.estimationBuyingPrice,
          productBuyingPrice: state.productBuyingPrice,
          totalCriteriaPrice: state.totalCriteriaPrice,
          tradeInProgramId: state.tradeInProgramId,
          currentStore: state.currentStore,
        );
}

final class CreateBillSuccess extends DraftingInvoiceState {
  final String id;

  CreateBillSuccess({required this.id})
      : super(
          totalPriceNoneDiscount: 0,
          totalDiscountPriceOfBillItem: 0,
          discountOfBill: 0,
          totalPrePayment: 0,
          finalPrice: 0,
          mustPay: 0,
          tradeInType: TradeInType.tradeIn,
          programingSelected: const {},
          estimationBuyingPrice: 0,
          productBuyingPrice: 0,
          totalCriteriaPrice: 0,
          employeeSubDetail: EmployeeSubDetailModel(),
        );
}

final class CreateOrderSuccess extends DraftingInvoiceState {
  final int newBillNum;

  CreateOrderSuccess({required this.newBillNum})
      : super(
          totalPriceNoneDiscount: 0,
          totalDiscountPriceOfBillItem: 0,
          discountOfBill: 0,
          totalPrePayment: 0,
          finalPrice: 0,
          mustPay: 0,
          tradeInType: TradeInType.tradeIn,
          programingSelected: const {},
          estimationBuyingPrice: 0,
          productBuyingPrice: 0,
          totalCriteriaPrice: 0,
          employeeSubDetail: EmployeeSubDetailModel(),
        );
}

final class UpdateDeliveryFeeSuccess extends DraftingInvoiceState {
  UpdateDeliveryFeeSuccess({
    required DraftingInvoiceState state,
    required super.deliveryFee,
  }) : super(
          currentDraftId: state.currentDraftId,
          products: state.products,
          employeeSubDetail: state.employeeSubDetail,
          billId: state.billId,
          billNumber: state.billNumber,
          orderId: state.orderId,
          customerNote: state.customerNote,
          warrantyNote: state.warrantyNote,
          saleNote: state.saleNote,
          discountTotalBill: state.discountTotalBill,
          isDefaultInfo: state.isDefaultInfo,
          vatChecked: state.vatChecked,
          isCountPoint: state.isCountPoint,
          cartType: state.cartType,
          customer: state.customer,
          couponDiscountCode: null,
          productTradeIn: state.productTradeIn,
          productImei: state.productImei,
          isEstimateCost: state.isEstimateCost,
          isSoldByCompany: state.isSoldByCompany,
          method: state.method,
          totalPriceNoneDiscount: state.totalPriceNoneDiscount,
          totalDiscountPriceOfBillItem: state.totalDiscountPriceOfBillItem,
          discountOfBill: state.discountOfBill,
          totalPrePayment: state.totalPrePayment,
          finalPrice: state.finalPrice,
          mustPay: state.mustPay,
          paymentByCash: state.paymentByCash,
          paymentByTransfer: state.paymentByTransfer,
          paymentByCredit: state.paymentByCredit,
          // paymentByInstallment: state.paymentByInstallment,
          orderSubDetail: state.orderSubDetail,
          tradeInType: state.tradeInType,
          product: state.product,
          programingSelected: state.programingSelected,
          estimationBuyingPrice: state.estimationBuyingPrice,
          productBuyingPrice: state.productBuyingPrice,
          totalCriteriaPrice: state.totalCriteriaPrice,
          tradeInProgramId: state.tradeInProgramId,
          currentStore: state.currentStore,
        );
}

final class UpdateOrderSubDetailSuccess extends DraftingInvoiceState {
  UpdateOrderSubDetailSuccess({
    required DraftingInvoiceState state,
    required super.orderSubDetail,
  }) : super(
          currentDraftId: state.currentDraftId,
          products: state.products,
          employeeSubDetail: state.employeeSubDetail,
          billId: state.billId,
          billNumber: state.billNumber,
          orderId: state.orderId,
          customerNote: state.customerNote,
          warrantyNote: state.warrantyNote,
          saleNote: state.saleNote,
          discountTotalBill: state.discountTotalBill,
          isDefaultInfo: state.isDefaultInfo,
          vatChecked: state.vatChecked,
          isCountPoint: state.isCountPoint,
          cartType: state.cartType,
          customer: state.customer,
          couponDiscountCode: null,
          productTradeIn: state.productTradeIn,
          productImei: state.productImei,
          isEstimateCost: state.isEstimateCost,
          isSoldByCompany: state.isSoldByCompany,
          method: state.method,
          totalPriceNoneDiscount: state.totalPriceNoneDiscount,
          totalDiscountPriceOfBillItem: state.totalDiscountPriceOfBillItem,
          discountOfBill: state.discountOfBill,
          totalPrePayment: state.totalPrePayment,
          finalPrice: state.finalPrice,
          mustPay: state.mustPay,
          paymentByCash: state.paymentByCash,
          paymentByTransfer: state.paymentByTransfer,
          paymentByCredit: state.paymentByCredit,
          // paymentByInstallment: state.paymentByInstallment,
          deliveryFee: state.deliveryFee,
          tradeInType: state.tradeInType,
          product: state.product,
          programingSelected: state.programingSelected,
          estimationBuyingPrice: state.estimationBuyingPrice,
          productBuyingPrice: state.productBuyingPrice,
          totalCriteriaPrice: state.totalCriteriaPrice,
          tradeInProgramId: state.tradeInProgramId,
          currentStore: state.currentStore,
        );
}

/// for tradein

final class UpdateTradeInTypeSuccess extends DraftingInvoiceState {
  UpdateTradeInTypeSuccess({
    required DraftingInvoiceState state,
    required super.tradeInType,
  }) : super(
          currentDraftId: state.currentDraftId,
          products: state.products,
          employeeSubDetail: state.employeeSubDetail,
          billId: state.billId,
          billNumber: state.billNumber,
          orderId: state.orderId,
          customerNote: state.customerNote,
          warrantyNote: state.warrantyNote,
          saleNote: state.saleNote,
          discountTotalBill: state.discountTotalBill,
          isDefaultInfo: state.isDefaultInfo,
          vatChecked: state.vatChecked,
          isCountPoint: state.isCountPoint,
          cartType: state.cartType,
          customer: state.customer,
          couponDiscountCode: null,
          productTradeIn: state.productTradeIn,
          productImei: state.productImei,
          isEstimateCost: state.isEstimateCost,
          isSoldByCompany: state.isSoldByCompany,
          method: state.method,
          totalPriceNoneDiscount: state.totalPriceNoneDiscount,
          totalDiscountPriceOfBillItem: state.totalDiscountPriceOfBillItem,
          discountOfBill: state.discountOfBill,
          totalPrePayment: state.totalPrePayment,
          finalPrice: state.finalPrice,
          mustPay: state.mustPay,
          paymentByCash: state.paymentByCash,
          paymentByTransfer: state.paymentByTransfer,
          paymentByCredit: state.paymentByCredit,
          // paymentByInstallment: state.paymentByInstallment,
          deliveryFee: state.deliveryFee,
          orderSubDetail: state.orderSubDetail,
          product: state.product,
          programingSelected: state.programingSelected,
          estimationBuyingPrice: state.estimationBuyingPrice,
          productBuyingPrice: state.productBuyingPrice,
          totalCriteriaPrice: state.totalCriteriaPrice,
          tradeInProgramId: state.tradeInProgramId,
          currentStore: state.currentStore,
        );
}

final class UpdateProductTradeInSuccess extends DraftingInvoiceState {
  UpdateProductTradeInSuccess({
    required DraftingInvoiceState state,
    required super.product,
  }) : super(
          currentDraftId: state.currentDraftId,
          products: state.products,
          employeeSubDetail: state.employeeSubDetail,
          billId: state.billId,
          billNumber: state.billNumber,
          orderId: state.orderId,
          customerNote: state.customerNote,
          warrantyNote: state.warrantyNote,
          saleNote: state.saleNote,
          discountTotalBill: state.discountTotalBill,
          isDefaultInfo: state.isDefaultInfo,
          vatChecked: state.vatChecked,
          isCountPoint: state.isCountPoint,
          cartType: state.cartType,
          customer: state.customer,
          couponDiscountCode: null,
          productTradeIn: state.productTradeIn,
          productImei: state.productImei,
          isEstimateCost: state.isEstimateCost,
          isSoldByCompany: state.isSoldByCompany,
          method: state.method,
          totalPriceNoneDiscount: state.totalPriceNoneDiscount,
          totalDiscountPriceOfBillItem: state.totalDiscountPriceOfBillItem,
          discountOfBill: state.discountOfBill,
          totalPrePayment: state.totalPrePayment,
          finalPrice: state.finalPrice,
          mustPay: state.mustPay,
          paymentByCash: state.paymentByCash,
          paymentByTransfer: state.paymentByTransfer,
          paymentByCredit: state.paymentByCredit,
          // paymentByInstallment: state.paymentByInstallment,
          deliveryFee: state.deliveryFee,
          orderSubDetail: state.orderSubDetail,
          tradeInType: state.tradeInType,
          programingSelected: state.programingSelected,
          estimationBuyingPrice: state.estimationBuyingPrice,
          productBuyingPrice: state.productBuyingPrice,
          totalCriteriaPrice: state.totalCriteriaPrice,
          tradeInProgramId: state.tradeInProgramId,
          currentStore: state.currentStore,
        );
}

final class UpdateTradeInProgramSelectedSuccess extends DraftingInvoiceState {
  UpdateTradeInProgramSelectedSuccess({
    required DraftingInvoiceState state,
    required super.programingSelected,
  }) : super(
          currentDraftId: state.currentDraftId,
          products: state.products,
          employeeSubDetail: state.employeeSubDetail,
          billId: state.billId,
          billNumber: state.billNumber,
          orderId: state.orderId,
          customerNote: state.customerNote,
          warrantyNote: state.warrantyNote,
          saleNote: state.saleNote,
          discountTotalBill: state.discountTotalBill,
          isDefaultInfo: state.isDefaultInfo,
          vatChecked: state.vatChecked,
          isCountPoint: state.isCountPoint,
          cartType: state.cartType,
          customer: state.customer,
          couponDiscountCode: null,
          productTradeIn: state.productTradeIn,
          productImei: state.productImei,
          isEstimateCost: state.isEstimateCost,
          isSoldByCompany: state.isSoldByCompany,
          method: state.method,
          totalPriceNoneDiscount: state.totalPriceNoneDiscount,
          totalDiscountPriceOfBillItem: state.totalDiscountPriceOfBillItem,
          discountOfBill: state.discountOfBill,
          totalPrePayment: state.totalPrePayment,
          finalPrice: state.finalPrice,
          mustPay: state.mustPay,
          paymentByCash: state.paymentByCash,
          paymentByTransfer: state.paymentByTransfer,
          paymentByCredit: state.paymentByCredit,
          // paymentByInstallment: state.paymentByInstallment,
          deliveryFee: state.deliveryFee,
          orderSubDetail: state.orderSubDetail,
          tradeInType: state.tradeInType,
          product: state.product,
          estimationBuyingPrice: state.estimationBuyingPrice,
          productBuyingPrice: state.productBuyingPrice,
          totalCriteriaPrice: state.totalCriteriaPrice,
          tradeInProgramId: state.tradeInProgramId,
          currentStore: state.currentStore,
        );
}

final class UpdatePriceOverViewTradeInSuccess extends DraftingInvoiceState {
  UpdatePriceOverViewTradeInSuccess({
    required DraftingInvoiceState state,
    required super.estimationBuyingPrice,
    required super.productBuyingPrice,
    required super.totalCriteriaPrice,
  }) : super(
          currentDraftId: state.currentDraftId,
          products: state.products,
          employeeSubDetail: state.employeeSubDetail,
          billId: state.billId,
          billNumber: state.billNumber,
          orderId: state.orderId,
          customerNote: state.customerNote,
          warrantyNote: state.warrantyNote,
          saleNote: state.saleNote,
          discountTotalBill: state.discountTotalBill,
          isDefaultInfo: state.isDefaultInfo,
          vatChecked: state.vatChecked,
          isCountPoint: state.isCountPoint,
          cartType: state.cartType,
          customer: state.customer,
          couponDiscountCode: null,
          productTradeIn: state.productTradeIn,
          productImei: state.productImei,
          isEstimateCost: state.isEstimateCost,
          isSoldByCompany: state.isSoldByCompany,
          method: state.method,
          totalPriceNoneDiscount: state.totalPriceNoneDiscount,
          totalDiscountPriceOfBillItem: state.totalDiscountPriceOfBillItem,
          discountOfBill: state.discountOfBill,
          totalPrePayment: state.totalPrePayment,
          finalPrice: state.finalPrice,
          mustPay: state.mustPay,
          paymentByCash: state.paymentByCash,
          paymentByTransfer: state.paymentByTransfer,
          paymentByCredit: state.paymentByCredit,
          // paymentByInstallment: state.paymentByInstallment,
          deliveryFee: state.deliveryFee,
          orderSubDetail: state.orderSubDetail,
          tradeInType: state.tradeInType,
          product: state.product,
          programingSelected: state.programingSelected,
          tradeInProgramId: state.tradeInProgramId,
          currentStore: state.currentStore,
        );
}

final class UpdateTradeInProgram extends DraftingInvoiceState {
  UpdateTradeInProgram({
    required DraftingInvoiceState state,
    required super.tradeInProgramId,
  }) : super(
          currentDraftId: state.currentDraftId,
          products: state.products,
          employeeSubDetail: state.employeeSubDetail,
          billId: state.billId,
          billNumber: state.billNumber,
          orderId: state.orderId,
          customerNote: state.customerNote,
          warrantyNote: state.warrantyNote,
          saleNote: state.saleNote,
          discountTotalBill: state.discountTotalBill,
          isDefaultInfo: state.isDefaultInfo,
          vatChecked: state.vatChecked,
          isCountPoint: state.isCountPoint,
          cartType: state.cartType,
          customer: state.customer,
          couponDiscountCode: null,
          productTradeIn: state.productTradeIn,
          productImei: state.productImei,
          isEstimateCost: state.isEstimateCost,
          isSoldByCompany: state.isSoldByCompany,
          method: state.method,
          totalPriceNoneDiscount: state.totalPriceNoneDiscount,
          totalDiscountPriceOfBillItem: state.totalDiscountPriceOfBillItem,
          discountOfBill: state.discountOfBill,
          totalPrePayment: state.totalPrePayment,
          finalPrice: state.finalPrice,
          mustPay: state.mustPay,
          paymentByCash: state.paymentByCash,
          paymentByTransfer: state.paymentByTransfer,
          paymentByCredit: state.paymentByCredit,
          // paymentByInstallment: state.paymentByInstallment,
          deliveryFee: state.deliveryFee,
          orderSubDetail: state.orderSubDetail,
          tradeInType: state.tradeInType,
          product: state.product,
          programingSelected: state.programingSelected,
          estimationBuyingPrice: state.estimationBuyingPrice,
          productBuyingPrice: state.productBuyingPrice,
          totalCriteriaPrice: state.totalCriteriaPrice,
          currentStore: state.currentStore,
        );
}

final class CreateTradeInbillSuccess extends DraftingInvoiceState {
  CreateTradeInbillSuccess({required DraftingInvoiceState state})
      : super(
          totalPriceNoneDiscount: 0,
          totalDiscountPriceOfBillItem: 0,
          discountOfBill: 0,
          totalPrePayment: 0,
          finalPrice: 0,
          mustPay: 0,
          tradeInType: TradeInType.tradeIn,
          programingSelected: const {},
          estimationBuyingPrice: 0,
          productBuyingPrice: 0,
          totalCriteriaPrice: 0,
          employeeSubDetail: EmployeeSubDetailModel(),
        );
}

final class AddProductFromSearchToCartSuccess extends DraftingInvoiceState {
  AddProductFromSearchToCartSuccess({required DraftingInvoiceState state})
      : super(
          currentDraftId: state.currentDraftId,
          products: state.products,
          employeeSubDetail: state.employeeSubDetail,
          billId: state.billId,
          billNumber: state.billNumber,
          orderId: state.orderId,
          customerNote: state.customerNote,
          warrantyNote: state.warrantyNote,
          saleNote: state.saleNote,
          discountTotalBill: state.discountTotalBill,
          isDefaultInfo: state.isDefaultInfo,
          vatChecked: state.vatChecked,
          isCountPoint: state.isCountPoint,
          cartType: state.cartType,
          customer: state.customer,
          couponDiscountCode: null,
          productTradeIn: state.productTradeIn,
          productImei: state.productImei,
          isEstimateCost: state.isEstimateCost,
          isSoldByCompany: state.isSoldByCompany,
          method: state.method,
          totalPriceNoneDiscount: state.totalPriceNoneDiscount,
          totalDiscountPriceOfBillItem: state.totalDiscountPriceOfBillItem,
          discountOfBill: state.discountOfBill,
          totalPrePayment: state.totalPrePayment,
          finalPrice: state.finalPrice,
          mustPay: state.mustPay,
          paymentByCash: state.paymentByCash,
          paymentByTransfer: state.paymentByTransfer,
          paymentByCredit: state.paymentByCredit,
          // paymentByInstallment: state.paymentByInstallment,
          deliveryFee: state.deliveryFee,
          orderSubDetail: state.orderSubDetail,
          tradeInType: state.tradeInType,
          product: state.product,
          programingSelected: state.programingSelected,
          estimationBuyingPrice: state.estimationBuyingPrice,
          productBuyingPrice: state.productBuyingPrice,
          totalCriteriaPrice: state.totalCriteriaPrice,
          tradeInProgramId: state.tradeInProgramId,
          currentStore: state.currentStore,
        );
}

final class UpdateCurrentStoreSuccess extends DraftingInvoiceState {
  UpdateCurrentStoreSuccess({
    required DraftingInvoiceState state,
    required super.currentStore,
  }) : super(
          currentDraftId: state.currentDraftId,
          products: state.products,
          employeeSubDetail: state.employeeSubDetail,
          billId: state.billId,
          billNumber: state.billNumber,
          orderId: state.orderId,
          customerNote: state.customerNote,
          warrantyNote: state.warrantyNote,
          saleNote: state.saleNote,
          discountTotalBill: state.discountTotalBill,
          isDefaultInfo: state.isDefaultInfo,
          vatChecked: state.vatChecked,
          isCountPoint: state.isCountPoint,
          cartType: state.cartType,
          customer: state.customer,
          couponDiscountCode: null,
          productTradeIn: state.productTradeIn,
          productImei: state.productImei,
          isEstimateCost: state.isEstimateCost,
          isSoldByCompany: state.isSoldByCompany,
          method: state.method,
          totalPriceNoneDiscount: state.totalPriceNoneDiscount,
          totalDiscountPriceOfBillItem: state.totalDiscountPriceOfBillItem,
          discountOfBill: state.discountOfBill,
          totalPrePayment: state.totalPrePayment,
          finalPrice: state.finalPrice,
          mustPay: state.mustPay,
          paymentByCash: state.paymentByCash,
          paymentByTransfer: state.paymentByTransfer,
          paymentByCredit: state.paymentByCredit,
          // paymentByInstallment: state.paymentByInstallment,
          deliveryFee: state.deliveryFee,
          orderSubDetail: state.orderSubDetail,
          tradeInType: state.tradeInType,
          product: state.product,
          programingSelected: state.programingSelected,
          estimationBuyingPrice: state.estimationBuyingPrice,
          productBuyingPrice: state.productBuyingPrice,
          totalCriteriaPrice: state.totalCriteriaPrice,
          tradeInProgramId: state.tradeInProgramId,
        );
}

final class UpdateEmployeeSubDetailSuccess extends DraftingInvoiceState {
  UpdateEmployeeSubDetailSuccess({
    required DraftingInvoiceState state,
    required super.employeeSubDetail,
  }) : super(
          currentDraftId: state.currentDraftId,
          products: state.products,
          billId: state.billId,
          billNumber: state.billNumber,
          orderId: state.orderId,
          customerNote: state.customerNote,
          warrantyNote: state.warrantyNote,
          saleNote: state.saleNote,
          discountTotalBill: state.discountTotalBill,
          isDefaultInfo: state.isDefaultInfo,
          vatChecked: state.vatChecked,
          isCountPoint: state.isCountPoint,
          cartType: state.cartType,
          customer: state.customer,
          couponDiscountCode: null,
          productTradeIn: state.productTradeIn,
          productImei: state.productImei,
          isEstimateCost: state.isEstimateCost,
          isSoldByCompany: state.isSoldByCompany,
          method: state.method,
          totalPriceNoneDiscount: state.totalPriceNoneDiscount,
          totalDiscountPriceOfBillItem: state.totalDiscountPriceOfBillItem,
          discountOfBill: state.discountOfBill,
          totalPrePayment: state.totalPrePayment,
          finalPrice: state.finalPrice,
          mustPay: state.mustPay,
          paymentByCash: state.paymentByCash,
          paymentByTransfer: state.paymentByTransfer,
          paymentByCredit: state.paymentByCredit,
          // paymentByInstallment: state.paymentByInstallment,
          deliveryFee: state.deliveryFee,
          orderSubDetail: state.orderSubDetail,
          tradeInType: state.tradeInType,
          product: state.product,
          programingSelected: state.programingSelected,
          estimationBuyingPrice: state.estimationBuyingPrice,
          productBuyingPrice: state.productBuyingPrice,
          totalCriteriaPrice: state.totalCriteriaPrice,
          tradeInProgramId: state.tradeInProgramId,
          currentStore: state.currentStore,
        );
}
