import 'package:collection/collection.dart';

enum XCustomerType {
  none,
  retailCustomer, // khách lẻ
  wholesaleCustomer, // khách buôn
  agency, // đại lý
  vip, // vip
  kol, // kol
  segmentRfm, // tệp khách hàng được segment
}

extension XCustomerTypeExtension on XCustomerType {
  static const Map<int, XCustomerType> map = {
    1: XCustomerType.retailCustomer,
    2: XCustomerType.wholesaleCustomer,
    3: XCustomerType.agency,
    4: XCustomerType.vip,
    5: XCustomerType.kol,
    6: XCustomerType.segmentRfm,
  };

  int get getValueType =>
      map.entries.firstWhereOrNull((element) => element.value == this)?.key ??
      XCustomerType.retailCustomer.getValueType;
}
