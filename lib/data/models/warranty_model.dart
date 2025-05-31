import 'package:c_pos/common/constants/app_constants.dart';
import 'package:c_pos/common/extensions/extension.dart';
import 'package:intl/intl.dart';

class WarrantyModel {
  int? id;
  int? storeId;
  String? storeName;
  String? warrantyNote;
  String? status;
  int? billNumber;
  String? billItemId;
  String? createdAt;
  String? updatedAt;
  String? productId;
  String? imeiNo;
  String? productName;
  String? productCode;
  String? barCode;
  int? customerId;
  String? customerName;
  String? customerMobile;

  WarrantyModel(
      {this.id,
      this.storeId,
      this.storeName,
      this.warrantyNote,
      this.status,
      this.billNumber,
      this.billItemId,
      this.createdAt,
      this.updatedAt,
      this.productId,
      this.imeiNo,
      this.productName,
      this.productCode,
      this.barCode,
      this.customerId,
      this.customerName,
      this.customerMobile});

  WarrantyModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    storeId = json['storeId'];
    storeName = json['storeName'];
    warrantyNote = json['warrantyNote'];
    status = json['status'];
    billNumber = json['billNumber'];
    billItemId = json['billItemId'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    productId = json['productId'];
    imeiNo = json['imeiNo'];
    productName = json['productName'];
    productCode = json['productCode'];
    barCode = json['barCode'];
    customerId = json['customerId'];
    customerName = json['customerName'];
    customerMobile = json['customerMobile'];
  }

  String get getBillNumber => id?.toString() ?? '';

  String get getCustomerName => customerName ?? '';

  String get getCustomerPhone => customerMobile ?? '';

  String get getStatus => status ?? '';

  String get getStoreName => storeName ?? '';

  String get getProductName => productName ?? '';

  String get getProductImei => imeiNo ?? '';

  String get getWarrantyNote => warrantyNote ?? '';

  String get getProductImage => AppConstants.defaultImage;

  String get getCreateDate {
    if (createdAt?.isNullOrEmpty ?? true) return '';

    // Chuỗi thời gian gốc
    String originalDateTime = createdAt!;

    // Định dạng chuỗi thời gian gốc
    DateFormat originalFormat = DateFormat('dd-MM-yyyy HH:mm');
    // Định dạng chuỗi thời gian mới
    DateFormat desiredFormat = DateFormat('dd/MM/yyyy');

    // Chuyển đổi chuỗi thời gian gốc thành đối tượng DateTime
    DateTime dateTime = originalFormat.parse(originalDateTime);

    // Chuyển đổi đối tượng DateTime thành chuỗi thời gian mới
    String formattedDateTime = desiredFormat.format(dateTime);

    return formattedDateTime; // Output: 01:12, 20/05/2024
  }
}
