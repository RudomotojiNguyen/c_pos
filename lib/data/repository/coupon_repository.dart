import '../datasources/local_db/local_db.dart';
import '../models/coupon_model.dart';
import '../models/discount_program_model.dart';
import '../services/coupon_services.dart';

part 'impl/coupon_repository_impl.dart';

abstract class CouponRepository {
  Future<DiscountProgramModel> getProductDiscount({
    required String id,
    required int storeId,
  });

  Future<double> checkCoupon({
    required String couponCode,
    required int storeId,
    required List<ProductTable> listProduct,
    int? customerId,
  });

  Future<List<CouponModel>> searchCoupon({
    required List<ProductTable> products,
    int? storeId,
    String? code,
    required int applyChanel,
    required int page,
    required int size,
    int? customerId,
  });
}
