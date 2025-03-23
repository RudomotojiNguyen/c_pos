part of 'scan_bloc.dart';

@immutable
sealed class ScanEvent {}

final class UpdateScanValueEvent extends ScanEvent {
  final List<Barcode> barcodes;

  UpdateScanValueEvent(this.barcodes);
}
