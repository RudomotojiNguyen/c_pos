import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/configs/box.dart';
import '../../../common/extensions/extension.dart';
import '../widgets.dart';

class NoteDialog extends StatefulWidget {
  const NoteDialog(
      {super.key, required this.onResult, required this.initValue});

  final Function(String value) onResult;
  final String initValue;

  @override
  State<NoteDialog> createState() => _NoteDialogState();
}

class _NoteDialogState extends State<NoteDialog>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  final TextEditingController _noteController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
    _noteController.text = widget.initValue;
  }

  @override
  void dispose() {
    _controller.dispose();
    _noteController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.zero
          .copyWith(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const HeaderDialog(title: 'Ghi chú'),
          BoxSpacer.s16,
          _inputNote(),
          BoxSpacer.s16,
          _submitButton(),
        ],
      ),
    );
  }

  Widget _submitButton() {
    return XButton(
      padding: EdgeInsets.symmetric(vertical: 12.sp, horizontal: 16.sp),
      onPressed: () {
        widget.onResult(_noteController.text.trim());
        Navigator.pop(context);
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Xong',
            style: AppFont.t.s().white,
          ),
        ],
      ),
    );
  }

  Widget _inputNote() {
    return XTextField(
      controller: _noteController,
      isEditMode: true,
      hintText: 'Thêm ghi chú tại đây',
      minLines: 10,
      maxLines: 10,
    );
  }
}
