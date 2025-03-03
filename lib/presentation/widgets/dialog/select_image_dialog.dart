import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/extensions/extension.dart';
import '../../../common/services/file_picker_services.dart';
import '../button/base_button.dart';

class SelectImageDialog extends StatefulWidget {
  const SelectImageDialog({super.key, required this.callback});

  final Function(XFile? file) callback;

  @override
  State<SelectImageDialog> createState() => _SelectImageDialogState();
}

class _SelectImageDialogState extends State<SelectImageDialog> {
  FilePickerServices filePickerServices = FilePickerServices();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        XBaseButton(
          padding: EdgeInsets.symmetric(vertical: 12.sp),
          width: double.infinity,
          onPressed: () async {
            final res = await filePickerServices.getImageFromGallery();
            _onResult(res.isNotEmpty ? res.first : null);
          },
          child: Text(
            'chọn từ thư viện',
            style: AppFont.t.s(12),
          ),
        ),
        XBaseButton(
          padding: EdgeInsets.symmetric(vertical: 12.sp),
          width: double.infinity,
          onPressed: () async {
            final res = await filePickerServices.takePicture();
            _onResult(res);
          },
          child: Text(
            'chụp ảnh',
            style: AppFont.t.s(12),
          ),
        ),
      ],
    );
  }

  _onResult(XFile? result) {
    widget.callback(result);
    Navigator.pop(context);
  }
}
