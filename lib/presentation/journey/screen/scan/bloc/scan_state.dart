part of 'scan_bloc.dart';

@immutable
sealed class ScanState extends Equatable {
  final Map<String, Barcode> barcodes;

  const ScanState({required this.barcodes});

  @override
  List<Object?> get props => [barcodes];
}

final class ScanInitial extends ScanState {
  const ScanInitial({required super.barcodes});
}

final class UpdateResultScanSuccess extends ScanState {
  const UpdateResultScanSuccess(
      {required ScanState state, required super.barcodes});
}
