import 'package:intl/intl.dart';

import '../constants/enum.dart';
import '../enum/enum.dart';

extension NumberExtensions on num {
  String formatCountdownTimerInMinute() {
    final duration = Duration(seconds: toInt());
    return [duration.inMinutes, duration.inSeconds]
        .map((seg) => seg.remainder(60).toString().padLeft(2, '0'))
        .join(':');
  }

  String formatCountdownTimer() {
    final duration = Duration(seconds: toInt());
    return [duration.inHours, duration.inMinutes, duration.inSeconds]
        .map((seg) => seg.remainder(60).toString().padLeft(2, '0'))
        .join(':');
  }

  String get formatCurrency {
    return '${NumberFormat.decimalPattern().format(this)} đ';
  }

  String get formatNumber => NumberFormat.decimalPattern().format(this);

  DiscountType get convertDiscountType =>
      this == 2 ? DiscountType.percent : DiscountType.amount;

  ExchangeStoreStatus get getExchangeStoreStatus =>
      ExchangeStoreStatusExtension.mapExchangeStoreStatus[this] ??
      ExchangeStoreStatus.none;

  ProductType get toProductType =>
      ProductTypeExtension.mapProductType[this] ?? ProductType.normal;

  PaymentType get getPaymentType =>
      PaymentTypeExtension.map[this] ?? PaymentType.cash;

  StatusEnum get getStatusEnum {
    return StatusEnum.values
        .firstWhere((e) => e.getValue == this, orElse: () => StatusEnum.none);
  }

  StatusEnum get getOrderStatus =>
      StatusFilterExtension.map[this] ?? StatusEnum.none;

  SupportTicketStatus get getSupportTicketStatus =>
      SupportTicketStatusExtension.mapSupportTicketStatus[this] ??
      SupportTicketStatus.none;

  XExpression get getOperatorType =>
      XExpressionExtension.mapOperatorType[this] ?? XExpression.none;

  XDiscountType get getDiscountType =>
      XDiscountTypeExtension.map[this] ?? XDiscountType.none;

  BillType get getBillType =>
      BillTypeExtension.mapBillType[this] ?? BillType.undefine;

  ImeiStatus get getImeiStatus =>
      ImeiStatusExtension.mapImeiStatus[this] ?? ImeiStatus.none;

  TradeInType get getTradeInType =>
      TradeInTypeExtension.mapTradeInType[this] ?? TradeInType.undefine;
}
