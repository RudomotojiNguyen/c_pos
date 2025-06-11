import 'package:c_pos/common/di/injection/injection.dart';
import 'package:isar/isar.dart';

import '../../../common/enum/enum.dart';
import '../../../presentation/journey/screen/login/bloc/auth_bloc.dart';
import '../../models/auth_model.dart';
import '../../models/customer_model.dart';
import '../../models/employee_model.dart';
import '../../models/otp_customer_point_model.dart';
import '../local_db/local_db.dart';

part 'impl/drafting_storage_impl.dart';

abstract class DraftingStorage {
  /// init đơn nháp
  Future<void> initDraftingLocalDb(Isar isar);

  /// lắng nghe thay đổi của object
  Stream<void> listenCart(int id);

  /// xóa toàn bộ đơn
  Future<void> clearCart();

  /// lấy danh sách đơn nháp
  Future<List<DraftingInvoiceTable>> getDraftingInvoiceList();

  /// Tạo đơn nháp
  Future<int?> createDraftingInvoice({required CartType cartType});

  /// xóa đơn nháp theo draft id
  Future<void> deleteDraftingInvoice({required int draftId});

  /// lấy đơn nháp theo draft id
  Future<DraftingInvoiceTable?> getDraftingInvoice({required int draftId});

  /// xóa thông tin khách hàng
  Future<DraftingInvoiceTable?> clearCustomerInfo({
    required int cartId,
  });

  /// cập nhật thông tin khách hàng
  Future<DraftingInvoiceTable?> updateCustomerInfo({
    required int cartId,
    required CustomerModel customerInfo,
  });

  /// cập nhật thông tin người bán hàng
  Future<DraftingInvoiceTable?> updateSaleInfo({
    required int cartId,
    required EmployeeModel saleInfo,
  });

  /// cập nhật thông tin kỹ thuật
  Future<DraftingInvoiceTable?> updateTechInfo({
    required int cartId,
    required EmployeeModel techInfo,
  });

  /// cập nhật ghi chú
  Future<DraftingInvoiceTable?> updateBillNote({
    required int cartId,
    String? saleNote,
    String? warrantyNote,
  });

  /// cập nhật thông tin giảm coupon
  Future<DraftingInvoiceTable?> updateDiscountCoupon({
    required int cartId,
    double? discountTotalBill,
    String? couponDiscountCode,
  });

  /// cập nhật thông tin tiêu điểm
  Future<DraftingInvoiceTable?> updateDiscountBillByPoint({
    required int cartId,
    OtpCustomerPointModel? discountByPoint,
  });

  /// xóa phương thức thanh toán
  Future<DraftingInvoiceTable?> removePaymentMethod({
    required int cartId,
    required int paymentMethodId,
  });

  /// thêm phương thức thanh toán
  Future<DraftingInvoiceTable?> modifyPaymentMethod({
    required int cartId,
    required PaymentMethodTable paymentMethod,
  });

  /// cập nhật loại thu cũ
  Future<DraftingInvoiceTable?> updateTradeInType({
    required TradeInType type,
    required int cartId,
  });

  /// thêm thông tin sản phẩm
  Future<DraftingInvoiceTable?> addItemToCart({
    required ProductTable product,
    required int cartId,
    List<ProductTable>? gifts,
    List<ProductTable>? attaches,
    List<ProductTable>? warranties,
    List<VoucherTable>? vouchers,
  });

  /// Xóa sản phẩm khỏi giỏ hàng
  Future<DraftingInvoiceTable?> removeProductOnCart({
    required int productId,
    required int cartId,
  });
}
