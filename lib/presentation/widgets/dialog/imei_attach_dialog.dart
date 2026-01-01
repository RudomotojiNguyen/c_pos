import 'package:c_pos/common/extensions/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/configs/box.dart';
import '../../../common/constants/app_constants.dart';
import '../../../gen/gen.dart';
import '../../mixins/mixins.dart';
import '../widgets.dart';

class ImeiAttachDialog extends StatefulWidget {
  const ImeiAttachDialog(
      {super.key, this.imeiStr, required this.onPressedAttach});

  final String? imeiStr;
  final Function(String) onPressedAttach;

  @override
  State<ImeiAttachDialog> createState() => _ImeiAttachDialogState();
}

class _ImeiAttachDialogState extends State<ImeiAttachDialog> with DialogHelper {
  final TextEditingController _imeiController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _imeiController.text = widget.imeiStr ?? '';
  }

  @override
  void dispose() {
    _imeiController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const HeaderDialog(title: 'IMEI đính kèm'),
        BoxSpacer.s8,
        inputImei(),
        BoxSpacer.s8,
        buttonAttach(),
      ],
    );
  }

  Widget inputImei() {
    return XTextField(
      labelText: '',
      hintText: 'Nhập imei sản phẩm',
      controller: _imeiController,
      autoFocus: true,
      suffixWidget: XBaseButton(
        onPressed: () {
          showModalCameraScan(
            context,
            onResult: ({code, codes}) {
              if (code.isNotNullOrEmpty) {
                _imeiController.text = code ?? '';
              }
              dismissPopup(key: GlobalAppKey.scanDialogKey);
            },
          );
        },
        child: Assets.svg.barcode.svg(
          width: 24.sp,
          height: 24.sp,
        ),
      ),
    );
  }

  Widget buttonAttach() {
    return XButton(
      onPressed: () {
        Navigator.pop(context);
        widget.onPressedAttach(_imeiController.text.trim());
      },
      title: 'Gắn',
    );
  }
}
