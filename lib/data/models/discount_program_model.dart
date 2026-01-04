import '../../presentation/utils/utils.dart';

class DiscountProgramModel {
  int? id;
  int? discountType;
  double? discountAmount;
  String? name;

  DiscountProgramModel(
      {this.id, this.discountType, this.discountAmount, this.name});

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'discountType': discountType,
      'discountAmount': discountAmount,
      'name': name,
    };
  }

  factory DiscountProgramModel.fromJson(Map<String, dynamic> json) {
    return DiscountProgramModel(
      id: json['id'],
      discountType: json['discountType'],
      discountAmount: Utils.toDouble(json['discountAmount']),
      name: json['name'],
    );
  }
}
