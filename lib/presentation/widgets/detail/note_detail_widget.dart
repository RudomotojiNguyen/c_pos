import 'package:c_pos/common/extensions/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/configs/box.dart';
import '../../theme/themes.dart';
import '../widgets.dart';

class NoteDetailWidget extends StatelessWidget {
  const NoteDetailWidget(
      {super.key,
      this.note,
      this.saleNote,
      this.customerNote,
      this.warrantyNote});

  final String? note;
  final String? saleNote;
  final String? customerNote;
  final String? warrantyNote;

  @override
  Widget build(BuildContext context) {
    if (note.isNullOrEmpty &&
        saleNote.isNullOrEmpty &&
        customerNote.isNullOrEmpty & warrantyNote.isNullOrEmpty) {
      return BoxSpacer.blank;
    }

    return XContainer(
      margin: EdgeInsets.only(top: 16.sp),
      title: 'Ghi chú',
      iconTitle: Icon(
        Icons.sticky_note_2,
        size: 18.sp,
        color: AppColors.neutral3Color,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (note.isNotNullOrEmpty) ...[
            Text(
              note!,
              style: AppFont.t.s(),
            ),
          ],
          if (saleNote.isNotNullOrEmpty) ...[
            BoxSpacer.s16,
            _noteDetailWidget(context,
                title: 'Ghi chú CSKH', value: saleNote ?? ''),
          ],
          if (customerNote.isNotNullOrEmpty) ...[
            BoxSpacer.s16,
            _noteDetailWidget(context,
                title: 'Ghi chú của khách', value: customerNote ?? ''),
          ],
          if (warrantyNote.isNotNullOrEmpty) ...[
            BoxSpacer.s16,
            _noteDetailWidget(context,
                title: 'Ghi chú bảo hành', value: warrantyNote ?? ''),
          ],
        ],
      ),
    );
  }

  Widget _noteDetailWidget(BuildContext ctx,
      {required String title, required String value}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          title,
          style: AppFont.t.s().w700,
        ),
        BoxSpacer.s8,
        Container(
          padding: EdgeInsets.symmetric(horizontal: 12.sp, vertical: 12.sp),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(AppRadius.l),
            color: AppColors.primaryLightColor,
          ),
          child: Text(
            value,
            style: AppFont.t.s(),
          ),
        ),
      ],
    );
  }
}
