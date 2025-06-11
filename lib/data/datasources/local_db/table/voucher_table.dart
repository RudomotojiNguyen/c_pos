import 'dart:convert';

import 'package:isar/isar.dart';

import '../../../../common/enum/enum.dart';
import '../../../models/voucher_model.dart';

part 'extensions/voucher_extension.dart';

part 'voucher_table.g.dart';

@Collection()
class VoucherTable {
  Id id = Isar.autoIncrement;

  int? voucherId;
  int? voucherDetailId;
  String? voucherCode;
  String? voucherName;
  double? value;

  @Enumerated(EnumType.ordinal)
  XDiscountType type;

  int? usable;
  double? voucherValue;
  double? maxValue;
  List<String> cumulativeStringValues;

  @ignore
  List<CumulativeValueModel> get cumulativeValues => cumulativeStringValues
      .map((e) => CumulativeValueModel().toModel(e))
      .toList();

  set cumulativeValues(List<CumulativeValueModel>? value) {
    cumulativeStringValues =
        value != null ? value.map((e) => jsonEncode(e.toJson())).toList() : [];
  }

  VoucherTable({
    this.voucherId,
    this.voucherDetailId,
    this.voucherCode,
    this.voucherName,
    this.value,
    required this.type,
    this.usable,
    this.voucherValue,
    this.maxValue,
    required this.cumulativeStringValues,
  });
}
