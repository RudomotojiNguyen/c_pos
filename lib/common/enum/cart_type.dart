import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../gen/gen.dart';
import '../configs/box.dart';

enum CartType {
  retail,
  updateBill,
  order,
  updateOrder,
  tradeIn,
  warranty,
  none
}

extension CartTypeExtension on CartType {
  String get getTitle {
    switch (this) {
      case CartType.retail:
        return 'Hóa đơn bán lẻ';
      case CartType.order:
        return 'Đơn hàng';
      case CartType.tradeIn:
        return 'Định giá sản phẩm';
      case CartType.warranty:
        return 'Bảo hành';
      default:
        return '';
    }
  }

  String get getScreenTitle {
    switch (this) {
      case CartType.retail:
        return 'Tạo hóa đơn';
      case CartType.updateBill:
        return 'Cập nhật hóa đơn';
      case CartType.order:
        return 'Tạo đơn hàng';
      case CartType.updateOrder:
        return 'Cập nhật đơn hàng';
      case CartType.tradeIn:
        return 'Tạo phiếu định giá';
      case CartType.warranty:
        return 'Phiếu bảo hành';
      default:
        return '';
    }
  }

  Widget getIcon({
    double? width,
    double? height,
  }) {
    switch (this) {
      case CartType.retail:
        return Assets.svg.invoice.svg(width: width ?? 30.sp);
      case CartType.order:
        return Assets.svg.bill.svg(width: width ?? 32.sp);
      case CartType.tradeIn:
        return Icon(Icons.phone_outlined, size: width ?? 30.sp);
      case CartType.warranty:
        return Icon(Icons.shield, size: width ?? 30.sp);
      default:
        return BoxSpacer.blank;
    }
  }

  int get getModuleType {
    switch (this) {
      case CartType.retail:
      case CartType.updateBill:
        return 3;
      case CartType.order:
      case CartType.updateOrder:
        return 2;
      default:
        return 0;
    }
  }
}
