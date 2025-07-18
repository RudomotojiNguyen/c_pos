part of '../coupon_services.dart';

class CouponServicesImpl implements CouponServices {
  final CouponApi couponApi;

  CouponServicesImpl({required this.couponApi});

  @override
  Future<double> checkCoupon(
      {required String couponCode,
      required int storeId,
      required List<ProductTable> listProduct,
      int? customerId}) {
    List<Map<String, dynamic>> products = [];

    for (var product in listProduct) {
      products.add(product.toJsonCheckCoupon());
    }

    return couponApi.checkCoupon({
      "couponCode": couponCode,
      "storeId": storeId,
      "listProduct": products,
      "customerId": customerId,
    }).then((value) {
      return (value.data ?? 0).toString().toDouble();
    });
  }

  @override
  Future<DiscountProgramModel> getProductDiscount(
      {required String id, required int storeId}) {
    return couponApi.getProductDiscount(id: id, storeId: storeId).then(
          (value) => DiscountProgramModel.fromJson(value.data),
        );
  }

  @override
  Future<List<CouponModel>> searchCoupon(
      {required Map<String, dynamic> params,
      int? storeId,
      String? code,
      required int applyChanel,
      required int page,
      required int size,
      int? customerId}) {
    return couponApi
        .searchCoupon(
            code: code,
            storeId: storeId,
            params: params,
            applyChanel: applyChanel,
            page: page,
            size: size,
            customerId: customerId)
        .then((value) {
      List<CouponModel> data = [];

      for (var voucher in value.data['result']) {
        data.add(CouponModel.fromJson(voucher));
      }

      return data;
    });
  }
}
