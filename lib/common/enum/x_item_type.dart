import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../configs/box.dart';

enum XItemType {
  main,
  gift,
  attach,
}

extension XItemTypeExtension on XItemType {
  int get getValueType => switch (this) {
        XItemType.gift => 2,
        XItemType.attach => 3,
        XItemType.main => 1,
      };

  Widget getIconType({double? width, double? height}) {
    switch (this) {
      case XItemType.gift:
        return Icon(
          Icons.card_giftcard,
          size: width ?? 18.sp,
        );
      case XItemType.attach:
        return Icon(
          Icons.attach_file,
          size: width ?? 18.sp,
        );
      case XItemType.main:
        return BoxSpacer.blank;
    }
  }
}
