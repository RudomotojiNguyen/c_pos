part of 'drafting_invoice_bloc.dart';

sealed class DraftingInvoiceEvent extends Equatable {
  const DraftingInvoiceEvent();

  @override
  List<Object> get props => [];
}

class GetDraftingInvoiceListEvent extends DraftingInvoiceEvent {}

class CreateNewDraftingInvoiceEvent extends DraftingInvoiceEvent {
  final CartType typeCart;

  const CreateNewDraftingInvoiceEvent({required this.typeCart});
}

class RemoveDraftingInvoiceEvent extends DraftingInvoiceEvent {
  final int id;

  const RemoveDraftingInvoiceEvent({required this.id});
}

class GetDraftingInvoiceDetailEvent extends DraftingInvoiceEvent {
  final int id;

  const GetDraftingInvoiceDetailEvent({required this.id});
}

class UpdateCustomerEvent extends DraftingInvoiceEvent {
  final CustomerModel customer;

  const UpdateCustomerEvent({required this.customer});
}

class ClearCustomerEvent extends DraftingInvoiceEvent {}

final class UpdateDraftEvent extends DraftingInvoiceEvent {
  final DraftingInvoiceTable cartDetail;
  final int index;

  const UpdateDraftEvent({required this.cartDetail, required this.index});
}

class UpdateSaleInfoOfBillEvent extends DraftingInvoiceEvent {
  final EmployeeModel employee;

  const UpdateSaleInfoOfBillEvent({required this.employee});
}

class UpdateTechInfoOfBillEvent extends DraftingInvoiceEvent {
  final EmployeeModel employee;

  const UpdateTechInfoOfBillEvent({required this.employee});
}

class UpdateNoteEvent extends DraftingInvoiceEvent {
  final String? saleNote;
  final String? warrantyNote;

  const UpdateNoteEvent({this.saleNote, this.warrantyNote});
}

final class SetDiscountTotalBillInfoEvent extends DraftingInvoiceEvent {
  final double? amount;
  final String? code;

  const SetDiscountTotalBillInfoEvent({this.amount, this.code});
}

final class ClearCouponEvent extends DraftingInvoiceEvent {}

final class UpdateDiscountBillByPointEvent extends DraftingInvoiceEvent {
  final OtpCustomerPointModel? discountByPoint;

  const UpdateDiscountBillByPointEvent({this.discountByPoint});
}

final class RemovePaymentMethodEvent extends DraftingInvoiceEvent {
  final int id;

  const RemovePaymentMethodEvent({required this.id});
}

final class UpdatePaymentMethodEvent extends DraftingInvoiceEvent {
  final PaymentMethodTable payment;

  const UpdatePaymentMethodEvent({required this.payment});
}

final class UpdateTradeInTypeEvent extends DraftingInvoiceEvent {
  final TradeInType type;

  const UpdateTradeInTypeEvent({required this.type});
}

///
///  -- event cho sản phẩm trong giỏ hàng --
///
final class AddProductEvent extends DraftingInvoiceEvent {
  final ProductTable product;
  final List<ProductTable>? gifts;
  final List<ProductTable>? attaches;
  final List<ProductTable>? warranties;
  final List<VoucherTable>? vouchers;

  const AddProductEvent(
    this.product, {
    this.gifts,
    this.attaches,
    this.warranties,
    this.vouchers,
  });
}

final class RemoveProductOnCartEvent extends DraftingInvoiceEvent {
  final int productId;
  final int? parentId;

  const RemoveProductOnCartEvent({required this.productId, this.parentId});
}
