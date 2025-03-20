import 'dart:convert';

class OtpCustomerPointModel {
  double? amountTransferFromPoint; // số tiền được quy đổi bằng điểm
  int? pointWillUse; // số điểm sẽ dùng
  bool? isValidOTP;
  String? otpCodeDmem;

  OtpCustomerPointModel({
    this.amountTransferFromPoint,
    this.pointWillUse,
    this.isValidOTP,
    this.otpCodeDmem,
  });

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = {};

    data['amountTransferFromPoint'] = amountTransferFromPoint;
    data['pointWillUse'] = pointWillUse;
    data['isValidOTP'] = isValidOTP;
    data['otpCodeDmem'] = otpCodeDmem;

    return data;
  }

  OtpCustomerPointModel.fromJson(Map<String, dynamic> json) {
    amountTransferFromPoint = json['amountTransferFromPoint'];
    pointWillUse = json['pointWillUse'];
    isValidOTP = json['isValidOTP'];
    otpCodeDmem = json['otpCodeDmem'];
  }

  OtpCustomerPointModel toModel(String value) {
    final res = jsonDecode(value);
    return OtpCustomerPointModel.fromJson(res);
  }

  OtpCustomerPointModel copyWith({
    double? amountTransferFromPoint,
    int? pointWillUse,
    bool? isValidOTP,
    String? otpCodeDmem,
  }) {
    return OtpCustomerPointModel(
      amountTransferFromPoint:
          amountTransferFromPoint ?? this.amountTransferFromPoint,
      pointWillUse: pointWillUse ?? this.pointWillUse,
      isValidOTP: isValidOTP ?? this.isValidOTP,
      otpCodeDmem: otpCodeDmem ?? this.otpCodeDmem,
    );
  }

  @override
  String toString() {
    return jsonEncode(toJson());
  }
}
