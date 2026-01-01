import 'package:c_pos/common/configs/box.dart';
import 'package:c_pos/common/enum/enum.dart';
import 'package:c_pos/common/extensions/extension.dart';
import 'package:c_pos/presentation/theme/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qr_code_scanner_plus/qr_code_scanner_plus.dart';

import '../../../../widgets/widgets.dart';
import '../bloc/scan_bloc.dart';

class ScanResultWidget extends StatefulWidget {
  const ScanResultWidget({
    super.key,
    required this.scanBloc,
    required this.onResult,
    this.typeSelect = TypeSelect.single,
  });

  final ScanBloc scanBloc;
  final Function({String? code, List<String>? codes}) onResult;
  final TypeSelect typeSelect;

  @override
  State<ScanResultWidget> createState() => _ScanResultWidgetState();
}

class _ScanResultWidgetState extends State<ScanResultWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ScanBloc, ScanState>(
      bloc: widget.scanBloc,
      builder: (context, state) {
        final List<Barcode> barcodes = state.barcodes.values.toList();
        if (barcodes.isEmpty) {
          return BoxSpacer.blank;
        }
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 16.sp),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16.sp),
              topRight: Radius.circular(16.sp),
            ),
          ),
          constraints: BoxConstraints(maxHeight: 240.sp),
          child: ListView.separated(
            padding: EdgeInsets.symmetric(vertical: 16.sp),
            itemBuilder: (context, index) {
              String valueStr = barcodes[index].code ?? '';
              return XBaseButton(
                padding: EdgeInsets.symmetric(vertical: 16.sp),
                onPressed: () {
                  if (widget.typeSelect == TypeSelect.single) {
                    widget.onResult(code: valueStr);
                  }
                },
                child: Row(
                  children: [
                    Expanded(child: Text(valueStr, style: AppFont.t)),
                    Icon(
                      Icons.check_circle_outline,
                      color: AppColors.primaryColor,
                      size: 28.sp,
                    ),
                  ],
                ),
              );
            },
            separatorBuilder: (context, index) => BoxSpacer.s2,
            itemCount: barcodes.length,
          ),
        );
      },
    );
  }
}
