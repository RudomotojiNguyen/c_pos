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

    return couponApi
        .searchCoupon(
            code: code,
            storeId: storeId,
            params: {"productInLineItems": productInLineItems},
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
