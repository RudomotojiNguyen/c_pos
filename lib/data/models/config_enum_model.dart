import 'base_enum_model.dart';

class ConfigEnumModel {
  List<BaseEnumModel>? status;
  List<BaseEnumModel>? cancelStatus;
  List<BaseEnumModel>? orderType;

  ConfigEnumModel({this.status, this.cancelStatus, this.orderType});

  ConfigEnumModel.fromJson(Map<String, dynamic> json) {
    if (json['status'] != null) {
      status = <BaseEnumModel>[];
      json['status'].forEach((v) {
        status!.add(BaseEnumModel.fromJson(v));
      });
    }
    if (json['cancelStatus'] != null) {
      cancelStatus = <BaseEnumModel>[];
      json['cancelStatus'].forEach((v) {
        cancelStatus!.add(BaseEnumModel.fromJson(v));
      });
    }
    if (json['orderType'] != null) {
      orderType = <BaseEnumModel>[];
      json['orderType'].forEach((v) {
        orderType!.add(BaseEnumModel.fromJson(v));
      });
    }
  }
}
