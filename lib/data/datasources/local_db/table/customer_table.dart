import 'package:c_pos/common/constants/app_constants.dart';
import 'package:c_pos/common/extensions/extension.dart';
import 'package:isar/isar.dart';

import '../../../../common/enum/enum.dart';
import '../../../models/customer_model.dart';
import '../../../models/otp_customer_point_model.dart';

part 'extensions/customer_table_extension.dart';

part 'customer_table.g.dart';

@Collection()
class CustomerTable {
  Id id = Isar.autoIncrement;

  int? customerId;
  String? fullName;
  String? lastName;
  String? phoneNo;
  String? email;
  String? dateOfBirth;
  int? city;
  int? district;
  int? ward;
  String? address;

  @Enumerated(EnumType.ordinal)
  XCustomerType type = XCustomerType.none;

  int? point;
  String? indentifyNo;

  @Enumerated(EnumType.ordinal)
  XGenderType gender = XGenderType.none;

  @Enumerated(EnumType.ordinal)
  XGenderType appellation = XGenderType.none;

  /// dùng khi khách hàng muốn trừ điểm
  String? discountByPointStr;

  @ignore
  OtpCustomerPointModel? get discountByPoint => discountByPointStr != null
      ? OtpCustomerPointModel().toModel(discountByPointStr!)
      : null;

  set discountByPoint(OtpCustomerPointModel? value) {
    discountByPointStr = value?.toString();
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
      gender = data.getGender;
      email = data.email;
      dateOfBirth = data.dateOfBirth;
      city = data.city;
      district = data.district;
      ward = data.ward;
      address = data.address;
      type = data.type ?? XCustomerType.none;
      point = data.point;
      indentifyNo = data.identifyNo;
      discountByPoint = null;
    } else {
      customerId = data.id ?? customerId;
      fullName = data.fullName ?? fullName;
      lastName = data.lastName ?? lastName;
      appellation = data.getGender;
      phoneNo = data.phoneNo ?? phoneNo;
      gender = data.getGender;
      email = data.email ?? email;
      dateOfBirth = data.dateOfBirth ?? dateOfBirth;
      city = data.city ?? city;
      district = data.district ?? district;
      ward = data.ward ?? ward;
      address = data.address ?? address;
      type = data.type ?? type;
      point = data.point ?? point;
      indentifyNo = data.identifyNo ?? indentifyNo;
    }
  }

  void clearCustomerData() {
    customerId = null;
    fullName = null;
    lastName = null;
    appellation = XGenderType.none;
    gender = XGenderType.none;
    email = null;
    dateOfBirth = null;
    city = null;
    district = null;
    ward = null;
    address = null;
    type = XCustomerType.none;
    point = null;
    indentifyNo = null;
    discountByPointStr = null;
  }

  @ignore
  CustomerModel get convertToModel => CustomerModel(
        id: customerId,
        fullName: fullName,
        lastName: lastName,
        appellation: appellation.getValue,
        phoneNo: phoneNo,
        gender: gender,
        email: email,
        dateOfBirth: dateOfBirth,
        city: city,
        district: district,
        ward: ward,
        address: address,
        type: type,
        point: point,
        identifyNo: indentifyNo,
      );
}
