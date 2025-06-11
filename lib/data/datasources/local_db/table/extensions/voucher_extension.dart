part of '../voucher_table.dart';

extension VoucherTableExtension on VoucherTable {
  static const Map<int, XDiscountType> map = {
    2: XDiscountType.percent,
    1: XDiscountType.amount,
  };

  double get getValue => value ?? 0;

  double get getMaxValue => maxValue ?? 0;

  Map<String, dynamic> get toJson {
    Map<String, dynamic> data = <String, dynamic>{};

    data['voucherId'] = voucherId;
    data['voucherDetailId'] = voucherDetailId;
    data['voucherTypeDiscount'] = type.value;
    data['voucherAmount'] = value;
    data['voucherCode'] = voucherCode;
    data['maxValue'] = maxValue;
    data['cumluativeValues'] = cumulativeValues.map((e) => e.toJson()).toList();

    return data;
  }
}
