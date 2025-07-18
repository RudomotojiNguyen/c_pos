part of '../customer_table.dart';

extension CustomerTableExtension on CustomerTable {
  String? get getCustomerFullName => fullName;

  String? get getCustomerPhoneNumber => phoneNo;

  String get getFullName => fullName ?? '';

  String get getCustomerPhone => phoneNo ?? '';

  int get getMaxPoint => point ?? 0;

  bool get isNullCustomer =>
      getCustomerFullName.isNullOrEmpty || getCustomerPhone.isNullOrEmpty;

  bool get isDefaultAccount => customerId == -1;

  Map<String, dynamic> formatTradeInBodyData() {
    Map<String, dynamic> data = {};

    data['id'] = id;
    data['fullName'] = fullName;
    data['appellation'] = appellation;
    data['phoneNo'] = phoneNo;
    data['gender'] = gender.getValue;
    data['appellation'] = gender.getValue;
    data['indentifyNo'] = indentifyNo;
    data['email'] = email;
    data['dateOfBirth'] =
        dateOfBirth?.formatDate(format: XDateTimeEnum.secondDayMonthYear);
    data['city'] = city;
    data['district'] = district;
    data['ward'] = ward;
    data['address'] = address;
    data['type'] = type.getValueType;

    return data;
  }
}
