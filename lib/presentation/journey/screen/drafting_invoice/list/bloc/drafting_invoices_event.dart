part of 'drafting_invoices_bloc.dart';

sealed class DraftingInvoicesEvent {}

class GetDraftingInvoiceListEvent extends DraftingInvoicesEvent {}

class RemoveDraftingInvoiceEvent extends DraftingInvoicesEvent {
  final int id;

  RemoveDraftingInvoiceEvent({required this.id});
}

final class UpdateDraftEvent extends DraftingInvoicesEvent {
  final DraftingInvoiceTable cartDetail;
  final int index;

  UpdateDraftEvent({required this.cartDetail, required this.index});
}
