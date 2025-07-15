import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../../data/datasources/local_data/local_data.dart';
import '../../../../../../data/datasources/local_db/local_db.dart';
import '../../../../../mixins/logger_helper.dart';
import '../../../../../widgets/widgets.dart';

part 'drafting_invoices_event.dart';
part 'drafting_invoices_state.dart';

class DraftingInvoicesBloc
    extends Bloc<DraftingInvoicesEvent, DraftingInvoicesState> {
  final DraftingStorage draftingStorage;
  final LoggerHelper _loggerHelper = LoggerHelper();

  DraftingInvoicesBloc({required this.draftingStorage})
      : super(const DraftingInvoicesInitial(draftingInvoiceList: [])) {
    // lấy danh sách đơn nháp
    on<GetDraftingInvoiceListEvent>(_onGetDraftingInvoiceList);
    // xóa đơn nháp
    on<RemoveDraftingInvoiceEvent>(_onRemoveDraftingInvoice);
    // cập nhật chi tiết đơn nháp
    on<UpdateDraftEvent>(_onUpdateDraft);
  }

  FutureOr<void> _onGetDraftingInvoiceList(GetDraftingInvoiceListEvent event,
      Emitter<DraftingInvoicesState> emit) async {
    try {
      emit(GetDraftingInvoicesLoading(state: state));
      final result = await draftingStorage.getCarts();
      emit(GetDraftingInvoicesSuccess(
        state: state,
        draftingInvoiceList: result,
      ));
    } catch (e) {
      _loggerHelper.logError(message: 'GetDraftingInvoiceList', obj: e);
      emit(GetDraftingInvoicesError(state: state));
    }
  }

  FutureOr<void> _onRemoveDraftingInvoice(RemoveDraftingInvoiceEvent event,
      Emitter<DraftingInvoicesState> emit) async {
    try {
      XToast.loading();
      await draftingStorage.removeCartById(event.id);
      add(GetDraftingInvoiceListEvent());
    } catch (e) {
      _loggerHelper.logError(message: 'RemoveDraftingInvoice', obj: e);
    } finally {
      XToast.closeAllLoading();
    }
  }

  FutureOr<void> _onUpdateDraft(
      UpdateDraftEvent event, Emitter<DraftingInvoicesState> emit) async {
    try {
      emit(GetDraftingInvoicesLoading(state: state));
      List<DraftingInvoiceTable> currentCart = state.draftingInvoiceList;
      currentCart[event.index] = event.cartDetail;
      emit(GetDraftingInvoicesSuccess(
          state: state, draftingInvoiceList: currentCart));
    } catch (e) {
      _loggerHelper.logError(message: 'UpdateDraftEvent', obj: e);
    }
  }
}
