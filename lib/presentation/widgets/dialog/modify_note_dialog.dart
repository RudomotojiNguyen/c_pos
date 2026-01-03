import 'package:flutter/material.dart';

import '../../../common/configs/box.dart';
import '../../theme/app_radius.dart';
import '../widgets.dart';

class ModifyNoteDialog extends StatefulWidget {
  const ModifyNoteDialog({
    super.key,
    required this.callBackResult,
    this.saleNote,
    this.warrantyNote,
    this.customerNote,
  });

  final String? saleNote;
  final String? warrantyNote;
  final String? customerNote;
  final Function(String cskh, String warranty, String internal) callBackResult;

  @override
  State<ModifyNoteDialog> createState() => _ModifyNoteDialogState();
}

class _ModifyNoteDialogState extends State<ModifyNoteDialog> {
  final TextEditingController _saleNote = TextEditingController();
  final TextEditingController _warrantyNote = TextEditingController();
  final TextEditingController _customerNote = TextEditingController();

  @override
  void initState() {
    super.initState();
    _saleNote.text = widget.saleNote ?? '';
    _warrantyNote.text = widget.warrantyNote ?? '';
    _customerNote.text = widget.customerNote ?? '';
  }

  @override
  void dispose() {
    _saleNote.dispose();
    _warrantyNote.dispose();
    _customerNote.dispose();
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
              controller: _customerNote,
              isEditMode: true,
              labelText: 'CSKH',
              hintText: 'Thêm ghi chú chăm sóc khách',
              maxLines: 5,
              minLines: 5,
              borderRadius: BorderRadius.all(AppRadius.l),
            ),
            BoxSpacer.s32,
            XTextField(
              controller: _saleNote,
              isEditMode: true,
              labelText: 'Nội bộ',
              hintText: 'Thêm ghi chú nội bộ',
              maxLines: 5,
              minLines: 5,
              borderRadius: BorderRadius.all(AppRadius.l),
            ),
            BoxSpacer.s32,
            XTextField(
              controller: _warrantyNote,
              isEditMode: true,
              labelText: 'Bảo hành',
              hintText: 'Thêm ghi chú bảo hành',
              minLines: 5,
              maxLines: 5,
              borderRadius: BorderRadius.all(AppRadius.l),
            ),
          ],
        ),
        BoxSpacer.s16,
        XButton(
          onPressed: () {
            widget.callBackResult(
                _saleNote.text, _warrantyNote.text, _customerNote.text);
          },
          title: 'Hoàn thành',
        )
      ],
    );
  }
}
