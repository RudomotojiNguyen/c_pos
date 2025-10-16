import 'package:flutter/material.dart';

import '../../../common/extensions/extension.dart';
import 'x_row_detail_widget.dart';

class RowDetail extends StatelessWidget {
  const RowDetail({
    super.key,
    required this.title,
    required this.value,
  });

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return XRowDetailWidget(
      firstChild: Text(
        title,
        style: AppFont.t.s(12).w600.neutral2,
      ),
      secondChild: Text(
        value,
        style: AppFont.t.s(12),
        maxLines: 10,
        overflow: TextOverflow.ellipsis,
        textAlign: TextAlign.right,
      ),
    );
  }
}
