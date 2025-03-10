import 'dart:ui';

import '../../presentation/theme/themes.dart';

enum BillType {
  undefine, // chưa xác định
  retailInvoice, // hóa đơn bán lẻ
  wholesaleInvoice, // hóa đơn bán buôn
  refundInvoice, // trả hàng
  shipping, // hóa đơn giao hàng
  importStockFromTransfer, // enum này dùng cho phiếu nhập kho từ phiếu chuyển kho
  guarantee, // bảo hành
  tradeIn, //Thu cũ
  order, //Đơn hàng

  ///phần này sẽ không dùng cho check BE
  updateOrder, //cập nhật đơn hàng
  updateRetailInvoice, //cập nhật hóa đơn
}

extension BillTypeExtension on BillType {
  static const Map<int, BillType> mapBillType = {
    1: BillType.retailInvoice,
    2: BillType.wholesaleInvoice,
    3: BillType.refundInvoice,
    4: BillType.shipping,
    5: BillType.importStockFromTransfer,
    6: BillType.guarantee,
    // 7: BillType.tradeIn,
    8: BillType.order,
    10: BillType.updateOrder,
    11: BillType.updateRetailInvoice,
  };

  String get getTitle {
    switch (this) {
      case BillType.retailInvoice:
        return 'Bán lẻ';
      case BillType.wholesaleInvoice:
        return 'Bán buôn';
      case BillType.refundInvoice:
        return 'Trả hàng';
      case BillType.shipping:
        return 'Giao hàng';
      case BillType.importStockFromTransfer:
        return '';
      case BillType.guarantee:
        return 'Bảo hành';
      // case BillType.tradeIn:
      //   return 'Thu cũ';
      case BillType.order:
        return 'Đơn hàng';
      case BillType.updateOrder:
        return 'Cập nhật đơn hàng';
      case BillType.updateRetailInvoice:
        return 'Cập nhật hóa đ';
      default:
        return '';
    }
  }

  int? get getValue {
    switch (this) {
      case BillType.retailInvoice:
        return 1;
      case BillType.wholesaleInvoice:
        return 2;
      case BillType.refundInvoice:
        return 3;
      case BillType.shipping:
        return 4;
      case BillType.guarantee:
        return 6;
      // case BillType.tradeIn:
      //   return 7;
      default:
        return null;
    }
  }

  Color get getColor {
    switch (this) {
      case BillType.retailInvoice:
      case BillType.wholesaleInvoice:
        return AppColors.successColor;

      case BillType.refundInvoice:
        return AppColors.errorColor;

      case BillType.shipping:
      case BillType.guarantee:
      default:
        return AppColors.informationColor;
    }
  }
}
