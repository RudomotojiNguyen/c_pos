import 'dart:convert';

class DeliveryFeeModel {
  int? customerFee; // phí thu của khách
  int? shippingCompanyFee; //phí trả nhà vận chuyển

  DeliveryFeeModel({
    this.customerFee = 0,
    this.shippingCompanyFee = 0,
  });

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = {};

    data['customerFee'] = customerFee;
    data['shippingCompanyFee'] = shippingCompanyFee;

    return data;
  }

  DeliveryFeeModel.fromJson(Map<String, dynamic> json) {
    customerFee = json['customerFee'] ?? 0;
    shippingCompanyFee = json['shippingCompanyFee'] ?? 0;
  }

  DeliveryFeeModel toModel(String value) {
    final res = jsonDecode(value);
    return DeliveryFeeModel.fromJson(res);
  }

  DeliveryFeeModel copyWith({
    int? customerFee,
    int? shippingCompanyFee,
  }) {
    return DeliveryFeeModel(
      customerFee: customerFee ?? this.customerFee,
      shippingCompanyFee: shippingCompanyFee ?? this.shippingCompanyFee,
    );
  }

  @override
  String toString() {
    return jsonEncode(toJson());
  }

  int get getCustomerFee => customerFee ?? 0;

  int get getShippingCompanyFee => shippingCompanyFee ?? 0;

  bool get useDelivery => getCustomerFee > 0 || getShippingCompanyFee > 0;
}
