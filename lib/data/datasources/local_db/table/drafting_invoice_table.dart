import 'package:c_pos/common/di/injection/injection.dart';
import 'package:c_pos/data/models/models.dart';
import 'package:isar/isar.dart';

import '../../../../common/enum/enum.dart';
import '../../../../presentation/journey/screen/login/bloc/auth_bloc.dart';
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
