part of '../product_table.dart';

extension ProductTableExtension on ProductTable {
  Map<String, dynamic> toJsonCheckCoupon() {
    /// todo: check lại
    Map<String, dynamic> data = <String, dynamic>{};
    // if (productType == ProductType.warranty) {
    //   data['attachs'] = [];
    //   data['gifts'] = [];
    // } else {
    //   data['attachs'] =
    //       getAttaches.map((e) => e.toJsonAttachCheckCoupon()).toList();
    //   data['gifts'] = getGifts.map((e) => e.toJsonGiftCheckCoupon()).toList();
    // }

    // data['discountAmount'] = discountAmount;
    // data['discountProgramId'] = discountProgramId;
    // data['discountType'] = discountType;
    // data['productId'] = productId;
    // data['merchantId'] = merchantId;
    // data['productType'] = 1;
    // data['quantity'] = getQuantity;
    // data['productPrice'] = getSellingPrice;
    // data['sellingPrice'] = getSellingPrice;

    return data;
  }

  // format cho thông tin sp bảo hành
  Map<String, dynamic> toJsonWarrantyCheckCoupon() {
    return {
      /// todo: check lại
      // "id": productId,
      // "warrantyPackageId": warrantyPackageId,
      // "productId": productId,
      // "repurchasePrice": repurchasePrice,
      // "discountType": discountType,
      // "discountValue": discountValue,
      // "fromPrice": fromPrice,
      // "toPrice": toPrice,
      // "code": code,
      // "productName": productName,
      // "productCode": productCode,
      // "originalPrice": originalPrice,
      // "barCode": barCode,
      // "productType": ProductType.warranty.getValueType,
      // "parentProductId": parentProductId,
      // "sellingPrice": sellingPrice,
      // "totalQuantityInStock": totalQuantityInStock,
      // "totalQuantityInStore": totalQuantityInStore,
      // "childs": [],
      // "isGiftTaken": true,
      // "quantity": getQuantity,
      // "attachs": [],
      // "gifts": []
    };
  }

  /// lấy danh sách gói bảo hành đã chọn
  List<ProductTable> get getWarranties {
    /// todo: check lại
    return [];
  }
}
