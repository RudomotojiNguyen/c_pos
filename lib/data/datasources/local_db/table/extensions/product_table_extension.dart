part of '../product_table.dart';

extension ProductTableExtension on ProductTable {
  bool get checkIsComboProduct => isComboProduct ?? false;

  int get getMerchantId => merchantId ?? 1;

  String get getProductImei => imei?.imeiNo ?? '';

  XDiscountType get getDiscountType =>
      discountType?.getDiscountType ?? XDiscountType.none;

  int get getTotalQuantityInStore => totalQuantityInStore ?? 0;

  bool get isCheckRepurchasePrice => isRepurchasePrice ?? false;

  bool get isBelongToWarrantyImei => belongToWarrantyImei ?? false;

  String get getDataCopy => '$productName - $barCode';

  /// lấy danh sách quà tặng đã chọn
  List<ProductTable> get getGifts {
    if (giftsSelected == null && productsGift.isNotEmpty) {
      return productsGift.map((e) => e).toList();
    }
    return giftsSelected ?? [];
  }

  /// lấy danh sách sản phẩm mua kèm đã chọn
  List<ProductTable> get getAttaches {
    if (attachesSelected == null && productsAttach.isNotEmpty) {
      return productsAttach.map((e) => e).toList();
    }
    return attachesSelected ?? [];
  }

  /// lấy danh sách gói bảo hành đã chọn
  List<ProductTable> get getWarranties {
    if (warrantiesSelected == null && productsWarranty.isNotEmpty) {
      return productsWarranty.map((e) => e).toList();
    }
    return warrantiesSelected ?? [];
  }

  /// lấy danh sách voucher đã chọn
  List<VoucherTable> get getVouchers {
    if (vouchersSelected == null && vouchers.isNotEmpty) {
      return vouchers.map((e) => e).toList();
    }
    return vouchersSelected ?? [];
  }

  /// lấy hình sản phẩm
  String get getImageThumbnail =>
      image.isNotNullOrEmpty ? image! : AppConstants.defaultImage;

  /// lấy tên sản phẩm
  String get getName => productChild?.getName ?? productName ?? '';

  /// lấy barcode
  String get getBarCode => barCode ?? '';

  /// lấy imei
  String get getImei => imei?.getImeiNoValue ?? '';

  /// lấy số lượng tồn tại của hàng
  int get getStockQuantity => totalQuantityInStock ?? 0;

  /// lấy giá chiết khấu tự động
  double get getDiscountPrice => discountPrice ?? 0;

  /// lấy giá bán của sản phẩm
  double get getSellingPrice {
    switch (productChildType) {
      case ProductType.gift:
        return getRepurchasePrice;
      default:
        return sellingPrice ?? 0;
    }
  }

  /// giá bán sau chiết khấu
  /// hoặc có thể là giá thu lại (đối với quà tặng)
  double get getRepurchasePrice => repurchasePrice ?? 0;

  /// giá sản phẩm sau khi tr chương trình và các giảm giá khác
  double get getProductPrice =>
      (getSellingPrice * getQuantity) -
      (calculateCustomerDiscountAmount) -
      (calculatorProductDiscountAmount);

  /// tính tiền sản phẩm theo số lượng
  double get calculatorTotalSellingPrice => getSellingPrice * getQuantity;

  /// chiết khấu tự động
  double get getDiscountAmount => discountAmount ?? 0;

  /// số lần xuất hiện
  int get getAppearTimes => appearTimes ?? 0;

  /// số lượng sản phẩm
  int get getQuantity => quantity ?? 1;

  ///
  XDiscountType get customerDiscountType =>
      customerDiscountForProduct?.discountType ?? XDiscountType.none;

  /// số tiền khách được giảm theo DMem
  double get getCustomerSellingDiscount =>
      customerDiscountForProduct?.sellingDiscount ?? 0;

  /// giá trị khách được giảm theo DMem
  double get getCustomerValueDiscount => customerDiscountForProduct?.value ?? 0;

  /// số tiền tối đa khách được giảm theo DMem
  double get getCustomerDiscountMaxAmount =>
      customerDiscountForProduct?.maxValue ?? 0;

  /// lấy số tiền khách được giảm theo chiết khấu tay
  double get getDiscountAmountByHand {
    if (discountByHand == null) {
      return 0;
    }

    double amount = 0;
    if (discountByHand!.getDiscountType == XDiscountType.amount) {
      amount = discountByHand!.amount ?? 0;
    }
    if (discountByHand!.getDiscountType == XDiscountType.percent) {
      amount = ((getSellingPrice * (discountByHand!.amount ?? 0)) / 100) *
          getQuantity;
    }
    return amount;
  }

  /// tính tổng tiền sản phẩm mua kèm
  double get totalPriceOfAttaches => getAttaches.fold(
        0,
        (previousValue, element) =>
            previousValue + element.calculatorTotalSellingPrice,
      );

  /// tính tổng tiền gói bảo hành
  double get totalPriceOfWarranties => getWarranties.fold(
        0,
        (previousValue, element) =>
            previousValue + element.calculatorTotalSellingPrice,
      );

  /// tính số tiền được giảm giá theo voucher
  double get calculatorAmountDiscountByVoucher =>
      getVouchers.fold(0, (previousValue, element) {
        int totalQuantity = element.cumulativeStringValues.isNotEmpty
            ? Utils.countQuantityProductApplyMoreBuyMoreDiscount(
                products,
                getVouchers,
              )
            : getQuantity;

        return previousValue +
            Utils.discountAmountByVoucher(
              usedVoucherQuantity: totalQuantity,
              voucher: element,
              sellingPrice: getSellingPrice,
              quantity: getQuantity,
            );
      });

  /// tính tổng tiền giảm giá của 1 SP = Ctr CK tự động + CK tay + voucher
  double get calculatorProductDiscountAmount {
    /// notes: kiểm tra lại không để tổng tiền giảm giá lớn hơn giá bán
    final finalProductDiscountAmount = getDiscountAmount +
        getDiscountAmountByHand +
        calculatorAmountDiscountByVoucher;
    return finalProductDiscountAmount > calculatorTotalSellingPrice
        ? calculatorTotalSellingPrice
        : finalProductDiscountAmount;
  }

  List<ProductTable> get products => getIt.isRegistered<DraftingInvoiceBloc>()
      ? (getIt.get<DraftingInvoiceBloc>().state.products ?? [])
      : [];

  double get discountForCombo =>
      products.totalDiscountPriceWhenBuyingImeiAndComboProduct;

  /// Tính phần giảm giá theo d-mem
  /// Giảm $: giảm chính = số tiền, d-mem ko X quantity
  ///         vd: Giá sau chiết khấu của KCL (SL:2) = 380k, d-mem 50k
  ///         Giảm d-mem: 380 - 50
  /// Giảm %: giảm % trên tổng giá sau CK, d-mem ko X quantity
  ///         vd: Giá sau chiết khấu của KCL (SL:2) = 380k, d-mem 1%
  ///         Giảm d-mem: 380 * 0.01
  /// @param item
  /// @param afterDiscountPrice number
  ///
  double get calculateCustomerDiscountAmount {
    // discountAmount bao gồm: CK ctr, voucher, CK tay
    // double discountAmount = calculatorProductDiscountAmount;
    // if (isComboProduct == true) {
    //   discountAmount = discountForCombo + calculatorProductDiscountAmount;
    // }
    // double afterDiscountPrice = getSellingPrice * getQuantity - discountAmount;

    // if (customerDiscountType == DiscountType.percent) {
    // double amount = (afterDiscountPrice * getCustomerValueDiscount) / 100;
    // double maxValue = getCustomerDiscountMaxAmount;
    // if (maxValue > 0) {
    //   return amount <= maxValue ? amount : maxValue;
    // } else {
    //   return amount;
    // }
    // }
    if (customerDiscountType == XDiscountType.amount) {
      return getCustomerValueDiscount;
    }
    return 0;
  }

  /// tổng chiết khấu của sản phẩm, sản phẩm bán kèm, gới bảo hành
  double get getTotalDiscountPriceOfProduct {
    double productAttachDiscountAmount = getAttaches.fold(
      0,
      (previousValue, attach) =>
          previousValue +
          attach.calculatorProductDiscountAmount +
          attach.calculateCustomerDiscountAmount,
    );
    double productWarrantyDiscountAmount = getWarranties.fold(
      0,
      (previousValue, warranty) =>
          previousValue +
          warranty.calculatorProductDiscountAmount +
          warranty.calculateCustomerDiscountAmount,
    );

    return calculatorProductDiscountAmount +
        calculateCustomerDiscountAmount +
        productAttachDiscountAmount +
        productWarrantyDiscountAmount;
  }

  /// tính tiền sản phẩm chưa giảm giá gồm
  /// giá bán của sản phẩm + tổng tiền sản phẩm mua kèm + tổng tiền gói bảo hành
  double get totalPriceNoneDiscount =>
      calculatorTotalSellingPrice +
      totalPriceOfAttaches +
      totalPriceOfWarranties;

  ///
  ///
  ///

  Map<String, dynamic> toJsonCheckCoupon() {
    Map<String, dynamic> data = <String, dynamic>{};
    if (productType == ProductType.warranty) {
      data['attachs'] = [];
      data['gifts'] = [];
    } else {
      data['attachs'] =
          getAttaches.map((e) => e.toJsonAttachCheckCoupon()).toList();
      data['gifts'] = getGifts.map((e) => e.toJsonGiftCheckCoupon()).toList();
    }

    data['discountAmount'] = discountAmount;
    data['discountProgramId'] = discountProgramId;
    data['discountType'] = discountType;
    data['productId'] = productId;
    data['merchantId'] = merchantId;
    data['productType'] = 1;
    data['quantity'] = getQuantity;
    data['productPrice'] = getSellingPrice;
    data['sellingPrice'] = getSellingPrice;

    return data;
  }

  // format cho thông tin sp quà tặng
  Map<String, dynamic> toJsonGiftCheckCoupon() {
    return {
      "id": productId,
      "productId": productId,
      "accessoryGroupId": accessoryGroupId,
      "code": code,
      "repurchasePrice": repurchasePrice,
      "parentProductId": parentProductId,
      "productType": ProductType.gift.getValueType,
      "productName": productName,
      "barCode": barCode,
      "originalPrice": originalPrice,
      "sellingPrice": sellingPrice,
      "totalQuantityInStock": totalQuantityInStock,
      "totalQuantityInStore": totalQuantityInStore,
      "childs": [],
      "productCode": productCode,
      "isGiftTaken": true,
    };
  }

  // format cho thông tin sp bảo hành
  Map<String, dynamic> toJsonWarrantyCheckCoupon() {
    return {
      "id": productId,
      "warrantyPackageId": warrantyPackageId,
      "productId": productId,
      "repurchasePrice": repurchasePrice,
      "discountType": discountType,
      "discountValue": discountValue,
      "fromPrice": fromPrice,
      "toPrice": toPrice,
      "code": code,
      "productName": productName,
      "productCode": productCode,
      "originalPrice": originalPrice,
      "barCode": barCode,
      "productType": ProductType.warranty.getValueType,
      "parentProductId": parentProductId,
      "sellingPrice": sellingPrice,
      "totalQuantityInStock": totalQuantityInStock,
      "totalQuantityInStore": totalQuantityInStore,
      "childs": [],
      "isGiftTaken": true,
      "quantity": getQuantity,
      "attachs": [],
      "gifts": [],
    };
  }

  /// format cho thông tin sp bảo hành
  Map<String, dynamic> toJsonAttachCheckCoupon() {
    return {
      "id": productId,
      "promotionId": promotionId,
      "productId": productId,
      "discountType": discountType,
      "discountValue": discountValue,
      "repurchasePrice": repurchasePrice,
      "code": code,
      "barCode": barCode,
      "productType": ProductType.attach.getValueType,
      "productName": productName,
      "productCode": productCode,
      "parentProductId": parentProductId,
      "originalPrice": originalPrice,
      "sellingPrice": sellingPrice,
      "totalQuantityInStock": totalQuantityInStock,
      "totalQuantityInStore": totalQuantityInStore,
      "childs": [],
      "belongToWarrantyImei": belongToWarrantyImei,
      "isGiftTaken": true,
      "quantity": getQuantity,
    };
  }

  Map<String, dynamic> toJsonCreate(double totalDiscountPrice) {
    Map<String, dynamic> data = <String, dynamic>{};

    data['id'] = itemId; // update bill cần field này
    data['productId'] = productId.toString();
    data['productName'] = productName;
    data['productCode'] = productCode;
    data['productPrice'] = getSellingPrice;
    data['quantity'] = getQuantity;
    data['imeiCode'] = imei?.imeiNo;
    data['productType'] = ProductType.normal.getValueType;
    data['accessoryGroupId'] = accessoryGroupId;
    data['accessoryGroupCode'] = accessoryGroupCode;
    data['repurchasePrice'] = 0;
    // data['isGiftTaken'] = true; // check lại thông tin này
    data['note'] = note ?? '';
    data['gifts'] =
        getGifts.map((e) => e.formatChild(ProductType.gift)).toList();
    data['attachs'] =
        getAttaches.map((e) => e.formatChild(ProductType.attach)).toList();
    data['warranty'] =
        getWarranties.map((e) => e.formatChild(ProductType.warranty)).toList();
    data['discountAmount'] = checkIsComboProduct
        ? (calculatorProductDiscountAmount + totalDiscountPrice)
        : calculatorProductDiscountAmount;
    data['discountType'] = getDiscountType.value;
    data['issuedVat'] = false;
    data['merchantId'] = getMerchantId;
    data['vouchers'] = getVouchers.map((e) => e.toJson).toList();
    data['flexibleComboId'] = flexibleComboId;
    data['flexibleComboItemId'] = flexibleComboItemId;

    data['customerDiscountType'] = customerDiscountType.getValueNum;
    data['customerDiscountMaxAmount'] = customerDiscountForProduct?.maxValue;
    data['customerDiscountAmount'] = customerDiscountForProduct?.value;
    data['customerDiscountSellingPrice'] =
        customerDiscountForProduct?.sellingPrice;
    data['customerTypeId'] = customerDiscountForProduct?.id;
    data['externalImeiNo'] = externalImeiNo;
    data['selectImeiReason'] = selectImeiReason;

    return data;
  }

  /// format thông tin sản phẩm con
  /// Nếu sản phẩm có currentChild thì lấy currentChild,
  /// còn không sẽ check childs để lấy sản phẩm còn tồn.
  Map<String, dynamic> formatChild(ProductType productType) {
    ProductModel? childOfItem = productChild;

    return {
      'id': childOfItem?.id ?? id, // dùng cho update bill
      'productId': childOfItem?.id ?? productId ?? id,
      'productName': childOfItem?.productName ?? productName,
      'productCode': childOfItem?.productCode ?? productCode,
      'productPrice': childOfItem?.sellingPrice ?? sellingPrice,
      'quantity': childOfItem?.quantity ?? getQuantity,
      'discountAmount': childOfItem?.discountAmount ?? discountAmount ?? 0,
      'imeiCode': imei?.imeiNo,
      'imeiNo': imei?.imeiNo,
      'productType': productType.getValueType,
      'accessoryGroupId':
          childOfItem?.accessoryGroupId ?? accessoryGroupId ?? '',
      'accessoryGroupCode': childOfItem?.code ?? code ?? '',
      'repurchasePrice': repurchasePrice ?? 0, // Giá thu lại/gift
      'isGiftTaken': !(isRepurchasePrice ?? false),
      'discountType': childOfItem?.discountType ?? discountType,
      'discountProgramId': childOfItem?.discountProgramId ?? discountProgramId,
      'issuedVat': false,
      'merchantId': merchantId,
      'checked': true,
      'selectImeiReason': selectImeiReason,
      'externalImeiNo': attachedImei,
    };
  }

  /// lấy danh sách ids của toàn bộ sp từ cha tới con
  List<String> get getProductIds {
    List<String> data = [];
    data.add(productId!);

    data.addAll(getAttaches.map((e) => e.productId!).toList());
    data.addAll(getWarranties.map((e) => e.productId!).toList());

    return data;
  }

  /// cập nhật thông tin giảm giá theo DMEM
  updateCustomerDiscountForProduct(Map<String, ProductDiscountModel?> data) {
    customerDiscountForProduct = data[productId];
  }

  /// kiểm tra xem thông tin điền đã đầy đủ hay chưa
  /// voới sp imei cần có thông tin imei
  bool get checkEnoughInformation {
    if (productType == ProductType.imei) {
      return imei?.imeiNo.isNotNullOrEmpty ?? false;
    }
    return true;
  }

  /// chuyển thành ProductModel cho phiếu KPVD
  ProductModel get convertToModelKPVD {
    return ProductModel(
      id: productId,
      productName: productName,
      productCode: productCode,
      productType: productType,
      sellingPrice: sellingPrice,
    );
  }

  Map<String, dynamic> toJsonCreateWarranty() {
    Map<String, dynamic> data = <String, dynamic>{};

    data['productId'] = productId.toString(); // vd "50003032"
    data['quantity'] = getQuantity;
    data['imeiCode'] = imei?.imeiNo;
    data['warrantyReasonId'] = warrantyReasonId;
    data['warrantyReasonName'] = warrantyReasonName;
    data['isLostProduct'] = isLostProduct;
    data['externalImeiNo'] = externalImeiNo; // imei đính kèm phụ kiện
    data['billItemId'] = itemId; // vd "b2db0e83-74fa-46e3-9988-a8af8b3e570d"
    data['newProductId'] =
        replacedWarrantyProduct.value?.productId.toString(); // vd "50003032"
    data['newImeiCode'] = replacedWarrantyProduct.value?.imei?.imeiNo;
    data['selectImeiReason'] = selectImeiReason;

    return data;
  }
}
