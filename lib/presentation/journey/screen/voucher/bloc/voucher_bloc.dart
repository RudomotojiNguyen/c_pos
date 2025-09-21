import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:c_pos/data/services/services.dart';

import '../../../../../data/models/voucher_model.dart';

part 'voucher_event.dart';
part 'voucher_state.dart';

class VoucherBloc extends Bloc<VoucherEvent, VoucherState> {
  final VoucherServices voucherServices;

  VoucherBloc({required this.voucherServices}) : super(VoucherInitial()) {
    /// lấy danh sách voucher
    on<GetVoucherEvent>(_onGetVoucher);
  }

  FutureOr<void> _onGetVoucher(
      GetVoucherEvent event, Emitter<VoucherState> emit) async {
    try {
      emit(GetVoucherLoading(state: state));
      final res = await voucherServices.getVoucherUsable(
        productId: event.productId,
        productAmount: event.productAmount,
        storeId: event.storeId,
        customerPhone: event.customerPhone,
      );
      emit(UpdateVouchersSuccess(state: state, vouchers: res));
    } catch (e) {
      emit(UpdateVouchersError(state: state, error: e.toString()));
    }
  }
}
