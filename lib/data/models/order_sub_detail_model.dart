import 'dart:convert';

import 'package:c_pos/common/extensions/extension.dart';
import 'package:c_pos/data/models/models.dart';
import 'package:intl/intl.dart';

import '../../common/enum/enum.dart';

class OrderSubDetailModel {
  BaseEnumModel? orderSource; // nguồn đơn
  BaseEnumModel? orderType; //loại đơn
  BaseEnumModel? orderStatus; // trạng thái đơn
  DateTime? dateComeToShop; //ngày đến cửa hàng
  DateTime? datePayFor; // ngày thanh toán
  DateTime? timeComToShop; //thời gian tới cửa hàng
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
    DateFormat format = DateFormat(XDateTimeEnum.defaultDateTimeBasic.getValue);
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
      timeComToShop = (json['timeComToShop'].toString()).convertToDateTime;
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
    DateTime? timeComToShop,
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

  String? get getPaymentDate => datePayFor?.toIso8601String();

  String? get getCheckDate => dateComeToShop?.toIso8601String();

  String? get getCheckTime {
    if (dateComeToShop != null && timeComToShop != null) {
      final DateTime date = DateTime(
        dateComeToShop!.year,
        dateComeToShop!.month,
        dateComeToShop!.day,
      );
      final Duration time = Duration(
        hours: timeComToShop!.hour,
        minutes: timeComToShop!.minute,
      );
      final DateTime checkTime = date.add(time);
      return checkTime.toIso8601String();
    } else {
      return null;
    }
  }

  String? get getShipCode => shipCode;

  int? get getOrderTypeId => orderType?.id;

  String? get getOrderTypeName => orderType?.name;

  int? get getOrderSourceId => orderSource?.id;

  String? get getOrderSourceName => orderSource?.name;

  int? get getOrderStatusId => orderStatus?.id;

  String? get getOrderStatusName => orderStatus?.name;

  /// todo: lý do hủy đơn
  int? get getCancelStatusId => null;

  String? get getCancelStatusName => null;

  /// todo: Trạng thái thanh toán
  String? get getPartnerPaymentStatus => null;

  String? get getPartnerPaymentStatusName => null;

  Map<String, dynamic> formatOrderSubDetailCreateBill() {
    Map<String, dynamic> data = {};
    data['status'] = getOrderStatusId;
    data['statusName'] = getOrderStatusName;
    data['checkDate'] = getCheckDate;
    data['checkTime'] = getCheckTime;
    data['paymentDate'] = getPaymentDate;
    data['codeShip'] = getShipCode;
    data['orderType'] = getOrderTypeId;
    data['orderTypeName'] = getOrderTypeName;
    data['orderSourceId'] = getOrderSourceId;
    data['orderSourceName'] = getOrderSourceName;

    // data['cancelStatus'] = getCancelStatusId;
    // data['cancelStatusName'] = getCancelStatusName;
    // data['partnerPaymentStatus'] = getPartnerPaymentStatus;
    // data['partnerPaymentStatusName'] = getPartnerPaymentStatusName;

    return data;
  }
}
