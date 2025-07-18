import 'dart:convert';

class OtpCustomerPointModel {
  double? amountTransferFromPoint; // số tiền được quy đổi bằng điểm
  int? pointWillUse; // số điểm sẽ dùng
  bool? isValidOTP;
  String? otpCode;

  OtpCustomerPointModel({
    this.amountTransferFromPoint,
    this.pointWillUse,
    this.isValidOTP,
    this.otpCode,
  });

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = {};

    data['amountTransferFromPoint'] = amountTransferFromPoint;
    data['pointWillUse'] = pointWillUse;
    data['isValidOTP'] = isValidOTP;
    data['otpCode'] = otpCode;

    return data;
  }

  OtpCustomerPointModel.fromJson(Map<String, dynamic> json) {
    amountTransferFromPoint = json['amountTransferFromPoint'];
    pointWillUse = json['pointWillUse'];
    isValidOTP = json['isValidOTP'];
    otpCode = json['otpCode'];
  }

  OtpCustomerPointModel toModel(String value) {
    final res = jsonDecode(value);
    return OtpCustomerPointModel.fromJson(res);
  }

  OtpCustomerPointModel copyWith({
    double? amountTransferFromPoint,
    int? pointWillUse,
    bool? isValidOTP,
    String? otpCode,
  }) {
    return OtpCustomerPointModel(
      amountTransferFromPoint:
          amountTransferFromPoint ?? this.amountTransferFromPoint,
      pointWillUse: pointWillUse ?? this.pointWillUse,
      isValidOTP: isValidOTP ?? this.isValidOTP,
      otpCode: otpCode ?? this.otpCode,
    );
  }

  @override
  String toString() {
    return jsonEncode(toJson());
  }
}
