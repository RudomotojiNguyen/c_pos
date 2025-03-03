import 'package:flutter/material.dart';

import '../../../common/extensions/extension.dart';

class MonthItemWidget extends StatelessWidget {
  const MonthItemWidget({
    super.key,
    required this.month,
    this.textStyle,
    this.decoration,
    this.isSelected,
    this.isDisabled,
    this.isCurrentMonth,
  });

  final int month;
  final TextStyle? textStyle;
  final BoxDecoration? decoration;
  final bool? isSelected;
  final bool? isDisabled;
  final bool? isCurrentMonth;

  @override
  Widget build(BuildContext context) {
    return Text(
      'Thg $month',
      style: AppFont.t.s(12).copyWith(fontWeight: FontWeight.normal),
    );
  }
}
