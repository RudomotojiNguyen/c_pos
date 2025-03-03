import 'package:flutter/material.dart';

import '../../../common/extensions/extension.dart';

class YearItemWidget extends StatelessWidget {
  const YearItemWidget(
      {super.key,
      required this.year,
      this.textStyle,
      this.decoration,
      this.isSelected,
      this.isDisabled,
      this.isCurrentYear});

  final int year;
  final TextStyle? textStyle;
  final BoxDecoration? decoration;
  final bool? isSelected;
  final bool? isDisabled;
  final bool? isCurrentYear;

  @override
  Widget build(BuildContext context) {
    return Text(
      year.toString(),
      style: AppFont.t.s(12),
    );
  }
}
