import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:qr_code_scanner_plus/qr_code_scanner_plus.dart';

part 'scan_event.dart';
part 'scan_state.dart';

class ScanBloc extends Bloc<ScanEvent, ScanState> {
  ScanBloc() : super(const ScanInitial(barcodes: {})) {
    on<UpdateScanValueEvent>(_onUpdateScanValue);
  }

  FutureOr<void> _onUpdateScanValue(
      UpdateScanValueEvent event, Emitter<ScanState> emit) async {
    //
  }

  ///
  /// METHOD
  ///
}
