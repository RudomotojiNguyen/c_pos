part of '../product_table.dart';

extension ProductsTableExtension on List<ProductTable> {
  /// đếm sản phẩm sản phẩm combo
  int get getProductOfComboQuantity =>
      where((billItem) => billItem.isComboProduct == true).length;

  /// tính số lần xuất hiện
  double get getComboQuantity {
    Map<String, ProductTable?> comboProducts = <String, ProductTable?>{};
    for (var billItem in this) {
      if (billItem.isComboProduct == true) {
        ProductTable? item =
            comboProducts[billItem.flexibleComboId?.toString()];

        if (item != null) {
          item.appearTimes = item.getAppearTimes + 1;
        } else {
          item = ProductTable(
            comboId: billItem.flexibleComboId,
            productInComboQuantity: billItem.productInComboQuantity,
            appearTimes: 1,
          );
        }
        comboProducts.putIfAbsent(item.comboId!, () => item);
      }
    }

    return comboProducts.values.fold<double>(0, (accumulator, currentValue) {
      return (accumulator) +
          ((currentValue?.appearTimes ?? 1) /
              (currentValue?.productInComboQuantity ?? 1));
    });
  }

  /// đếm số lượng imei
  int get getImeiProductQuantity {
    return where(
      (billItem) => billItem.productType == ProductType.imei,
    ).length;
  }

  /// tính số tiền được giảm khi mua sản phẩm imei và sản phẩm combo
  double get totalDiscountPriceWhenBuyingImeiAndComboProduct {
    /// số lượng sản phẩm combo
    int quantityProductCombo = getProductOfComboQuantity;
    quantityProductCombo = quantityProductCombo > 0 ? quantityProductCombo : 1;

    /// Số lượng combo trong bill: mục đích để tính giảm thêm 50k khi mua máy kèm combo
    double comboQuantity = getComboQuantity;

    /// số lượng sản phẩm IMEI
    int totalNumberProductIMEI = getImeiProductQuantity;

    if (totalNumberProductIMEI <= comboQuantity) {
      return (totalNumberProductIMEI * AppConstants.comboExtraDiscountAmount) /
          quantityProductCombo;
    } else {
      return (comboQuantity * AppConstants.comboExtraDiscountAmount) /
          quantityProductCombo;
    }
  }

  ///
  /// tổng tiền được giảm trên bill
  /// số tiền này được tin thêm gồm
  ///   voucher
  ///   giảm tổng bill
  ///   có tính thêm giảm cho sản phẩm combo
  ///   không tính thêm dùng điểm tại đây
  ///
  double get totalPriceNoneDiscount {
    return fold(
      0,
      (previousValue, element) {
        /// số tiền trên 1 row sản phẩm
        /// tính luôn số lượng, quà tặng, bán kèm, gói bảo hành
        double totalAmountOfRow = element.calculatorTotalSellingPrice;

        totalAmountOfRow += element.getAttaches.fold(
            0,
            (previousAttach, attach) =>
                previousAttach + attach.calculatorTotalSellingPrice);

        totalAmountOfRow += element.getWarranties.fold(
            0,
            (previousWarranty, warranty) =>
                previousWarranty + warranty.calculatorTotalSellingPrice);

        // sản phẩm quà tặng cần kiểm tra nếu là thu lại thì phải trừ thêm tiền thu lại
        totalAmountOfRow -= element.getGifts.fold(
            0,
            (previousGift, gift) => gift.isCheckRepurchasePrice
                ? previousGift + gift.calculatorTotalSellingPrice
                : previousGift);

        return previousValue + totalAmountOfRow;
      },
    );
  }

  ///
  /// tổng số tiền được giảm của các sản phẩm
  /// tính thêm phầm mua sản phẩm combo
  ///
  double get totalDiscountPriceOfBillItem {
    return fold(
      0,
      (previousValue, element) {
        return previousValue + element.getTotalDiscountPriceOfProduct;
      },
    );
  }

  /// định dạng lại danh sách bill item
  List<Map<String, dynamic>> get formatBodyData {
    double totalDiscountProductImeiAndCombo =
        totalDiscountPriceWhenBuyingImeiAndComboProduct;

    List<Map<String, dynamic>> data = [];

    for (var product in this) {
      data.add(product.toJsonCreate(totalDiscountProductImeiAndCombo));
    }

    return data;
  }

  /// tạo bảo hành: định dạng lại danh sách bill item
  List<Map<String, dynamic>> get formatBodyDataToWarranty {
    List<Map<String, dynamic>> data = [];

    for (var product in this) {
      data.add(product.toJsonCreateWarranty());
    }

    return data;
  }

  /// lấy danh sách ids của toàn bộ sp từ cha tới con
  List<String> get getProductIds {
    List<String> data = [];

    for (var product in this) {
      data.addAll(product.getProductIds);
    }

    return data;
  }

  double get getFinalPrice =>
      totalPriceNoneDiscount - totalDiscountPriceOfBillItem;

  ///
  List<String> get getUnitProductIds => getProductIds.toSet().toList();

  /// kiểm tra xem thông tin sản phẩm chưa điển đủ hay chưa
  bool get checkProductNotEnoughInformation {
    return any(
      (element) {
        bool flag = false;

        if (element.productType == ProductType.imei && element.imei == null) {
          // nếu là sp imei thì phải có thông tin imei
          return true;
        }

        if (element.getGifts.isNotEmpty &&
            element.getGifts.checkProductNotEnoughInformation) {
          return true;
        }
        if (element.getAttaches.isNotEmpty &&
            element.getAttaches.checkProductNotEnoughInformation) {
          return true;
        }
        if (element.getWarranties.isNotEmpty &&
            element.getWarranties.checkProductNotEnoughInformation) {
          return true;
        }

        return flag;
      },
    );
  }
}
