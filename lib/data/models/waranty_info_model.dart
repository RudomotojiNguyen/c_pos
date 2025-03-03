import 'package:c_pos/common/extensions/extension.dart';

class WarrantyInfoModel {
  final String? warrantyAddress;
  final String? warrantyPhone;
  final int? warrantyMonthNo;
  final String? warrantyDescription;

  WarrantyInfoModel({
    this.warrantyAddress,
    this.warrantyPhone,
    this.warrantyMonthNo,
    this.warrantyDescription,
  });

  factory WarrantyInfoModel.fromJson(Map<String, dynamic> json) =>
      WarrantyInfoModel(
        warrantyAddress: json['warrantyAddress'],
        warrantyPhone: json['warrantyPhone'],
        warrantyMonthNo: json['warrantyMonthNo'],
        warrantyDescription: json['warrantyDescription'],
      );

  Map<String, dynamic> toJson() => {
        'warrantyAddress': warrantyAddress,
        'warrantyPhone': warrantyPhone,
        'warrantyMonthNo': warrantyMonthNo,
        'warrantyDescription': warrantyDescription,
      };

  // kiểm tra thông tin có trống không
  bool get checkWarrantyInfo =>
      warrantyAddress.isNotNullOrEmpty ||
      warrantyPhone.isNotNullOrEmpty ||
      warrantyMonthNo != null ||
      warrantyDescription.isNotNullOrEmpty;
}
