part of 'drafting_invoice_bloc.dart';

@immutable
sealed class DraftingInvoiceEvent {}

final class GetCurrentDraftEvent extends DraftingInvoiceEvent {
  final int currentDraftId;

  GetCurrentDraftEvent(this.currentDraftId);
}

final class UpdateCustomerInfoOfBillEvent extends DraftingInvoiceEvent {
  final CustomerModel? customer;

  UpdateCustomerInfoOfBillEvent(this.customer);
}

final class UpdateFeeDeliveryEvent extends DraftingInvoiceEvent {
  final int? customerFee;
  final int? shippingCompanyFee;

  UpdateFeeDeliveryEvent({this.customerFee, this.shippingCompanyFee});
}

final class ClearCustomerEvent extends DraftingInvoiceEvent {}

final class SubmitDraftEvent extends DraftingInvoiceEvent {}

final class UpdateDiscountBillByPointEvent extends DraftingInvoiceEvent {
  final OtpCustomerPointModel? discountByPoint;

  UpdateDiscountBillByPointEvent(this.discountByPoint);
}

final class UpdatePaymentMethodEvent extends DraftingInvoiceEvent {
  final PaymentMethodTable payment;

  UpdatePaymentMethodEvent({required this.payment});
}

final class RemovePaymentMethodEvent extends DraftingInvoiceEvent {
  final int id;

  RemovePaymentMethodEvent({required this.id});
}

final class ClearCouponEvent extends DraftingInvoiceEvent {}

final class SetDiscountTotalBillInfoEvent extends DraftingInvoiceEvent {
  final double? amount;
  final String? code;

  SetDiscountTotalBillInfoEvent({this.amount, this.code});
}

final class UpdateNoteEvent extends DraftingInvoiceEvent {
  final String? saleNote;
  final String? warrantyNote;
  final String? customerNote;

  UpdateNoteEvent({this.saleNote, this.warrantyNote, this.customerNote});
}

///
///  -- event cho sản phẩm trong giỏ hàng --
///
// final class AddProductEvent extends DraftingInvoiceEvent {
//   final ProductTable product;
//   final List<ProductTable>? gifts;
//   final List<ProductTable>? attaches;

//   AddProductEvent(
//     this.product, {
//     this.gifts,
//     this.attaches,
//   });
// }

final class UpdateProductEvent extends DraftingInvoiceEvent {
  final ProductTable product;
  final List<ProductTable>? gifts;
  final List<ProductTable>? attaches;

  UpdateProductEvent(
    this.product, {
    this.gifts,
    this.attaches,
  });
}

final class AddProductFromSearchToCartEvent extends DraftingInvoiceEvent {
  final ProductModel product;

  AddProductFromSearchToCartEvent(this.product);
}

final class RemoveProductOnCartEvent extends DraftingInvoiceEvent {
  final int productId;
  final int? parentId;

  RemoveProductOnCartEvent({required this.productId, this.parentId});
}

final class UpdateImeiOfProductEvent extends DraftingInvoiceEvent {
  final int productId;
  final ProductImeiModel imei;

  UpdateImeiOfProductEvent({required this.productId, required this.imei});
}

final class UpdateProductNoteEvent extends DraftingInvoiceEvent {
  final String productNote;
  final int productId;

  UpdateProductNoteEvent({required this.productNote, required this.productId});
}

final class UpdateProductDiscountByHandEvent extends DraftingInvoiceEvent {
  final double amount;
  final XDiscountType type;
  final int productId;

  UpdateProductDiscountByHandEvent({
    required this.amount,
    required this.type,
    required this.productId,
  });
}

final class UpdateProductQuantityEvent extends DraftingInvoiceEvent {
  final ProductTable product;
  final int quantity;

  UpdateProductQuantityEvent({required this.quantity, required this.product});
}

final class UpdateOrderSubDetailEvent extends DraftingInvoiceEvent {
  final OrderSubDetailModel data;

  UpdateOrderSubDetailEvent({required this.data});
}

final class UpdateRepurchasePriceProductEvent extends DraftingInvoiceEvent {
  final int productId;
  final double repurchasePrice;
  final XItemType productType;

  UpdateRepurchasePriceProductEvent({
    required this.productId,
    required this.repurchasePrice,
    required this.productType,
  });
}

/// for tradein

final class UpdateTradeInTypeEvent extends DraftingInvoiceEvent {
  final TradeInType type;

  UpdateTradeInTypeEvent(this.type);
}

final class UpdateProductTradeInEvent extends DraftingInvoiceEvent {
  final ProductTable product;

  UpdateProductTradeInEvent(this.product);
}

final class OnSelectProgramEvent extends DraftingInvoiceEvent {
  final TradeInProgramCreteriaGroupOptionModel
      tradeInProgramCreteriaGroupOption;
  final TypeSelect typeSelect;

  OnSelectProgramEvent({
    required this.tradeInProgramCreteriaGroupOption,
    required this.typeSelect,
  });
}

final class SubmitTradeInBillEvent extends DraftingInvoiceEvent {
  final double finalBuyingPrice;
  final String? note;

  SubmitTradeInBillEvent({required this.finalBuyingPrice, this.note});
}

final class UpdateTradeInProgramEvent extends DraftingInvoiceEvent {
  final int tradeInProgramId;

  UpdateTradeInProgramEvent({required this.tradeInProgramId});
}

final class ApplyOrderEvent extends DraftingInvoiceEvent {
  final OrderModel order;

  ApplyOrderEvent({required this.order});
}

final class AddProductGiftEvent extends DraftingInvoiceEvent {
  final ProductModel product;
  final int parentProductId;

  AddProductGiftEvent({required this.product, required this.parentProductId});
}

final class AddProductAttachEvent extends DraftingInvoiceEvent {
  final ProductModel product;
  final int parentProductId;

  AddProductAttachEvent({required this.product, required this.parentProductId});
}

final class CreateNewDraftingInvoiceEvent extends DraftingInvoiceEvent {
  final CartType typeCart;

  CreateNewDraftingInvoiceEvent({required this.typeCart});
}

final class UpdateCurrentStoreEvent extends DraftingInvoiceEvent {
  final StoreModel? store;

  UpdateCurrentStoreEvent({this.store});
}

final class UpdateProductVoucherEvent extends DraftingInvoiceEvent {
  final VoucherModel? voucher;
  final ProductTable product;

  UpdateProductVoucherEvent({this.voucher, required this.product});
}

/// update employee of bill

final class UpdateSalerOfBillEvent extends DraftingInvoiceEvent {
  final EmployeeModel employee;

  UpdateSalerOfBillEvent({required this.employee});
}

final class UpdateTechnicalOfBillEvent extends DraftingInvoiceEvent {
  final EmployeeModel employee;

  UpdateTechnicalOfBillEvent({required this.employee});
}

final class UpdateCdpkOfBillEvent extends DraftingInvoiceEvent {
  final EmployeeModel employee;

  UpdateCdpkOfBillEvent({required this.employee});
}

final class UpdateCashierOfBillEvent extends DraftingInvoiceEvent {
  final EmployeeModel employee;

  UpdateCashierOfBillEvent({required this.employee});
}

final class UpdateManagerOfBillEvent extends DraftingInvoiceEvent {
  final EmployeeModel employee;

  UpdateManagerOfBillEvent({required this.employee});
}

final class UpdateAssistantOfBillEvent extends DraftingInvoiceEvent {
  final EmployeeModel employee;

  UpdateAssistantOfBillEvent({required this.employee});
}

final class UpdateReceptionistOfBillEvent extends DraftingInvoiceEvent {
  final EmployeeModel employee;

  UpdateReceptionistOfBillEvent({required this.employee});
}

final class UpdateDeliveryOfBillEvent extends DraftingInvoiceEvent {
  final EmployeeModel employee;

  UpdateDeliveryOfBillEvent({required this.employee});
}

/// update assistant of bill

/// update product combo

final class UpdateProductComboEvent extends DraftingInvoiceEvent {
  final ProductTable product;
  final List<ProductModel> productCombos;

  UpdateProductComboEvent({required this.product, required this.productCombos});
}
