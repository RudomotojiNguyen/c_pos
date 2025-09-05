part of '../customer_table.dart';

extension CustomerTableExtension on CustomerTable {
  String? get getCustomerFullName => fullName;

  String? get getCustomerPhoneNumber => phoneNo;

  String get getFullName => fullName ?? '';

  String get getCustomerPhone => phoneNo ?? '';

  int get getMaxPoint => point ?? 0;

  bool get isNullCustomer =>
      getCustomerFullName.isNullOrEmpty || getCustomerPhone.isNullOrEmpty;

  bool get isDefaultAccount => customerId == AppConstants.defaultCustomer.id;

  Map<String, dynamic> formatTradeInBodyData() {
    return {
      "fullName": fullName,
      "identifyNo": indentifyNo,
      "phoneNo": phoneNo,
      "gender": gender.getValue,
      "email": email,
      "dateOfBirth":
          dateOfBirth?.formatDate(format: XDateTimeEnum.secondDayMonthYear),
      "address": address,
      "type": type == XCustomerType.none
          ? XCustomerType.retailCustomer.getValueType
          : type.getValueType,
    };
  }

  Map<String, dynamic> formatCustomerCreateBill() {
    Map<String, dynamic> data = {};

    if (!isDefaultAccount) {
      /// note: nếu là thông tin khách mặc định thì bỏ qua phần gửi id
      data['customerId'] = customerId;
    }

    data['customerMobile'] = phoneNo;
    data['customerName'] = fullName;
    data['customerAddress'] = address;
    data['customerCity'] = city;
    data['customerDistrict'] = district;
    data['customerWard'] = ward;
    data['customerLastName'] = lastName;
    data['customerAppellation'] = appellation.getValue;
    data['customerDOB'] = dateOfBirth?.formatDate();
    data['customerType'] = type.getValueType;
    data['totalPoint'] = point;

    return data;
  }
}
