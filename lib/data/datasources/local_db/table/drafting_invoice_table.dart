import 'dart:convert';

import 'package:c_pos/common/di/injection/injection.dart';
import 'package:c_pos/common/extensions/extension.dart';
import 'package:intl/intl.dart';
import 'package:isar/isar.dart';

import '../../../../common/enum/enum.dart';
import '../../../../presentation/journey/screen/login/bloc/auth_bloc.dart';
import '../../../models/auth_model.dart';
import '../../../models/base_enum_model.dart';
import '../../../models/otp_customer_point_model.dart';
import '../../../models/store_model.dart';
import '../local_db.dart';

part 'drafting_invoice_table.g.dart';

part 'extensions/drafting_invoice_table_extension.dart';

@Collection()
class DraftingInvoiceTable {
  Id id = Isar.autoIncrement;

  int? preOrderId;

  ///loại đơn nháp
  @Enumerated(EnumType.ordinal)
  late CartType typeCart;

  ///loại đơn nháp
  @Enumerated(EnumType.ordinal)
  late TradeInType tradeInType;

  /// Giảm giá theo loại nào: Point
  @Enumerated(EnumType.ordinal)
  DiscountMemberType discountMemberType = DiscountMemberType.none;

  /// Thông tin của khách hàng
  final customer = IsarLink<CustomerTable>();

  ///
  int? billNumber;

  /// Danh sách sản phẩm, bill items
  final products = IsarLinks<ProductTable>();

  /// Thông tin sản phẩm định giá
  final product = IsarLink<ProductTable>();

  /// imei sản phẩm định giá
  String? productImei;

  /// notes: hiện tại chưa cần trường này
  bool? isEstimateCost;

  /// sản phẩm đã mua tại công ty
  bool? isSoldByCompany;

  /// phương thức thu cũ
  bool? method;

  /// thời gian tạo đơn
  late DateTime createdDate;

  /// id của đơn khi cập nhật bill
  String? billId;

  /// id của đơn hàng khi chuyển từ order -> bill hoặc cập nhật order
  int? orderId;

  /// ghi chú cho khách
  String? customerNote;

  /// ghi chú bảo hành
  String? warrantyNote;

  /// ghi chú của sale thường hiển thị nội bộ
  String? saleNote;

  /// thông tin của hàng đang tìm kiếm
  String? storeStr;

  @ignore
  StoreModel? get store =>
      storeStr != null ? StoreModel().toModel(storeStr!) : null;

  set store(StoreModel? value) {
    storeStr = value?.toString();
  }

  /// phí liên quan tới giao hàng
  String? deliveryFeeStr;

  @ignore
  DeliveryFeeModel? get deliveryFee => deliveryFeeStr != null
      ? DeliveryFeeModel().toModel(deliveryFeeStr!)
      : null;

  set deliveryFee(DeliveryFeeModel? value) {
    deliveryFeeStr = value?.toString();
  }

  /// dành cho order
  String? orderSubDetailStr;

  @ignore
  OrderSubDetailModel? get orderSubDetail => orderSubDetailStr != null
      ? OrderSubDetailModel().toModel(orderSubDetailStr!)
      : null;

  set orderSubDetail(OrderSubDetailModel? value) {
    orderSubDetailStr = value?.toString();
  }

  /// chọn thông tin mặc định
  bool? isDefaultInfo;

  /// xuất hóa đơn
  bool? vatChecked;

  /// tích điểm tự động
  bool? isCountPoint;

  /// Danh sách phương thức thanh toán
  final paymentMethods = IsarLinks<PaymentMethodTable>();

  /// Danh sách các thanh toán trước đó
  final paymentMethodsPrePay = IsarLinks<PaymentMethodTable>();

  /// lưu giá giảm trên tổng bill khi nhập và lúc check coupon
  double? discountTotalBill;

  /// coupon code
  String? couponDiscountCode;

  ///otp dùng cho bảo hành
  String? customerOtp;
}

class DeliveryFeeModel {
  int? customerFee; // phí thu của khách
  int? shippingCompanyFee; //phí trả nhà vận chuyển

  DeliveryFeeModel({this.customerFee = 0, this.shippingCompanyFee = 0});

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

  DeliveryFeeModel copyWith({int? customerFee, int? shippingCompanyFee}) {
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

  Map<String, dynamic> formatDeliveryFeeCreateBill() {
    Map<String, dynamic> data = {};

    data['customerShipFee'] = customerFee;
    data['shipFee'] = shippingCompanyFee;

    return data;
  }
}

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
