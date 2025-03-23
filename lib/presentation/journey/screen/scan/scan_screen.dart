import 'package:c_pos/common/di/injection/injection.dart';
import 'package:flutter/material.dart';

import '../../../widgets/widgets.dart';
import 'bloc/scan_bloc.dart';
import 'widgets/camera_scan.dart';
import 'widgets/scan_result_widget.dart';

class ScanScreen extends StatefulWidget {
  const ScanScreen({super.key});

  @override
  State<ScanScreen> createState() => _ScanScreenState();
}

class _ScanScreenState extends XStateWidget<ScanScreen> {
  final ScanBloc _scanBloc = getIt.get<ScanBloc>();

  @override
  PreferredSizeWidget? buildAppBar(BuildContext context) {
    return const XAppBar(
      title: 'Quét mã',
    );
  }

  @override
  Widget buildContentView(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: CameraScan(scanBloc: _scanBloc),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: ScanResultWidget(
            scanBloc: _scanBloc,
            onResult: ({code, codes}) {
              //
            },
          ),
        ),
      ],
    );
  }
}
