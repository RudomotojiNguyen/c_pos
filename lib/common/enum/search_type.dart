enum SearchType {
  product,
  phoneNumber,
  imei,
  all,
  billId,
  phoneProduct,
  accessoriesProduct,
  productCombo,
  orderId,
  orderPhoneNumber,
  billPhoneNumber,
  service,
}

extension SearchTypeExtension on SearchType {
  String get getTitle {
    switch (this) {
      case SearchType.product:
        return 'Sản phẩm';
      case SearchType.phoneNumber:
        return 'Số điện thoại';
      case SearchType.imei:
        return 'IMEI';
      case SearchType.all:
        return 'Tất cả';
      case SearchType.billId:
        return 'Mã hóa đơn';
      case SearchType.phoneProduct:
        return 'SP điện thoại';
      case SearchType.accessoriesProduct:
        return 'SP phụ kiện';
      case SearchType.productCombo:
        return 'SP combo';
      case SearchType.orderId:
        return 'Mã ĐH';
      case SearchType.orderPhoneNumber:
      case SearchType.billPhoneNumber:
        return 'Số điện thoại';
      case SearchType.service:
        return 'Dịch vụ';
    }
  }

  String get getShortTitle {
    switch (this) {
      case SearchType.product:
        return 'SP';
      case SearchType.phoneNumber:
        return 'SDT';
      case SearchType.imei:
        return 'IMEI';
      case SearchType.all:
        return 'Tất cả';
      case SearchType.billId:
        return 'MHĐ';
      case SearchType.phoneProduct:
        return 'SP ĐT';
      case SearchType.accessoriesProduct:
        return 'SP PK';
      case SearchType.productCombo:
        return 'SP CB';
      case SearchType.orderId:
        return 'MĐH';
      case SearchType.orderPhoneNumber:
      case SearchType.billPhoneNumber:
        return 'SDT';
      case SearchType.service:
        return 'DV';
    }
  }

  int? get getValue {
    switch (this) {
      case SearchType.orderId:
      case SearchType.billId:
        return 1;

      case SearchType.imei:
      case SearchType.orderPhoneNumber:
      case SearchType.billPhoneNumber:
        return 2;

      case SearchType.phoneProduct:
      case SearchType.phoneNumber:
      case SearchType.productCombo:
        return 3;

      case SearchType.accessoriesProduct:
      case SearchType.service:
        return 4;

      case SearchType.product:
        return 1;
      case SearchType.all:
        return null;
    }
  }

  int? get getValueFilterInventory {
    switch (this) {
      case SearchType.accessoriesProduct:
        return 1;
      case SearchType.imei:
        return 2;
      case SearchType.productCombo:
        return 3;
      case SearchType.orderId:
      case SearchType.orderPhoneNumber:
      case SearchType.phoneProduct:
      case SearchType.billId:
      case SearchType.phoneNumber:
      case SearchType.product:
      case SearchType.all:
      default:
        return null;
    }
  }

  String get getHintText {
    switch (this) {
      case SearchType.product:
        return 'Nhập tên, mã sản phẩm';
      case SearchType.imei:
        return 'Nhập mã imel';
      case SearchType.productCombo:
        return 'Nhập tên combo';
      default:
        return '';
    }
  }
}
