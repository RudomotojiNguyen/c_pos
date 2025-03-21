part of 'drafting_invoice_bloc.dart';

@immutable
sealed class DraftingInvoiceState extends Equatable {
  const DraftingInvoiceState({
    required this.draftingInvoiceList,
    this.cartType,
    required this.products,
    this.orderId,
    this.customer,
    this.currentDraftId,
    this.saleInfo,
    this.technicalInfo,
    this.warrantyNote,
    this.saleNote,
    this.deliveryFee,
    this.orderSubDetail,
    this.discountTotalBill,
    this.couponDiscountCode,
    this.discountTotalBillByPoint,
    this.mustPay = 0,
    this.totalPriceNoneDiscount = 0,
    this.totalDiscountPriceOfBillItem = 0,
    this.discountOfBill = 0,
    this.totalPrePayment = 0,
    this.finalPrice = 0,
    this.paymentByCash = const [],
    this.paymentByTransfer = const [],
    this.paymentByCredit = const [],
    this.paymentByInstallment = const [],
    this.productBuyingPrice = 0,
    this.finalBuyingPrice = 0,
    this.totalCriteriaPrice = 0,
    this.tradeInType = TradeInType.tradeIn,
  });

  final List<DraftingInvoiceTable> draftingInvoiceList;

  /// chi tiết đơn nháp
  final int? currentDraftId;
  final CartType? cartType;
  final List<ProductTable> products;
  final int? orderId;
  final CustomerTable? customer;
  final EmployeeModel? saleInfo;
  final EmployeeModel? technicalInfo;
  final String? warrantyNote;
  final String? saleNote;
  final DeliveryFeeModel? deliveryFee;
  final OrderSubDetailModel? orderSubDetail;
  final double? discountTotalBill;
  final String? couponDiscountCode;
  final OtpCustomerPointModel? discountTotalBillByPoint;

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
  final List<PaymentMethodTable>? paymentByInstallment;

  /// trade in
  final double productBuyingPrice; // giá thu lại
  final double finalBuyingPrice; //Giá thu dự kiến
  final double totalCriteriaPrice; //Tổng tiền trừ hao
  final TradeInType tradeInType;

  @override
  List<Object?> get props => [
        draftingInvoiceList,
        currentDraftId,
        products,
        totalPriceNoneDiscount,
        totalDiscountPriceOfBillItem,
        discountOfBill,
        totalPrePayment,
        finalPrice,
        mustPay,
        customer,
        saleInfo,
        technicalInfo,
        discountTotalBillByPoint,
        cartType,
        orderSubDetail,
        discountTotalBill,
        couponDiscountCode,
        paymentByCash,
        paymentByTransfer,
        paymentByCredit,
        paymentByInstallment,
        productBuyingPrice,
        finalBuyingPrice,
        totalCriteriaPrice,
        tradeInType,
        warrantyNote,
        saleNote,
        deliveryFee,
        orderId,
      ];

  bool get checkNullDraft => currentDraftId == null;

  int get getCustomerFee => deliveryFee?.customerFee ?? 0;

  int get getShippingCompanyFee => deliveryFee?.shippingCompanyFee ?? 0;

  // /// số tiền được giảm khi dùng điểm
  double get discountOfPoint => (discountTotalBillByPoint?.isValidOTP ?? false)
      ? (discountTotalBillByPoint?.amountTransferFromPoint ?? 0)
      : 0;
}

final class DraftingInvoiceInitial extends DraftingInvoiceState {
  const DraftingInvoiceInitial({
    required super.draftingInvoiceList,
    required super.products,
  });
}

/// start: danh sách đơn nháp
final class GetDraftingInvoiceLoading extends DraftingInvoiceState {
  GetDraftingInvoiceLoading({
    required DraftingInvoiceState state,
  }) : super(
          draftingInvoiceList: state.draftingInvoiceList,
          currentDraftId: state.currentDraftId,
          products: state.products,
          totalPriceNoneDiscount: state.totalPriceNoneDiscount,
          totalDiscountPriceOfBillItem: state.totalDiscountPriceOfBillItem,
          discountOfBill: state.discountOfBill,
          totalPrePayment: state.totalPrePayment,
          finalPrice: state.finalPrice,
          mustPay: state.mustPay,
          customer: state.customer,
          saleInfo: state.saleInfo,
          technicalInfo: state.technicalInfo,
          discountTotalBillByPoint: state.discountTotalBillByPoint,
          cartType: state.cartType,
          orderSubDetail: state.orderSubDetail,
          discountTotalBill: state.discountTotalBill,
          couponDiscountCode: state.couponDiscountCode,
          paymentByCash: state.paymentByCash,
          paymentByTransfer: state.paymentByTransfer,
          paymentByCredit: state.paymentByCredit,
          paymentByInstallment: state.paymentByInstallment,
          productBuyingPrice: state.productBuyingPrice,
          finalBuyingPrice: state.finalBuyingPrice,
          totalCriteriaPrice: state.totalCriteriaPrice,
          tradeInType: state.tradeInType,
          warrantyNote: state.warrantyNote,
          saleNote: state.saleNote,
          deliveryFee: state.deliveryFee,
          orderId: state.orderId,
        );
}

final class GetDraftingInvoiceError extends DraftingInvoiceState {
  GetDraftingInvoiceError({
    required DraftingInvoiceState state,
  }) : super(
          draftingInvoiceList: [],
          products: [],
        );
}

final class GetDraftingInvoiceSuccess extends DraftingInvoiceState {
  GetDraftingInvoiceSuccess({
    required DraftingInvoiceState state,
    required super.draftingInvoiceList,
  }) : super(
          currentDraftId: state.currentDraftId,
          products: state.products,
          totalPriceNoneDiscount: state.totalPriceNoneDiscount,
          totalDiscountPriceOfBillItem: state.totalDiscountPriceOfBillItem,
          discountOfBill: state.discountOfBill,
          totalPrePayment: state.totalPrePayment,
          finalPrice: state.finalPrice,
          mustPay: state.mustPay,
          customer: state.customer,
          saleInfo: state.saleInfo,
          technicalInfo: state.technicalInfo,
          discountTotalBillByPoint: state.discountTotalBillByPoint,
          cartType: state.cartType,
          orderSubDetail: state.orderSubDetail,
          discountTotalBill: state.discountTotalBill,
          couponDiscountCode: state.couponDiscountCode,
          paymentByCash: state.paymentByCash,
          paymentByTransfer: state.paymentByTransfer,
          paymentByCredit: state.paymentByCredit,
          paymentByInstallment: state.paymentByInstallment,
          productBuyingPrice: state.productBuyingPrice,
          finalBuyingPrice: state.finalBuyingPrice,
          totalCriteriaPrice: state.totalCriteriaPrice,
          tradeInType: state.tradeInType,
          warrantyNote: state.warrantyNote,
          saleNote: state.saleNote,
          deliveryFee: state.deliveryFee,
          orderId: state.orderId,
        );
}

/// end: danh sách đơn nháp

final class DraftingInvoiceCreated extends DraftingInvoiceState {
  final int id;
  DraftingInvoiceCreated({
    required DraftingInvoiceState state,
    required this.id,
  }) : super(
          draftingInvoiceList: [],
          products: [],
        );
}

/// start: chi tiết đơn nháp

class GetDraftingInvoiceDetailLoading extends DraftingInvoiceState {
  GetDraftingInvoiceDetailLoading({
    required DraftingInvoiceState state,
  }) : super(
          draftingInvoiceList: state.draftingInvoiceList,
          currentDraftId: state.currentDraftId,
          products: state.products,
          totalPriceNoneDiscount: state.totalPriceNoneDiscount,
          totalDiscountPriceOfBillItem: state.totalDiscountPriceOfBillItem,
          discountOfBill: state.discountOfBill,
          totalPrePayment: state.totalPrePayment,
          finalPrice: state.finalPrice,
          mustPay: state.mustPay,
          customer: state.customer,
          saleInfo: state.saleInfo,
          technicalInfo: state.technicalInfo,
          discountTotalBillByPoint: state.discountTotalBillByPoint,
          cartType: state.cartType,
          orderSubDetail: state.orderSubDetail,
          discountTotalBill: state.discountTotalBill,
          couponDiscountCode: state.couponDiscountCode,
          paymentByCash: state.paymentByCash,
          paymentByTransfer: state.paymentByTransfer,
          paymentByCredit: state.paymentByCredit,
          paymentByInstallment: state.paymentByInstallment,
          productBuyingPrice: state.productBuyingPrice,
          finalBuyingPrice: state.finalBuyingPrice,
          totalCriteriaPrice: state.totalCriteriaPrice,
          tradeInType: state.tradeInType,
          warrantyNote: state.warrantyNote,
          saleNote: state.saleNote,
          deliveryFee: state.deliveryFee,
          orderId: state.orderId,
        );
}

class GetDraftingInvoiceDetailError extends DraftingInvoiceState {
  GetDraftingInvoiceDetailError({
    required DraftingInvoiceState state,
  }) : super(
          draftingInvoiceList: state.draftingInvoiceList,
          currentDraftId: state.currentDraftId,
          products: state.products,
          totalPriceNoneDiscount: state.totalPriceNoneDiscount,
          totalDiscountPriceOfBillItem: state.totalDiscountPriceOfBillItem,
          discountOfBill: state.discountOfBill,
          totalPrePayment: state.totalPrePayment,
          finalPrice: state.finalPrice,
          mustPay: state.mustPay,
          customer: state.customer,
          saleInfo: state.saleInfo,
          technicalInfo: state.technicalInfo,
          discountTotalBillByPoint: state.discountTotalBillByPoint,
          cartType: state.cartType,
          orderSubDetail: state.orderSubDetail,
          discountTotalBill: state.discountTotalBill,
          couponDiscountCode: state.couponDiscountCode,
          paymentByCash: state.paymentByCash,
          paymentByTransfer: state.paymentByTransfer,
          paymentByCredit: state.paymentByCredit,
          paymentByInstallment: state.paymentByInstallment,
          productBuyingPrice: state.productBuyingPrice,
          finalBuyingPrice: state.finalBuyingPrice,
          totalCriteriaPrice: state.totalCriteriaPrice,
          tradeInType: state.tradeInType,
          warrantyNote: state.warrantyNote,
          saleNote: state.saleNote,
          deliveryFee: state.deliveryFee,
          orderId: state.orderId,
        );
}

class GetDraftingInvoiceDetailSuccess extends DraftingInvoiceState {
  GetDraftingInvoiceDetailSuccess({
    required DraftingInvoiceState state,
    required super.cartType,
    required super.products,
    super.orderId,
    super.customer,
    super.currentDraftId,
    super.saleInfo,
    super.technicalInfo,
    super.warrantyNote,
    super.saleNote,
    super.deliveryFee,
    super.orderSubDetail,
    super.discountTotalBill,
    super.couponDiscountCode,
    super.discountTotalBillByPoint,
    super.mustPay,
    super.totalPriceNoneDiscount,
    super.totalDiscountPriceOfBillItem,
    super.discountOfBill,
    super.totalPrePayment,
    super.finalPrice,
    super.paymentByCash,
    super.paymentByTransfer,
    super.paymentByCredit,
    super.paymentByInstallment,
    super.productBuyingPrice,
    super.finalBuyingPrice,
    super.totalCriteriaPrice,
    super.tradeInType,
  }) : super(
          draftingInvoiceList: state.draftingInvoiceList,
        );
}

class UpdateCustomerSuccess extends DraftingInvoiceState {
  UpdateCustomerSuccess({
    required DraftingInvoiceState state,
    required super.customer,
  }) : super(
          draftingInvoiceList: state.draftingInvoiceList,
          currentDraftId: state.currentDraftId,
          products: state.products,
          totalPriceNoneDiscount: state.totalPriceNoneDiscount,
          totalDiscountPriceOfBillItem: state.totalDiscountPriceOfBillItem,
          discountOfBill: state.discountOfBill,
          totalPrePayment: state.totalPrePayment,
          finalPrice: state.finalPrice,
          mustPay: state.mustPay,
          saleInfo: state.saleInfo,
          technicalInfo: state.technicalInfo,
          discountTotalBillByPoint: state.discountTotalBillByPoint,
          cartType: state.cartType,
          orderSubDetail: state.orderSubDetail,
          discountTotalBill: state.discountTotalBill,
          couponDiscountCode: state.couponDiscountCode,
          paymentByCash: state.paymentByCash,
          paymentByTransfer: state.paymentByTransfer,
          paymentByCredit: state.paymentByCredit,
          paymentByInstallment: state.paymentByInstallment,
          productBuyingPrice: state.productBuyingPrice,
          finalBuyingPrice: state.finalBuyingPrice,
          totalCriteriaPrice: state.totalCriteriaPrice,
          tradeInType: state.tradeInType,
          warrantyNote: state.warrantyNote,
          saleNote: state.saleNote,
          deliveryFee: state.deliveryFee,
          orderId: state.orderId,
        );
}

class UpdateSaleInfoSuccess extends DraftingInvoiceState {
  UpdateSaleInfoSuccess({
    required DraftingInvoiceState state,
    required super.saleInfo,
  }) : super(
          draftingInvoiceList: state.draftingInvoiceList,
          currentDraftId: state.currentDraftId,
          products: state.products,
          totalPriceNoneDiscount: state.totalPriceNoneDiscount,
          totalDiscountPriceOfBillItem: state.totalDiscountPriceOfBillItem,
          discountOfBill: state.discountOfBill,
          totalPrePayment: state.totalPrePayment,
          finalPrice: state.finalPrice,
          mustPay: state.mustPay,
          customer: state.customer,
          technicalInfo: state.technicalInfo,
          discountTotalBillByPoint: state.discountTotalBillByPoint,
          cartType: state.cartType,
          orderSubDetail: state.orderSubDetail,
          discountTotalBill: state.discountTotalBill,
          couponDiscountCode: state.couponDiscountCode,
          paymentByCash: state.paymentByCash,
          paymentByTransfer: state.paymentByTransfer,
          paymentByCredit: state.paymentByCredit,
          paymentByInstallment: state.paymentByInstallment,
          productBuyingPrice: state.productBuyingPrice,
          finalBuyingPrice: state.finalBuyingPrice,
          totalCriteriaPrice: state.totalCriteriaPrice,
          tradeInType: state.tradeInType,
          warrantyNote: state.warrantyNote,
          saleNote: state.saleNote,
          deliveryFee: state.deliveryFee,
          orderId: state.orderId,
        );
}

class UpdateTechInfoSuccess extends DraftingInvoiceState {
  UpdateTechInfoSuccess({
    required DraftingInvoiceState state,
    required super.technicalInfo,
  }) : super(
          draftingInvoiceList: state.draftingInvoiceList,
          currentDraftId: state.currentDraftId,
          products: state.products,
          totalPriceNoneDiscount: state.totalPriceNoneDiscount,
          totalDiscountPriceOfBillItem: state.totalDiscountPriceOfBillItem,
          discountOfBill: state.discountOfBill,
          totalPrePayment: state.totalPrePayment,
          finalPrice: state.finalPrice,
          mustPay: state.mustPay,
          customer: state.customer,
          saleInfo: state.saleInfo,
          discountTotalBillByPoint: state.discountTotalBillByPoint,
          cartType: state.cartType,
          orderSubDetail: state.orderSubDetail,
          discountTotalBill: state.discountTotalBill,
          couponDiscountCode: state.couponDiscountCode,
          paymentByCash: state.paymentByCash,
          paymentByTransfer: state.paymentByTransfer,
          paymentByCredit: state.paymentByCredit,
          paymentByInstallment: state.paymentByInstallment,
          productBuyingPrice: state.productBuyingPrice,
          finalBuyingPrice: state.finalBuyingPrice,
          totalCriteriaPrice: state.totalCriteriaPrice,
          tradeInType: state.tradeInType,
          warrantyNote: state.warrantyNote,
          saleNote: state.saleNote,
          deliveryFee: state.deliveryFee,
          orderId: state.orderId,
        );
}

class UpdateNoteSuccess extends DraftingInvoiceState {
  UpdateNoteSuccess({
    required DraftingInvoiceState state,
    required super.warrantyNote,
    required super.saleNote,
  }) : super(
          draftingInvoiceList: state.draftingInvoiceList,
          currentDraftId: state.currentDraftId,
          products: state.products,
          totalPriceNoneDiscount: state.totalPriceNoneDiscount,
          totalDiscountPriceOfBillItem: state.totalDiscountPriceOfBillItem,
          discountOfBill: state.discountOfBill,
          totalPrePayment: state.totalPrePayment,
          finalPrice: state.finalPrice,
          mustPay: state.mustPay,
          customer: state.customer,
          saleInfo: state.saleInfo,
          technicalInfo: state.technicalInfo,
          discountTotalBillByPoint: state.discountTotalBillByPoint,
          cartType: state.cartType,
          orderSubDetail: state.orderSubDetail,
          discountTotalBill: state.discountTotalBill,
          couponDiscountCode: state.couponDiscountCode,
          paymentByCash: state.paymentByCash,
          paymentByTransfer: state.paymentByTransfer,
          paymentByCredit: state.paymentByCredit,
          paymentByInstallment: state.paymentByInstallment,
          productBuyingPrice: state.productBuyingPrice,
          finalBuyingPrice: state.finalBuyingPrice,
          totalCriteriaPrice: state.totalCriteriaPrice,
          tradeInType: state.tradeInType,
          deliveryFee: state.deliveryFee,
          orderId: state.orderId,
        );
}

class UpdateDeliveryFeeSuccess extends DraftingInvoiceState {
  UpdateDeliveryFeeSuccess({
    required DraftingInvoiceState state,
    required super.deliveryFee,
  }) : super(
          draftingInvoiceList: state.draftingInvoiceList,
          currentDraftId: state.currentDraftId,
          products: state.products,
          totalPriceNoneDiscount: state.totalPriceNoneDiscount,
          totalDiscountPriceOfBillItem: state.totalDiscountPriceOfBillItem,
          discountOfBill: state.discountOfBill,
          totalPrePayment: state.totalPrePayment,
          finalPrice: state.finalPrice,
          mustPay: state.mustPay,
          customer: state.customer,
          saleInfo: state.saleInfo,
          technicalInfo: state.technicalInfo,
          discountTotalBillByPoint: state.discountTotalBillByPoint,
          cartType: state.cartType,
          orderSubDetail: state.orderSubDetail,
          discountTotalBill: state.discountTotalBill,
          couponDiscountCode: state.couponDiscountCode,
          paymentByCash: state.paymentByCash,
          paymentByTransfer: state.paymentByTransfer,
          paymentByCredit: state.paymentByCredit,
          paymentByInstallment: state.paymentByInstallment,
          productBuyingPrice: state.productBuyingPrice,
          finalBuyingPrice: state.finalBuyingPrice,
          totalCriteriaPrice: state.totalCriteriaPrice,
          tradeInType: state.tradeInType,
          warrantyNote: state.warrantyNote,
          saleNote: state.saleNote,
          orderId: state.orderId,
        );
}

class UpdateOrderSubDetailSuccess extends DraftingInvoiceState {
  UpdateOrderSubDetailSuccess({
    required DraftingInvoiceState state,
    required super.orderSubDetail,
  }) : super(
          draftingInvoiceList: state.draftingInvoiceList,
          currentDraftId: state.currentDraftId,
          products: state.products,
          totalPriceNoneDiscount: state.totalPriceNoneDiscount,
          totalDiscountPriceOfBillItem: state.totalDiscountPriceOfBillItem,
          discountOfBill: state.discountOfBill,
          totalPrePayment: state.totalPrePayment,
          finalPrice: state.finalPrice,
          mustPay: state.mustPay,
          customer: state.customer,
          saleInfo: state.saleInfo,
          technicalInfo: state.technicalInfo,
          discountTotalBillByPoint: state.discountTotalBillByPoint,
          cartType: state.cartType,
          discountTotalBill: state.discountTotalBill,
          couponDiscountCode: state.couponDiscountCode,
          paymentByCash: state.paymentByCash,
          paymentByTransfer: state.paymentByTransfer,
          paymentByCredit: state.paymentByCredit,
          paymentByInstallment: state.paymentByInstallment,
          productBuyingPrice: state.productBuyingPrice,
          finalBuyingPrice: state.finalBuyingPrice,
          totalCriteriaPrice: state.totalCriteriaPrice,
          tradeInType: state.tradeInType,
          warrantyNote: state.warrantyNote,
          saleNote: state.saleNote,
          deliveryFee: state.deliveryFee,
          orderId: state.orderId,
        );
}

class UpdateProductsSuccess extends DraftingInvoiceState {
  UpdateProductsSuccess({
    required DraftingInvoiceState state,
    required super.products,
  }) : super(
          draftingInvoiceList: state.draftingInvoiceList,
          currentDraftId: state.currentDraftId,
          totalPriceNoneDiscount: state.totalPriceNoneDiscount,
          totalDiscountPriceOfBillItem: state.totalDiscountPriceOfBillItem,
          discountOfBill: state.discountOfBill,
          totalPrePayment: state.totalPrePayment,
          finalPrice: state.finalPrice,
          mustPay: state.mustPay,
          customer: state.customer,
          saleInfo: state.saleInfo,
          technicalInfo: state.technicalInfo,
          discountTotalBillByPoint: state.discountTotalBillByPoint,
          cartType: state.cartType,
          orderSubDetail: state.orderSubDetail,
          discountTotalBill: state.discountTotalBill,
          couponDiscountCode: state.couponDiscountCode,
          paymentByCash: state.paymentByCash,
          paymentByTransfer: state.paymentByTransfer,
          paymentByCredit: state.paymentByCredit,
          paymentByInstallment: state.paymentByInstallment,
          productBuyingPrice: state.productBuyingPrice,
          finalBuyingPrice: state.finalBuyingPrice,
          totalCriteriaPrice: state.totalCriteriaPrice,
          tradeInType: state.tradeInType,
          warrantyNote: state.warrantyNote,
          saleNote: state.saleNote,
          deliveryFee: state.deliveryFee,
          orderId: state.orderId,
        );
}

class UpdateCouponDiscountSuccess extends DraftingInvoiceState {
  UpdateCouponDiscountSuccess({
    required DraftingInvoiceState state,
    required super.discountTotalBill,
    required super.couponDiscountCode,
  }) : super(
          draftingInvoiceList: state.draftingInvoiceList,
          currentDraftId: state.currentDraftId,
          products: state.products,
          totalPriceNoneDiscount: state.totalPriceNoneDiscount,
          totalDiscountPriceOfBillItem: state.totalDiscountPriceOfBillItem,
          discountOfBill: state.discountOfBill,
          totalPrePayment: state.totalPrePayment,
          finalPrice: state.finalPrice,
          mustPay: state.mustPay,
          customer: state.customer,
          saleInfo: state.saleInfo,
          technicalInfo: state.technicalInfo,
          discountTotalBillByPoint: state.discountTotalBillByPoint,
          cartType: state.cartType,
          orderSubDetail: state.orderSubDetail,
          paymentByCash: state.paymentByCash,
          paymentByTransfer: state.paymentByTransfer,
          paymentByCredit: state.paymentByCredit,
          paymentByInstallment: state.paymentByInstallment,
          productBuyingPrice: state.productBuyingPrice,
          finalBuyingPrice: state.finalBuyingPrice,
          totalCriteriaPrice: state.totalCriteriaPrice,
          tradeInType: state.tradeInType,
          warrantyNote: state.warrantyNote,
          saleNote: state.saleNote,
          deliveryFee: state.deliveryFee,
          orderId: state.orderId,
        );
}

class UpdateDiscountBillByPointSuccess extends DraftingInvoiceState {
  UpdateDiscountBillByPointSuccess({
    required DraftingInvoiceState state,
    required super.discountTotalBillByPoint,
  }) : super(
          draftingInvoiceList: state.draftingInvoiceList,
          currentDraftId: state.currentDraftId,
          products: state.products,
          totalPriceNoneDiscount: state.totalPriceNoneDiscount,
          totalDiscountPriceOfBillItem: state.totalDiscountPriceOfBillItem,
          discountOfBill: state.discountOfBill,
          totalPrePayment: state.totalPrePayment,
          finalPrice: state.finalPrice,
          mustPay: state.mustPay,
          customer: state.customer,
          saleInfo: state.saleInfo,
          technicalInfo: state.technicalInfo,
          cartType: state.cartType,
          orderSubDetail: state.orderSubDetail,
          discountTotalBill: state.discountTotalBill,
          couponDiscountCode: state.couponDiscountCode,
          paymentByCash: state.paymentByCash,
          paymentByTransfer: state.paymentByTransfer,
          paymentByCredit: state.paymentByCredit,
          paymentByInstallment: state.paymentByInstallment,
          productBuyingPrice: state.productBuyingPrice,
          finalBuyingPrice: state.finalBuyingPrice,
          totalCriteriaPrice: state.totalCriteriaPrice,
          tradeInType: state.tradeInType,
          warrantyNote: state.warrantyNote,
          saleNote: state.saleNote,
          deliveryFee: state.deliveryFee,
          orderId: state.orderId,
        );
}

class UpdatePaymentMethodSuccess extends DraftingInvoiceState {
  UpdatePaymentMethodSuccess({
    required DraftingInvoiceState state,
    required super.paymentByCash,
    required super.paymentByTransfer,
    required super.paymentByCredit,
    required super.paymentByInstallment,
  }) : super(
          draftingInvoiceList: state.draftingInvoiceList,
          currentDraftId: state.currentDraftId,
          products: state.products,
          totalPriceNoneDiscount: state.totalPriceNoneDiscount,
          totalDiscountPriceOfBillItem: state.totalDiscountPriceOfBillItem,
          discountOfBill: state.discountOfBill,
          totalPrePayment: state.totalPrePayment,
          finalPrice: state.finalPrice,
          mustPay: state.mustPay,
          customer: state.customer,
          saleInfo: state.saleInfo,
          technicalInfo: state.technicalInfo,
          discountTotalBillByPoint: state.discountTotalBillByPoint,
          cartType: state.cartType,
          orderSubDetail: state.orderSubDetail,
          discountTotalBill: state.discountTotalBill,
          couponDiscountCode: state.couponDiscountCode,
          productBuyingPrice: state.productBuyingPrice,
          finalBuyingPrice: state.finalBuyingPrice,
          totalCriteriaPrice: state.totalCriteriaPrice,
          tradeInType: state.tradeInType,
          warrantyNote: state.warrantyNote,
          saleNote: state.saleNote,
          deliveryFee: state.deliveryFee,
          orderId: state.orderId,
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
          draftingInvoiceList: state.draftingInvoiceList,
          currentDraftId: state.currentDraftId,
          products: state.products,
          customer: state.customer,
          saleInfo: state.saleInfo,
          technicalInfo: state.technicalInfo,
          discountTotalBillByPoint: state.discountTotalBillByPoint,
          cartType: state.cartType,
          orderSubDetail: state.orderSubDetail,
          discountTotalBill: state.discountTotalBill,
          couponDiscountCode: state.couponDiscountCode,
          paymentByCash: state.paymentByCash,
          paymentByTransfer: state.paymentByTransfer,
          paymentByCredit: state.paymentByCredit,
          paymentByInstallment: state.paymentByInstallment,
          productBuyingPrice: state.productBuyingPrice,
          finalBuyingPrice: state.finalBuyingPrice,
          totalCriteriaPrice: state.totalCriteriaPrice,
          tradeInType: state.tradeInType,
          warrantyNote: state.warrantyNote,
          saleNote: state.saleNote,
          deliveryFee: state.deliveryFee,
          orderId: state.orderId,
        );
}

/// end: chi tiết đơn nháp

/// start tradein

class UpdateTradeInTypeSuccess extends DraftingInvoiceState {
  UpdateTradeInTypeSuccess({
    required DraftingInvoiceState state,
    required super.tradeInType,
  }) : super(
          draftingInvoiceList: state.draftingInvoiceList,
          currentDraftId: state.currentDraftId,
          products: state.products,
          totalPriceNoneDiscount: state.totalPriceNoneDiscount,
          totalDiscountPriceOfBillItem: state.totalDiscountPriceOfBillItem,
          discountOfBill: state.discountOfBill,
          totalPrePayment: state.totalPrePayment,
          finalPrice: state.finalPrice,
          mustPay: state.mustPay,
          customer: state.customer,
          saleInfo: state.saleInfo,
          technicalInfo: state.technicalInfo,
          discountTotalBillByPoint: state.discountTotalBillByPoint,
          cartType: state.cartType,
          orderSubDetail: state.orderSubDetail,
          discountTotalBill: state.discountTotalBill,
          couponDiscountCode: state.couponDiscountCode,
          paymentByCash: state.paymentByCash,
          paymentByTransfer: state.paymentByTransfer,
          paymentByCredit: state.paymentByCredit,
          paymentByInstallment: state.paymentByInstallment,
          productBuyingPrice: state.productBuyingPrice,
          finalBuyingPrice: state.finalBuyingPrice,
          totalCriteriaPrice: state.totalCriteriaPrice,
          warrantyNote: state.warrantyNote,
          saleNote: state.saleNote,
          deliveryFee: state.deliveryFee,
          orderId: state.orderId,
        );
}
/// end tradein