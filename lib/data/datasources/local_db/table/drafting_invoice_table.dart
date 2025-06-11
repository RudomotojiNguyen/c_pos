import 'dart:convert';

import 'package:isar/isar.dart';

import '../../../../common/enum/enum.dart';
import '../../../models/delivery_fee_model.dart';
import '../../../models/employee_model.dart';
import '../../../models/order_sub_detail_model.dart';
import '../../../models/otp_customer_point_model.dart';
import '../local_db.dart';

part 'drafting_invoice_table.g.dart';

part 'extensions/drafting_invoice_table_extension.dart';

@Collection()
class DraftingInvoiceTable {
  Id id = Isar.autoIncrement;

  ///loại đơn nháp
  @Enumerated(EnumType.ordinal)
  late CartType typeCart;

  /// link thông tin khách
  final customer = IsarLink<CustomerTable>();

  /// Giảm giá theo loại nào: DMem/Point
  @Enumerated(EnumType.ordinal)
  DiscountMemberType discountMemberType = DiscountMemberType.none;

  ///loại đơn nháp
  @Enumerated(EnumType.ordinal)
  late TradeInType tradeInType;

  ///Thông tin nhân viên bán
  String? saleInfoStr;

  @ignore
  EmployeeModel? get saleInfo =>
      saleInfoStr != null ? EmployeeModel().toModel(saleInfoStr!) : null;

  set saleInfo(EmployeeModel? value) {
    saleInfoStr = value != null ? jsonEncode(value.toJson()) : null;
  }

  /// Thông tin nhân viên hỗ trợ kỹ thuật
  String? technicalInfoStr;

  @ignore
  EmployeeModel? get technicalInfo => technicalInfoStr != null
      ? EmployeeModel().toModel(technicalInfoStr!)
      : null;

  set technicalInfo(EmployeeModel? value) {
    technicalInfoStr = value?.toString();
  }

  /// Danh sách sản phẩm, bill items
  final products = IsarLinks<ProductTable>();

  /// Thông tin sản phẩm định giá
  final product = IsarLink<ProductTable>();

  /// Danh sách phương thức thanh toán
  final paymentMethods = IsarLinks<PaymentMethodTable>();

  /// Danh sách các thanh toán trước đó
  final paymentMethodsPrePay = IsarLinks<PaymentMethodTable>();

  /// thời gian tạo đơn
  late DateTime createdDate;

  /// ghi chú bảo hành
  String? warrantyNote;

  /// ghi chú bán hàng
  String? saleNote;

  /// phí liên quan tới giao hàng
  // String? deliveryFeeStr;

  // @ignore
  // DeliveryFeeModel? get deliveryFee => deliveryFeeStr != null
  //     ? DeliveryFeeModel().toModel(deliveryFeeStr!)
  //     : null;

  // set deliveryFee(DeliveryFeeModel? value) {
  //   deliveryFeeStr = value?.toString();
  // }

  // String? orderSubDetailStr;

  // @ignore
  // OrderSubDetailModel? get orderSubDetail => orderSubDetailStr != null
  //     ? OrderSubDetailModel().toModel(orderSubDetailStr!)
  //     : null;

  // set orderSubDetail(OrderSubDetailModel? value) {
  //   orderSubDetailStr = value?.toString();
  // }

  /// coupon code
  String? couponDiscountCode;

  /// lưu giá giảm trên tổng bill khi nhập và lúc check coupon
  double? discountTotalBill;
}
