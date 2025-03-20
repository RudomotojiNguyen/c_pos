import 'package:c_pos/common/extensions/extension.dart';

import '../datasources/local_db/local_db.dart';
import '../datasources/remote/coupon_api.dart';
import '../models/coupon_model.dart';
import '../models/discount_program_model.dart';

part 'impl/coupon_services_impl.dart';

abstract class CouponServices {
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
    required Map<String, dynamic> params,
    int? storeId,
    String? code,
    required int applyChanel,
    required int page,
    required int size,
    int? customerId,
  });
}
