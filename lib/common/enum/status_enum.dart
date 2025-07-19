import 'package:flutter/material.dart';

import '../../presentation/theme/themes.dart';

enum StatusEnum {
  ready,
  packing,
  // customerCancel,
  systemCancel,
  all,
  none,
  success,
  newTransaction,
  confirming,
  confirmed,
  delivery,
  unSuccess,
  refunded,
  noCatchPhone,
  crCancel,
  deposit,
  agreeDeposit,
  tracking,
  keepDeposit,
  unSelect,
}

extension StatusFilterExtension on StatusEnum {
  static const Map<int, StatusEnum> map = {
    1: StatusEnum.newTransaction,
    2: StatusEnum.confirming,
    3: StatusEnum.confirmed,
    4: StatusEnum.delivery,
    5: StatusEnum.packing,
    6: StatusEnum.success,
    7: StatusEnum.unSuccess,
    8: StatusEnum.systemCancel,
    9: StatusEnum.refunded,
    10: StatusEnum.noCatchPhone,
    11: StatusEnum.crCancel,
    12: StatusEnum.deposit,
    13: StatusEnum.agreeDeposit,
    14: StatusEnum.ready,
    15: StatusEnum.tracking,
    // 16: StatusEnum.customerCancel,
    17: StatusEnum.keepDeposit,
  };

  String get getTitle {
    switch (this) {
      case StatusEnum.newTransaction:
        return 'Mới';
      case StatusEnum.confirming:
        return 'Đang xử lý';
      case StatusEnum.confirmed:
        return 'Đã xác nhận';
      case StatusEnum.delivery:
        return 'Đang giao';
      case StatusEnum.packing:
        return 'Đang đóng gói';
      case StatusEnum.success:
        return 'Thành công';
      case StatusEnum.unSuccess:
        return 'Không thành công';
      case StatusEnum.systemCancel:
        return 'Hệ thống hủy';
      case StatusEnum.refunded:
        return 'Đã hoàn chuyển';
      case StatusEnum.noCatchPhone:
        return 'Không bắt máy';
      case StatusEnum.crCancel:
        return 'CR huỷ';
      case StatusEnum.deposit:
        return 'Đã đặt cọc';
      case StatusEnum.agreeDeposit:
        return 'Đồng ý cọc';
      case StatusEnum.ready:
        return 'Đã chuẩn bị';
      case StatusEnum.tracking:
        return 'Đang theo dõi';
      // case StatusEnum.customerCancel:
      //   return 'Khách hủy';
      case StatusEnum.keepDeposit:
        return 'Giữ cọc';
      case StatusEnum.all:
        return 'Tất cả';
      case StatusEnum.unSelect:
        return 'Chọn trạng thái';
      default:
        return '';
    }
  }

  int? get getValue {
    switch (this) {
      case StatusEnum.newTransaction:
        return 1;
      case StatusEnum.confirming:
        return 2;
      case StatusEnum.confirmed:
        return 3;
      case StatusEnum.delivery:
        return 4;
      case StatusEnum.packing:
        return 5;
      case StatusEnum.success:
        return 6;
      case StatusEnum.unSuccess:
        return 7;
      case StatusEnum.systemCancel:
        return 8;
      case StatusEnum.refunded:
        return 9;
      case StatusEnum.noCatchPhone:
        return 10;
      case StatusEnum.crCancel:
        return 11;
      case StatusEnum.deposit:
        return 12;
      case StatusEnum.agreeDeposit:
        return 13;
      case StatusEnum.ready:
        return 14;
      case StatusEnum.tracking:
        return 15;
      // case StatusEnum.customerCancel:
      //   return 16;
      case StatusEnum.keepDeposit:
        return 17;
      case StatusEnum.all:
      case StatusEnum.unSelect:
      default:
        return null;
    }
  }

  Color get getColorStatus {
    switch (this) {
      case StatusEnum.confirmed:
      case StatusEnum.confirming:
      case StatusEnum.ready:
      case StatusEnum.packing:
      case StatusEnum.delivery:
        return AppColors.warningColor;

      // case StatusEnum.customerCancel:
      case StatusEnum.systemCancel:
      case StatusEnum.unSuccess:
      case StatusEnum.refunded:
      case StatusEnum.noCatchPhone:
      case StatusEnum.crCancel:
        return AppColors.errorColor;

      case StatusEnum.success:
      case StatusEnum.deposit:
      case StatusEnum.agreeDeposit:
      case StatusEnum.keepDeposit:
        return AppColors.successColor;

      case StatusEnum.newTransaction:
      case StatusEnum.tracking:
      default:
        return AppColors.informationColor;
    }
  }
}
