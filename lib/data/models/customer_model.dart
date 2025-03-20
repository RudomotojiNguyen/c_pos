import 'package:c_pos/common/constants/app_constants.dart';
import 'package:c_pos/common/extensions/extension.dart';

import '../../common/enum/enum.dart';
import '../datasources/local_db/local_db.dart';

class CustomerModel {
  int? id;
  String? fullName;
  String? lastName;
  int? appellation;
  String? phoneNo;
  int? gender;
  String? email;
  String? dateOfBirth;
  int? city;
  int? district;
  int? ward;
  String? address;
  int? type;
  int? inChargeEmployeeId;
  String? note;
  int? totalBoughtAmount;
  int? totalBoughtNo;
  int? createdFrom;
  String? lastedBoughtAt;
  String? identifyCardFrontUrl;
  String? identifyCardBackUrl;
  String? identifyNo;
  int? point;

  CustomerModel({
    this.id,
    this.fullName,
    this.lastName,
    this.appellation,
    this.phoneNo,
    this.gender,
    this.email,
    this.dateOfBirth,
    this.city,
    this.district,
    this.ward,
    this.address,
    this.type,
    this.inChargeEmployeeId,
    this.note,
    this.totalBoughtAmount,
    this.totalBoughtNo,
    this.createdFrom,
    this.lastedBoughtAt,
    this.identifyCardFrontUrl,
    this.identifyCardBackUrl,
    this.identifyNo,
    this.point,
  });

  CustomerModel.fromJson(Map<String, dynamic> json) {
    id = json['customerId'] ?? json['id'];
    fullName = json['fullName'];
    lastName = json['lastName'];
    appellation = json['appellation'];
    phoneNo = json['phoneNumber'] ?? json['phoneNo'];
    gender = json['gender'];
    email = json['email'];
    dateOfBirth = json['dateOfBirth'];
    city = json['city'];
    district = json['district'];
    ward = json['ward'];
    address = json['address'];
    type = json['type'];
    inChargeEmployeeId = json['inChargeEmployeeId'];
    note = json['note'];
    totalBoughtAmount = json['totalBuyedAmount'];
    totalBoughtNo = json['totalBuyedNo'];
    createdFrom = json['createdFrom'];
    lastedBoughtAt = json['lastedBuyedAt'];
    identifyCardFrontUrl = json['indentifyCardFrontUrl'];
    identifyCardBackUrl = json['indentifyCardBackUrl'];
    identifyNo = json['indentifyNo'];
    point = json['point'];
  }

  copyWith({
    int? id,
    String? fullName,
    String? lastName,
    XGenderType? appellation,
    String? phoneNo,
    XGenderType? gender,
    String? email,
    String? dateOfBirth,
    int? city,
    int? district,
    int? ward,
    String? address,
    int? type,
    int? inChargeEmployeeId,
    String? note,
    int? totalBoughtAmount,
    int? totalBoughtNo,
    int? createdFrom,
    String? lastedBoughtAt,
    String? identifyCardFrontUrl,
    String? identifyCardBackUrl,
    String? identifyNo,
    int? point,
  }) {
    this.id = id ?? this.id;
    this.fullName = fullName ?? this.fullName;
    this.lastName = lastName ?? this.lastName;
    this.appellation = appellation?.getValue ?? this.appellation;
    this.phoneNo = phoneNo ?? this.phoneNo;
    this.gender = gender?.getValue ?? this.gender;
    this.email = email ?? this.email;
    this.dateOfBirth = dateOfBirth ?? this.dateOfBirth;
    this.city = city ?? this.city;
    this.district = district ?? this.district;
    this.ward = ward ?? this.ward;
    this.address = address ?? this.address;
    this.type = type ?? this.type;
    this.inChargeEmployeeId = inChargeEmployeeId ?? this.inChargeEmployeeId;
    this.note = note ?? this.note;
    this.totalBoughtAmount = totalBoughtAmount ?? this.totalBoughtAmount;
    this.totalBoughtNo = totalBoughtNo ?? this.totalBoughtNo;
    this.createdFrom = createdFrom ?? this.createdFrom;
    this.lastedBoughtAt = lastedBoughtAt ?? this.lastedBoughtAt;
    this.identifyCardFrontUrl =
        identifyCardFrontUrl ?? this.identifyCardFrontUrl;
    this.identifyCardBackUrl = identifyCardBackUrl ?? this.identifyCardBackUrl;
    this.identifyNo = identifyNo ?? this.identifyNo;
    this.point = point ?? this.point;
  }

  String get getFullName => fullName ?? AppConstants.defaultNullValue;

  String get getCustomerPhone => phoneNo ?? AppConstants.defaultNullValue;

  bool get isObjectNull => fullName.isNullOrEmpty;

  XGenderType get getGender {
    if (appellation == XGenderType.male.getValue ||
        gender == XGenderType.male.getValue) return XGenderType.male;
    if (appellation == XGenderType.female.getValue ||
        gender == XGenderType.female.getValue) return XGenderType.female;
    return XGenderType.none;
  }

  CustomerTable get convertToTable => CustomerTable()
    ..customerId = id
    ..fullName = fullName
    ..lastName = lastName
    ..appellation = getGender
    ..phoneNo = phoneNo
    ..dateOfBirth = dateOfBirth
    ..city = city
    ..district = district
    ..ward = ward
    ..address = address
    ..point = point;

  DateTime? get getCustomerBirthDay =>
      dateOfBirth.isNullOrEmpty ? null : DateTime.parse(dateOfBirth!);

  bool get isDefaultAccount => id == -1;
}
