import 'package:c_pos/common/configs/box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

enum ProductType { normal, imei, combo, warranty, gift, attach }

extension ProductTypeExtension on ProductType {
  static const Map<int, ProductType> mapProductType = {
    1: ProductType.normal,
    2: ProductType.imei,
    3: ProductType.combo,
    4: ProductType.warranty,
  };

  int get getValueType {
    switch (this) {
      case ProductType.imei:
      case ProductType.gift:
        return 2;
      case ProductType.combo:
      case ProductType.attach:
        return 3;
      case ProductType.warranty:
        return 4;
      case ProductType.normal:
      default:
        return 1;
    }
  }

  Widget getIconType({double? width, double? height}) {
    switch (this) {
      case ProductType.gift:
        return Icon(
          Icons.card_giftcard,
          size: width ?? 18.sp,
        );
      case ProductType.attach:
        return Icon(
          Icons.attach_file,
          size: width ?? 18.sp,
        );
      case ProductType.warranty:
        return Icon(
          Icons.shield,
          size: width ?? 18.sp,
        );
      case ProductType.normal:
      default:
        return BoxSpacer.blank;
    }
  }
}
