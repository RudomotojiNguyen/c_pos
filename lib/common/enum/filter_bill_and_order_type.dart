enum FilterBillAndOrderType {
  //bill
  retail,
  wholesaleInvoice,
  refundInvoice,
  guarantee,
  all,
  //order
  preOrder,
  api,
  store,
  delivery,
  deliveryByThirdParty,
  website,
  //
  unSelect,
}

extension FilterBillAndOrderTypeExtension on FilterBillAndOrderType {
  String get getTitle {
    switch (this) {
      case FilterBillAndOrderType.retail:
        return 'Bán lẻ';
      case FilterBillAndOrderType.wholesaleInvoice:
        return 'Bán buôn';
      case FilterBillAndOrderType.refundInvoice:
        return 'Trả hàng';
      case FilterBillAndOrderType.guarantee:
        return 'Bảo hành';
      case FilterBillAndOrderType.all:
        return 'Tất cả';
      case FilterBillAndOrderType.preOrder:
        return 'Đặt trước';
      case FilterBillAndOrderType.api:
        return 'Đơn đặt qua API';
      case FilterBillAndOrderType.store:
        return 'Mua tại quầy';
      case FilterBillAndOrderType.delivery:
        return 'Tự vận chuyển';
      case FilterBillAndOrderType.deliveryByThirdParty:
        return 'Hãng vận chuyển (Ahamove, Nhất tín ...)';
      case FilterBillAndOrderType.website:
        return 'Website';
      case FilterBillAndOrderType.unSelect:
        return 'Chọn loại';
    }
  }

  int? get getValue {
    switch (this) {
      case FilterBillAndOrderType.retail:
        return 1;
      case FilterBillAndOrderType.wholesaleInvoice:
        return 2;
      case FilterBillAndOrderType.refundInvoice:
        return 3;
      case FilterBillAndOrderType.guarantee:
        return 6;
      case FilterBillAndOrderType.preOrder:
        return 2;
      case FilterBillAndOrderType.api:
        return 4;
      case FilterBillAndOrderType.store:
        return 1;
      case FilterBillAndOrderType.delivery:
        return 3;
      case FilterBillAndOrderType.all:
        return null;
      case FilterBillAndOrderType.deliveryByThirdParty:
        return 4;
      case FilterBillAndOrderType.website:
        return 5;
      case FilterBillAndOrderType.unSelect:
        return null;
    }
  }
}
