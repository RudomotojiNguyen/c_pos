part of '../customer_table.dart';

extension CustomerTableExtension on CustomerTable {
  String? get getCustomerFullName => fullName;

  String? get getCustomerPhoneNumber => phoneNo;

  String get getFullName => fullName ?? '';

  String get getCustomerPhone => phoneNo ?? '';

  bool get isNullCustomer =>
      getCustomerFullName.isNullOrEmpty || getCustomerPhone.isNullOrEmpty;

  bool get isDefaultAccount => false;

  int get getMaxPoint => point ?? 0;

  CustomerModel get convertToModel => CustomerModel(
        id: customerId,
        fullName: fullName,
        lastName: lastName,
        appellation: appellation.getValue,
        phoneNo: phoneNo,
        gender: appellation.getValue,
        email: email,
        dateOfBirth: dateOfBirth,
        city: city,
        district: district,
        ward: ward,
        address: address,
        // type: type,
        point: point,
        identifyNo: indentifyNo,
      );

  void clearCustomerData() {
    customerId = null;
    fullName = null;
    lastName = null;
    appellation = XGenderType.none;
    email = null;
    dateOfBirth = null;
    city = null;
    district = null;
    ward = null;
    address = null;
    point = null;
    indentifyNo = null;
  }

  void copyWith(CustomerModel data) {
    /// nếu cập nhật vào khách hàng khác thì lấy khách đó
    /// ngược lại thì cập nhật các trường
    if (data.id != customerId) {
      customerId = data.id;
      fullName = data.fullName;
      lastName = data.lastName;
      appellation = data.getGender;
      phoneNo = data.phoneNo;
      email = data.email;
      dateOfBirth = data.dateOfBirth;
      city = data.city;
      district = data.district;
      ward = data.ward;
      address = data.address;
      point = data.point;
      indentifyNo = data.identifyNo;
    } else {
      customerId = data.id ?? customerId;
      fullName = data.fullName ?? fullName;
      lastName = data.lastName ?? lastName;
      appellation = data.getGender;
      phoneNo = data.phoneNo ?? phoneNo;
      email = data.email ?? email;
      dateOfBirth = data.dateOfBirth ?? dateOfBirth;
      city = data.city ?? city;
      district = data.district ?? district;
      ward = data.ward ?? ward;
      address = data.address ?? address;
      point = data.point ?? point;
      indentifyNo = data.identifyNo ?? indentifyNo;
    }
  }
}
