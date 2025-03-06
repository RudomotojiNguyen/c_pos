import '../../presentation/utils/utils.dart';

class DiscountProgramModel {
  int? id;
  int? discountType;
  double? discountAmount;

  DiscountProgramModel({this.id, this.discountType, this.discountAmount});

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'discountType': discountType,
      'discountAmount': discountAmount,
    };
  }

  factory DiscountProgramModel.fromJson(Map<String, dynamic> json) {
    return DiscountProgramModel(
      id: json['id'],
      discountType: json['discountType'],
      discountAmount: Utils.toDouble(json['discountAmount']),
    );
  }
}
