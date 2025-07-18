part of '../product_table.dart';

extension ProductTableExtension on ProductTable {
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
    switch (itemType) {
      case XItemType.gift:
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
      (getSellingPrice * getQuantity) - (calculatorProductDiscountAmount);

  /// tính tiền sản phẩm theo số lượng
  double get calculatorTotalSellingPrice => getSellingPrice * getQuantity;

  /// chiết khấu tự động
  double get getDiscountAmount => discountAmount ?? 0;

  /// số lần xuất hiện
  int get getAppearTimes => appearTimes ?? 0;

  /// số lượng sản phẩm
  int get getQuantity => quantity ?? 1;

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

  /// tính tổng tiền giảm giá của 1 SP = Ctr CK tự động + CK tay
  double get calculatorProductDiscountAmount {
    final finalProductDiscountAmount =
        getDiscountAmount + getDiscountAmountByHand;
    return finalProductDiscountAmount > calculatorTotalSellingPrice
        ? calculatorTotalSellingPrice
        : finalProductDiscountAmount;
  }

  List<ProductTable> get products {
    if (getIt.isRegistered<DraftingInvoiceBloc>()) {
      return getIt.get<DraftingInvoiceBloc>().state.products ?? [];
    }
    return [];
  }

  /// tổng chiết khấu của sản phẩm, sản phẩm bán kèm
  double get getTotalDiscountPriceOfProduct {
    double productAttachDiscountAmount = getAttaches.fold(
        0,
        (previousValue, attach) =>
            previousValue + attach.calculatorProductDiscountAmount);

    return calculatorProductDiscountAmount + productAttachDiscountAmount;
  }

  /// tính tiền sản phẩm chưa giảm giá gồm
  /// giá bán của sản phẩm + tổng tiền sản phẩm mua kèm
  double get totalPriceNoneDiscount =>
      calculatorTotalSellingPrice + totalPriceOfAttaches;

  ///
  ///
  ///

  Map<String, dynamic> toJsonCheckCoupon() {
    Map<String, dynamic> data = <String, dynamic>{};
    data['attachs'] =
        getAttaches.map((e) => e.toJsonAttachCheckCoupon()).toList();
    data['gifts'] = getGifts.map((e) => e.toJsonGiftCheckCoupon()).toList();

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
      "productType": XItemType.gift.getValueType,
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
      "productType": XItemType.attach.getValueType,
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

  Map<String, dynamic> toJsonCreate() {
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
    data['gifts'] = getGifts.map((e) => e.formatChild(XItemType.gift)).toList();
    data['attachs'] =
        getAttaches.map((e) => e.formatChild(XItemType.attach)).toList();
    data['discountAmount'] = calculatorProductDiscountAmount;
    data['discountType'] = getDiscountType.value;
    data['issuedVat'] = false;
    data['merchantId'] = getMerchantId;
    data['flexibleComboId'] = flexibleComboId;
    data['flexibleComboItemId'] = flexibleComboItemId;

    data['externalImeiNo'] = externalImeiNo;
    data['selectImeiReason'] = selectImeiReason;

    return data;
  }

  /// format thông tin sản phẩm con
  /// Nếu sản phẩm có currentChild thì lấy currentChild,
  /// còn không sẽ check childs để lấy sản phẩm còn tồn.
  Map<String, dynamic> formatChild(XItemType productType) {
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

  /// kiểm tra xem thông tin điền đã đầy đủ hay chưa
  /// voới sp imei cần có thông tin imei
  bool get checkEnoughInformation {
    if (productType == ProductType.imei) {
      return imei?.imeiNo.isNotNullOrEmpty ?? false;
    }
    return true;
  }
}
