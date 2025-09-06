import 'package:flutter/material.dart';

import '../../../common/configs/box.dart';
import '../widgets.dart';

class ModifyNoteDialog extends StatefulWidget {
  const ModifyNoteDialog({
    super.key,
    required this.callBackResult,
    this.saleNote,
    this.warrantyNote,
  });

  final String? saleNote;
  final String? warrantyNote;
  final Function(String cskh, String warranty) callBackResult;

  @override
  State<ModifyNoteDialog> createState() => _ModifyNoteDialogState();
}

class _ModifyNoteDialogState extends State<ModifyNoteDialog> {
  final TextEditingController _saleNote = TextEditingController();
  final TextEditingController _warrantyNote = TextEditingController();

  @override
  void initState() {
    super.initState();
    _saleNote.text = widget.saleNote ?? '';
    _warrantyNote.text = widget.warrantyNote ?? '';
  }

  @override
  void dispose() {
    _saleNote.dispose();
    _warrantyNote.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const HeaderDialog(title: 'Ghi chú'),
        BoxSpacer.s8,
        Column(
          children: [
            XTextField(
              controller: _saleNote,
              isEditMode: true,
              labelText: 'CSKH',
              hintText: 'Thêm ghi chú chăm sóc khách',
              maxLines: 5,
              minLines: 5,
            ),
            BoxSpacer.s32,
            XTextField(
              controller: _warrantyNote,
              isEditMode: true,
              labelText: 'Bảo hành',
              hintText: 'Thêm ghi chú bảo hành',
              minLines: 5,
              maxLines: 5,
            ),
          ],
        ),
        BoxSpacer.s16,
        XButton(
          onPressed: () {
            widget.callBackResult(_saleNote.text, _warrantyNote.text);
          },
          title: 'Hoàn thành',
        )
      ],
    );
  }
}
