import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:google_mlkit_barcode_scanning/google_mlkit_barcode_scanning.dart';

part 'scan_event.dart';
part 'scan_state.dart';

class ScanBloc extends Bloc<ScanEvent, ScanState> {
  ScanBloc() : super(const ScanInitial(barcodes: {})) {
    on<UpdateScanValueEvent>(_onUpdateScanValue);
  }

  FutureOr<void> _onUpdateScanValue(
      UpdateScanValueEvent event, Emitter<ScanState> emit) async {
    Map<String, Barcode> data = Map.from(state.barcodes);
    for (var newBarcode in event.barcodes) {
      if ([
        BarcodeFormat.code128,
        BarcodeFormat.code93,
        BarcodeFormat.ean8,
        BarcodeFormat.ean13,
        BarcodeFormat.qrCode,
        BarcodeFormat.upca,
      ].contains(newBarcode.format)) {
        // Cập nhật hoặc thêm mã vạch
        data[newBarcode.rawValue ?? ''] = newBarcode;
      }
    }
    emit(UpdateResultScanSuccess(state: state, barcodes: data));
  }

  ///
  /// METHOD
  ///
}
