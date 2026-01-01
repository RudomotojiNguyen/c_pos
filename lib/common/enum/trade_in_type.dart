import 'package:flutter/material.dart';

import '../../presentation/theme/themes.dart';

enum TradeInType {
  undefine,
  tradeIn, // Khách thu cũ đổi mới
  buyingOldItems, // Khách thu cũ không đổi mới
  exchangeWarranty, // Khách đổi bảo hành
  testDevice, // kiểm Thử thiết bị
}

enum TradeInStatus {
  undefine,
  quote, // đã báo giá
  collected, // đã thu cũ
}

extension TradeInTypeExtension on TradeInType {
  static const Map<int, TradeInType> mapTradeInType = {
    1: TradeInType.tradeIn, // Khách thu cũ đổi mới
    2: TradeInType.buyingOldItems, // Khách thu cũ không đổi mới
    3: TradeInType.exchangeWarranty, // Khách đổi bảo hành
    4: TradeInType.testDevice, // kiểm Thử thiết bị
  };

  String get getTitle {
    switch (this) {
      case TradeInType.tradeIn:
        return 'Khách thu cũ đổi mới';
      case TradeInType.buyingOldItems:
        return 'Khách thu cũ không đổi mới';
      case TradeInType.exchangeWarranty:
        return 'Khách đổi bảo hành';
      case TradeInType.testDevice:
        return 'Kiểm Thử thiết bị';
      default:
        return '';
    }
  }

  Color get getBgStatusColor {
    switch (this) {
      case TradeInType.tradeIn:
        return AppColors.primaryLightColor;
      case TradeInType.buyingOldItems:
        return AppColors.primaryLightColor;
      case TradeInType.exchangeWarranty:
        return AppColors.primaryLightColor;
      case TradeInType.testDevice:
        return AppColors.primaryLightColor;
      default:
        return AppColors.primaryLightColor;
    }
  }

  int get getTypeValue {
    return mapTradeInType.entries
        .firstWhere((entry) => entry.value == this)
        .key;
  }
}

extension TradeInStatusExtension on TradeInStatus {
  static const Map<int, TradeInStatus> mapTradeInStatus = {
    1: TradeInStatus.quote, // đã báo giá
    2: TradeInStatus.collected, // đã thu cũ
  };

  int get getTypeValue {
    return mapTradeInStatus.entries
        .firstWhere((entry) => entry.value == this)
        .key;
  }

  Color get getBgStatusColor {
    switch (this) {
      case TradeInStatus.quote:
        return AppColors.warningColor;
      case TradeInStatus.collected:
        return AppColors.successColor;
      default:
        return AppColors.informationColor;
    }
  }
}
