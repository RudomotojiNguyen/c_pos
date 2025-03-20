import 'package:c_pos/common/extensions/extension.dart';
import 'package:isar/isar.dart';

import '../../../../common/enum/enum.dart';
import '../../../models/customer_model.dart';
import '../../../models/otp_customer_point_model.dart';

part 'customer_table.g.dart';

part 'extensions/customer_table_extension.dart';

@Collection()
class CustomerTable {
  Id id = Isar.autoIncrement;

  int? customerId; // id khách hàng
  String? fullName; // tên khách hàng
  String? lastName; // họ khách hàng
  String? phoneNo; // số điện thoại khách hàng
  String? dateOfBirth; // ngày sinh khách hàng
  int? city; // thành phố khách hàng
  int? district; // quận khách hàng
  int? ward; // phường khách hàng
  String? address; // địa chỉ khách hàng
  int? point; // điểm khách hàng
  String? email; // email khách hàng
  String? indentifyNo; // số CMND khách hàng

  // notes: gender và appellation là 2 trường lưu trùng
  @Enumerated(EnumType.ordinal)
  XGenderType appellation = XGenderType.none;

  // thời gian tạo khách hàng
  DateTime createdAt = DateTime.now();

  /// dùng khi khách hàng muốn trừ điểm
  String? discountByPointStr;

  @ignore
  OtpCustomerPointModel? get discountByPoint => discountByPointStr != null
      ? OtpCustomerPointModel().toModel(discountByPointStr!)
      : null;

  set discountByPoint(OtpCustomerPointModel? value) {
    discountByPointStr = value?.toString();
  }
}
