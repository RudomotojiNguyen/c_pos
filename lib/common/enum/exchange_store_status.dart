import 'package:flutter/material.dart';

import '../../presentation/theme/themes.dart';

enum ExchangeStoreStatus { newRequest, assign, finish, none }

extension ExchangeStoreStatusExtension on ExchangeStoreStatus {
  static const Map<int, ExchangeStoreStatus> mapExchangeStoreStatus = {
    1: ExchangeStoreStatus.newRequest, // Chờ duyệt
    2: ExchangeStoreStatus.assign, //
    4: ExchangeStoreStatus.finish, // Đã duyệt và chuyển
  };

  Color get getColorStatus {
    switch (this) {
      case ExchangeStoreStatus.newRequest:
        return AppColors.lightGreyColor;
      case ExchangeStoreStatus.assign:
        return AppColors.informationColor;
      case ExchangeStoreStatus.finish:
        return AppColors.successColor;
      default:
        return AppColors.lightGreyColor;
    }
  }
}
