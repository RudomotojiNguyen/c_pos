part of '../coupon_repository.dart';

class CouponRepositoryImpl implements CouponRepository {
  final CouponServices couponServices;

  CouponRepositoryImpl({required this.couponServices});

  @override
  Future<double> checkCoupon(
      {required String couponCode,
      required int storeId,
      required List<ProductTable> listProduct,
      int? customerId}) {
    return couponServices.checkCoupon(
        couponCode: couponCode,
        storeId: storeId,
        listProduct: listProduct,
        customerId: customerId);
  }

  @override
  Future<DiscountProgramModel> getProductDiscount(
      {required String id, required int storeId}) {
    return couponServices.getProductDiscount(id: id, storeId: storeId);
  }

  @override
  Future<List<CouponModel>> searchCoupon(
      {required List<ProductTable> products,
      int? storeId,
      String? code,
      required int applyChanel,
      required int page,
      required int size,
      int? customerId}) {
    List<Map<String, dynamic>> productInLineItems = [];

    for (var e in products) {
      productInLineItems.add(e.toJsonCheckCoupon());
    }

    return couponServices.searchCoupon(
      params: {"productInLineItems": productInLineItems},
      storeId: storeId,
      code: code,
      applyChanel: applyChanel,
      page: page,
      size: size,
      customerId: customerId,
    );
  }
}
