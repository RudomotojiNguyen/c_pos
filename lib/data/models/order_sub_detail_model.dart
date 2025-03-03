import 'dart:convert';

import 'package:c_pos/data/models/base_enum_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class OrderSubDetailModel {
  BaseEnumModel? orderSource; // nguồn đơn
  BaseEnumModel? orderType; //loại đơn
  BaseEnumModel? orderStatus; // trạng thái đơn
  DateTime? dateComeToShop; //ngày đến cửa hàng
  DateTime? datePayFor; // ngày thanh toán
  TimeOfDay? timeComToShop; //thời gian tới cửa hàng
  String? shipCode; //mã vận đơn

  OrderSubDetailModel({
    this.orderSource,
    this.orderType,
    this.orderStatus,
    this.dateComeToShop,
    this.datePayFor,
    this.timeComToShop,
    this.shipCode,
  });

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = {};

    data['orderSource'] = orderSource?.toJson();
    data['orderType'] = orderType?.toJson();
    data['orderStatus'] = orderStatus?.toJson();
    data['dateComeToShop'] = dateComeToShop?.toString();
    data['datePayFor'] = datePayFor?.toString();
    data['timeComToShop'] = timeComToShop?.toString();
    data['shipCode'] = shipCode;

    return data;
  }

  OrderSubDetailModel.fromJson(Map<String, dynamic> json) {
    //2024-12-06 00:00:00.000
    DateFormat format = DateFormat('yyyy-MM-dd HH:mm:ss.sss');
    if (json['orderSource'] != null) {
      orderSource = BaseEnumModel.fromJson(json['orderSource']);
    }
    if (json['orderType'] != null) {
      orderType = BaseEnumModel.fromJson(json['orderType']);
    }
    if (json['orderStatus'] != null) {
      orderStatus = BaseEnumModel.fromJson(json['orderStatus']);
    }
    shipCode = json['shipCode'];
    if (json['dateComeToShop'] != null) {
      dateComeToShop = format.parse(json['dateComeToShop']);
    }
    if (json['datePayFor'] != null) {
      datePayFor = format.parse(json['datePayFor']);
    }
    if (json['timeComToShop'] != null) {
      timeComToShop = parseTimeOfDay(json['timeComToShop']);
    }
  }

  OrderSubDetailModel toModel(String value) {
    final res = jsonDecode(value);
    return OrderSubDetailModel.fromJson(res);
  }

  OrderSubDetailModel copyWith({
    BaseEnumModel? orderSource,
    BaseEnumModel? orderType,
    BaseEnumModel? orderStatus,
    DateTime? dateComeToShop,
    DateTime? datePayFor,
    TimeOfDay? timeComToShop,
    String? shipCode,
  }) {
    return OrderSubDetailModel(
      orderSource: orderSource ?? this.orderSource,
      orderType: orderType ?? this.orderType,
      orderStatus: orderStatus ?? this.orderStatus,
      dateComeToShop: dateComeToShop ?? this.dateComeToShop,
      datePayFor: datePayFor ?? this.datePayFor,
      timeComToShop: timeComToShop ?? this.timeComToShop,
      shipCode: shipCode ?? this.shipCode,
    );
  }

  OrderSubDetailModel updateOrderSource({BaseEnumModel? orderSource}) {
    return OrderSubDetailModel(
      orderSource: orderSource,
      orderType: orderType,
      orderStatus: orderStatus,
      dateComeToShop: dateComeToShop,
      datePayFor: datePayFor,
      timeComToShop: timeComToShop,
      shipCode: shipCode,
    );
  }

  OrderSubDetailModel updateOrderType({BaseEnumModel? orderType}) {
    return OrderSubDetailModel(
      orderSource: orderSource,
      orderType: orderType,
      orderStatus: orderStatus,
      dateComeToShop: dateComeToShop,
      datePayFor: datePayFor,
      timeComToShop: timeComToShop,
      shipCode: shipCode,
    );
  }

  OrderSubDetailModel updateOrderStatus({BaseEnumModel? orderStatus}) {
    return OrderSubDetailModel(
      orderSource: orderSource,
      orderType: orderType,
      orderStatus: orderStatus,
      dateComeToShop: dateComeToShop,
      datePayFor: datePayFor,
      timeComToShop: timeComToShop,
      shipCode: shipCode,
    );
  }

  @override
  String toString() {
    return jsonEncode(toJson());
  }

  TimeOfDay parseTimeOfDay(String timeString) {
    // Xác định định dạng chuỗi
    final RegExp regex = RegExp(r'TimeOfDay\((\d{2}):(\d{2})\)');
    final match = regex.firstMatch(timeString);

    if (match != null) {
      // Lấy giá trị giờ và phút từ chuỗi
      final int hour = int.parse(match.group(1)!);
      final int minute = int.parse(match.group(2)!);

      // Trả về TimeOfDay
      return TimeOfDay(hour: hour, minute: minute);
    }

    throw FormatException('Chuỗi không đúng định dạng: $timeString');
  }

  String? get getPaymentDate => datePayFor?.toIso8601String();

  String? get getCheckDate => dateComeToShop?.toIso8601String();

  String? get getCheckTime {
    if (dateComeToShop != null && timeComToShop != null) {
      final DateTime date = DateTime(
          dateComeToShop!.year, dateComeToShop!.month, dateComeToShop!.day);
      final Duration time =
          Duration(hours: timeComToShop!.hour, minutes: timeComToShop!.minute);
      final DateTime checkTime = date.add(time);
      return checkTime.toIso8601String();
    } else {
      return null;
    }
  }

  String? get getShipCode => shipCode;

  int? get getOrderTypeId => orderType?.id;

  int? get getOrderSourceId => orderSource?.id;

  int? get getOrderStatusId => orderStatus?.id;

  // TODO: thêm phần lý do hủy đơn
  int? get getCancelStatusId => null;
}
