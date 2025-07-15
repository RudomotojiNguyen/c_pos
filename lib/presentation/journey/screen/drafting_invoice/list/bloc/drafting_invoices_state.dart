part of 'drafting_invoices_bloc.dart';

sealed class DraftingInvoicesState extends Equatable {
  const DraftingInvoicesState({
    required this.draftingInvoiceList,
  });

  final List<DraftingInvoiceTable> draftingInvoiceList;

  @override
  List<Object> get props => [draftingInvoiceList];
}

final class DraftingInvoicesInitial extends DraftingInvoicesState {
  const DraftingInvoicesInitial({required super.draftingInvoiceList});
}

/// start: lấy danh sách đơn nháp

class GetDraftingInvoicesLoading extends DraftingInvoicesState {
  GetDraftingInvoicesLoading({required DraftingInvoicesState state})
      : super(draftingInvoiceList: state.draftingInvoiceList);
}

class GetDraftingInvoicesSuccess extends DraftingInvoicesState {
  const GetDraftingInvoicesSuccess(
      {required DraftingInvoicesState state,
      required super.draftingInvoiceList})
      : super();
}

class GetDraftingInvoicesError extends DraftingInvoicesState {
  GetDraftingInvoicesError({required DraftingInvoicesState state})
      : super(draftingInvoiceList: state.draftingInvoiceList);
}

/// end: lấy danh sách đơn nháp
