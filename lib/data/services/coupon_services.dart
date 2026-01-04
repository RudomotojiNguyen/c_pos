import 'package:c_pos/common/extensions/extension.dart';

import '../datasources/local_db/local_db.dart';
import '../datasources/remote/api_remote.dart';
import '../models/coupon_model.dart';

part 'impl/coupon_services_impl.dart';

abstract class CouponServices {
  Future<double> checkCoupon({
    required String couponCode,
    required int storeId,
    required List<ProductTable> listProduct,
    int? customerId,
  });

  Future<List<CouponModel>> searchCoupon(
      {required List<ProductTable> products,
      int? storeId,
      String? code,
      required int applyChanel,
      required int page,
      required int size,
      int? customerId});
}
