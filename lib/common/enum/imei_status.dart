import 'package:flutter/material.dart';

import '../../presentation/theme/themes.dart';

enum ImeiStatus {
  all,
  none,
  newImei,
  sold,
  delivering,
  error,
  returnedNCC,
  movingStore,
  returnedWarranty,
  warrantying,
  keeping,
  loaning
}

extension ImeiStatusExtension on ImeiStatus {
  static const Map<int, ImeiStatus> mapImeiStatus = {
    1: ImeiStatus.newImei,
    2: ImeiStatus.sold,
    3: ImeiStatus.delivering,
    4: ImeiStatus.error,
    5: ImeiStatus.returnedNCC,
    6: ImeiStatus.movingStore,
    7: ImeiStatus.returnedWarranty,
    8: ImeiStatus.warrantying,
    9: ImeiStatus.keeping,
    10: ImeiStatus.loaning,
  };

  String get getTitle {
    switch (this) {
      case ImeiStatus.all:
        return 'Tất cả';
      case ImeiStatus.newImei:
        return 'Mới';
      case ImeiStatus.sold:
        return 'Đã bán';
      case ImeiStatus.delivering:
        return 'Đang vận chuyển';
      case ImeiStatus.error:
        return 'Lỗi';
      case ImeiStatus.returnedNCC:
        return 'Đã trả nhà cung cấp';
      case ImeiStatus.movingStore:
        return 'Đang chuển cửa hàng';
      case ImeiStatus.returnedWarranty:
        return 'Đã trả bảo hành';
      case ImeiStatus.warrantying:
        return 'Đang bảo hành';
      case ImeiStatus.keeping:
        return 'Đang giữ';
      case ImeiStatus.loaning:
        return 'Đang mượn';
      default:
        return '';
    }
  }

  int? get getValue {
    switch (this) {
      case ImeiStatus.newImei:
        return 1;
      case ImeiStatus.sold:
        return 2;
      case ImeiStatus.delivering:
        return 3;
      case ImeiStatus.error:
        return 4;
      case ImeiStatus.returnedNCC:
        return 5;
      case ImeiStatus.movingStore:
        return 6;
      case ImeiStatus.returnedWarranty:
        return 7;
      case ImeiStatus.warrantying:
        return 8;
      case ImeiStatus.keeping:
        return 9;
      case ImeiStatus.loaning:
        return 10;
      default:
        return null;
    }
  }

  Color get getColorImeiStatus {
    switch (this) {
      case ImeiStatus.newImei:
      case ImeiStatus.keeping:
        return AppColors.successColor;
      case ImeiStatus.sold:
      case ImeiStatus.returnedNCC:
      case ImeiStatus.returnedWarranty:
        return AppColors.warningColor;
      case ImeiStatus.delivering:
      case ImeiStatus.movingStore:
      case ImeiStatus.warrantying:
        return AppColors.informationColor;
      case ImeiStatus.error:
        return AppColors.errorColor;
      case ImeiStatus.loaning:
        return AppColors.diamondWhite;
      default:
        return AppColors.neutral2Color;
    }
  }
}
