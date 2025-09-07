import 'package:intl/intl.dart';

import '../enum/enum.dart';

extension NumberExtensions on num {
  String formatCountdownTimerInMinute() {
    final duration = Duration(seconds: toInt());
    return [duration.inMinutes, duration.inSeconds]
        .map((seg) => seg.remainder(60).toString().padLeft(2, '0'))
        .join(':');
  }

  TypeSelect get getTypeSelect =>
      TypeSelectExtension.mapTypeSelect[this] ?? TypeSelect.none;

  XGenderType get getGender => GenderExtension.map[this] ?? XGenderType.other;

  String formatCountdownTimer() {
    final duration = Duration(seconds: toInt());
    return [duration.inHours, duration.inMinutes, duration.inSeconds]
        .map((seg) => seg.remainder(60).toString().padLeft(2, '0'))
        .join(':');
  }

  String get formatCurrency {
    return '${NumberFormat.decimalPattern().format(this)} đ';
  }

  String get formatPoint {
    return '${NumberFormat.decimalPattern().format(this)} điểm';
  }

  String get formatNumber => NumberFormat.decimalPattern().format(this);

  XDiscountType get getDiscountType =>
      XDiscountTypeExtension.map[this] ?? XDiscountType.none;

  ExchangeStoreStatus get getExchangeStoreStatus =>
      ExchangeStoreStatusExtension.mapExchangeStoreStatus[this] ??
      ExchangeStoreStatus.none;

  ProductType get toProductType =>
      ProductTypeExtension.map[this] ?? ProductType.normal;

  PaymentType get getPaymentType =>
      PaymentTypeExtension.map[this] ?? PaymentType.cash;

  StatusEnum get getStatusEnum {
    return StatusEnum.values
        .firstWhere((e) => e.getValue == this, orElse: () => StatusEnum.none);
  }

  StatusEnum get getOrderStatus =>
      StatusFilterExtension.map[this] ?? StatusEnum.none;

  XExpression get getOperatorType =>
      XExpressionExtension.mapOperatorType[this] ?? XExpression.none;

  BillType get getBillType =>
      BillTypeExtension.mapBillType[this] ?? BillType.undefine;

  ImeiStatus get getImeiStatus =>
      ImeiStatusExtension.mapImeiStatus[this] ?? ImeiStatus.none;

  TradeInType get getTradeInType =>
      TradeInTypeExtension.mapTradeInType[this] ?? TradeInType.undefine;

  XCustomerType get getCustomerType =>
      XCustomerTypeExtension.map[this] ?? XCustomerType.none;

  XProductStatus get getProductStatus =>
      XProductStatusExtension.map[this] ?? XProductStatus.none;

  XJobTitle get getJob => XUserPermissionExtension.map[this] ?? XJobTitle.none;

  TradeInStatus get getTradeInStatus =>
      TradeInStatusExtension.mapTradeInStatus[this] ?? TradeInStatus.undefine;
}
