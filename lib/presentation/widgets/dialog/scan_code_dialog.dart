import 'package:flutter/material.dart';

import '../../../common/enum/enum.dart';
import '../../journey/screen/scan/widgets/camera_scan.dart';

class ScanCodeDialog extends StatefulWidget {
  const ScanCodeDialog({
    super.key,
    required this.onResult,
    this.typeSelect = TypeSelect.single,
    this.scanMode = XScanMode.defaultMode,
  });

  final Function({String? code, List<String>? codes}) onResult;
  final TypeSelect typeSelect;
  final XScanMode scanMode;

  @override
  State<ScanCodeDialog> createState() => _ScanCodeDialogState();
}

class _ScanCodeDialogState extends State<ScanCodeDialog> {
  @override
  Widget build(BuildContext context) {
    return CameraScan(
      scanMode: widget.scanMode,
      onResult: widget.onResult,
    );
  }
}
