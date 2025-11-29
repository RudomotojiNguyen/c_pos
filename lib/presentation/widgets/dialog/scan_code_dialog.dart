import 'package:flutter/material.dart';

import '../../../common/di/injection/injection.dart';
import '../../../common/enum/enum.dart';
import '../../journey/screen/scan/bloc/scan_bloc.dart';
import '../../journey/screen/scan/widgets/camera_scan.dart';
import '../../journey/screen/scan/widgets/scan_result_widget.dart';

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
  final ScanBloc _scanBloc = getIt.get<ScanBloc>();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: CameraScan(
            scanBloc: _scanBloc,
            scanMode: widget.scanMode,
            onResult: widget.onResult,
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: ScanResultWidget(
            scanBloc: _scanBloc,
            typeSelect: widget.typeSelect,
            onResult: ({String? code, List<String>? codes}) {
              widget.onResult(code: code, codes: codes);
              Navigator.pop(context);
            },
          ),
        ),
      ],
    );
  }
}
