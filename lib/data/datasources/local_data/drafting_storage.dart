import 'package:c_pos/common/di/injection/injection.dart';
import 'package:flutter/material.dart';
import 'package:isar/isar.dart';

import '../../../common/constants/app_constants.dart';
import '../../../common/enum/enum.dart';
import '../../../presentation/journey/screen/login/bloc/auth_bloc.dart';
import '../../models/auth_model.dart';
import '../../models/bill_item_model.dart';
import '../../models/bill_model.dart';
import '../../models/customer_model.dart';
import '../../models/order_item.dart';
import '../../models/order_model.dart';
import '../../models/otp_customer_point_model.dart';
import '../../models/payment_model.dart';
import '../../models/product_imei_model.dart';
import '../../models/product_model.dart';
import '../local_db/local_db.dart';

part 'impl/drafting_storage_impl.dart';

abstract class DraftingStorage {
  /// init đơn nháp
  Future<void> initDraftingLocalDb(Isar isar);

  /// lắng nghe thay đổi của object
  Stream<void> listenCart(int id);

  /// xóa toàn bộ đơn
  Future<void> clearCart();

  /// lấy danh sách đơn
  Future<List<DraftingInvoiceTable>> getCarts();

  /// lấy thông tin đơn theo id
  Future<DraftingInvoiceTable?> getCart(int cartId);

  /// tạo đơn mới theo type được truyền vào
  Future<int?> createNewCart({required CartType typeCart});

  /// thêm nhiều sản phẩm vào đơn
  Future<DraftingInvoiceTable?> addItemsToCart({
    required List<ProductTable> products,
    required int cartId,
    List<ProductTable>? gifts,
    List<ProductTable>? attaches,
    List<ProductTable>? warranties,
  });

  /// cập nhật thông tin tiêu điểm
  Future<DraftingInvoiceTable?> updateDiscountBillByPoint({
    required int cartId,
    OtpCustomerPointModel? discountByPoint,
  });

  /// xóa thông tin tiêu điểm
  Future<DraftingInvoiceTable?> deleteDiscountBillByPoint(
      {required int cartId});

  /// thêm thông tin sản phẩm
  Future<DraftingInvoiceTable?> addItemToCart({
    required ProductTable product,
    required int cartId,
    List<ProductTable>? gifts,
    List<ProductTable>? attaches,
    List<ProductTable>? warranties,
  });

  /// cập nhật sản phẩm trong đơn
  Future<DraftingInvoiceTable?> updateItemToCart({
    required ProductTable product,
    required int cartId,
    List<ProductTable>? gifts,
    List<ProductTable>? attaches,
    List<ProductTable>? warranties,
  });

  /// xóa đơn theo id
  Future<bool?> removeCartById(int cartId);

  /// cập nhật thông tin khách hàng
  Future<DraftingInvoiceTable?> updateCustomerInfo({
    required int cartId,
    required CustomerModel customerInfo,
  });

  /// xóa thông tin khách hàng
  Future<DraftingInvoiceTable?> clearCustomerInfo({required int cartId});

  /// đếm số bill chưa phục vụ
  Future<int> countTotalBill();

  /// Xóa sản phẩm khỏi giỏ hàng
  Future<DraftingInvoiceTable?> removeProductOnCart({
    required int productId,
    required int cartId,
  });

  /// thêm phương thức thanh toán
  Future<DraftingInvoiceTable?> modifyPaymentMethod({
    required int cartId,
    required PaymentMethodTable paymentMethod,
  });

  /// xóa phương thức thanh toán
  Future<DraftingInvoiceTable?> removePaymentMethod({
    required int cartId,
    required int paymentMethodId,
  });

  /// cập nhật thông tin giảm coupon
  Future<DraftingInvoiceTable?> updateDiscountCoupon({
    required int cartId,
    double? discountTotalBill,
    String? couponDiscountCode,
  });

  /// cập nhật thông tin giảm coupon
  Future<DraftingInvoiceTable?> updateBillNote({
    required int cartId,
    String? saleNote,
    String? warrantyNote,
  });

  /// cập nhật imei sản phẩm trong giỏ hàng
  Future<DraftingInvoiceTable?> updateImeiOfProduct({
    required int cartId,
    required ProductImeiModel productImei,
    required int productId,
  });

  /// cập nhật ghi chú sản phẩm trong giỏ hàng
  Future<DraftingInvoiceTable?> updateNoteOfProduct({
    required int cartId,
    required String note,
    required int productId,
  });

  /// cập nhật ghi chú sản phẩm trong giỏ hàng
  Future<DraftingInvoiceTable?> updateProductDiscountByHand({
    required int cartId,
    required double amount,
    required int discountType,
    required int productId,
  });

  /// cập nhật số lượng sản phẩm trong giỏ hàng
  Future<DraftingInvoiceTable?> updateProductQuantity({
    required int quantity,
    required int productId,
    required int cartId,
  });

  /// cập nhật phí giao hàng
  Future<DraftingInvoiceTable?> updateDeliveryFee({
    int? customerFee,
    int? shippingCompanyFee,
    required int cartId,
  });

  /// cập nhật nội dung đơn cơ bản: nguồn đơn, trạng thái,...
  Future<DraftingInvoiceTable?> updateOrderSubDetail({
    required OrderSubDetailModel data,
    required int cartId,
  });

  /// chuyển đơn hàng thành đơn nháp để cập nhật
  Future<DraftingInvoiceTable?> convertOrderDetailToCartStorage({
    required OrderModel orderDetail,
    required CartType typeCart,
    CustomerModel customer,
    int? currentDraftId,
  });

  /// chuyển hóa đơn thành đơn nháp để cập nhật
  Future<DraftingInvoiceTable?> convertBillDetailToCartStorage({
    required BillModel billDetail,
    required CartType typeCart,
  });

  /// chuyển hoá đơn thành đơn nháp để tạo bảo hành
  Future<DraftingInvoiceTable?> convertToWarrantyDraft({
    required BillModel billDetail,
    required CartType typeCart,
    AuthModel? userInfo,
  });

  /// cập nhật thông tin thu lại sản phẩm
  Future<DraftingInvoiceTable?> updateCheckRepurchaseProduct({
    required int cartId,
    required int productId,
    required bool isCheck,
    required XItemType productType,
  });

  /// cập nhật giá mua lại sản phẩm
  Future<DraftingInvoiceTable?> updateRepurchasePriceProduct({
    required int cartId,
    required int productId,
    required double repurchasePrice,
    required XItemType productType,
  });

  /// cập nhật imei sản phẩm
  Future<DraftingInvoiceTable?> updateAttachImei({
    required int cartId,
    required int productId,
    required String imeiStr,
  });

  /// thêm sản phẩm quà tặng
  Future<DraftingInvoiceTable?> addProductGift({
    required int cartId,
    required ProductModel product,
    required int parentProductId,
  });

  ///
  /// for tradein
  ///

  /// cập nhật loại thu cũ
  Future<DraftingInvoiceTable?> updateTradeInType({
    required TradeInType type,
    required int cartId,
  });

  /// cập nhật sản phẩm thu cũ
  Future<DraftingInvoiceTable?> updateProductTradeIn({
    required ProductTable product,
    required int cartId,
  });
}
