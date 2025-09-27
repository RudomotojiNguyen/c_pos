part of '../product_table.dart';

extension ProductsTableExtension on List<ProductTable> {
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
        /// tính luôn số lượng, quà tặng, bán kèm
        double totalAmountOfRow = element.calculatorTotalSellingPrice;

        totalAmountOfRow += element.getAttaches.fold(
            0,
            (previousAttach, attach) =>
                previousAttach + attach.calculatorTotalSellingPrice);

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
    List<Map<String, dynamic>> data = [];
    List<Map<String, dynamic>> dataCombo = [];

    for (var product in this) {
      if (product.productChildCombo != null &&
          product.productChildCombo!.isNotEmpty) {
        dataCombo.addAll(product.toJsonComboCreate());
      } else {
        data.add(product.toJsonCreate());
      }
    }

    return [...data, ...dataCombo];
  }

  double get getFinalPrice =>
      totalPriceNoneDiscount - totalDiscountPriceOfBillItem;

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

        return flag;
      },
    );
  }
}
