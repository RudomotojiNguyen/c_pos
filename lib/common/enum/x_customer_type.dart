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
      map.entries.firstWhere((element) => element.value == this).key;

  String get getTypeName =>
      map.entries.firstWhere((element) => element.value == this).value.name;
}
