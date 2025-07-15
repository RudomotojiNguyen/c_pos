import 'package:c_pos/common/constants/app_constants.dart';
import 'package:c_pos/common/extensions/extension.dart';

import '../../common/enum/enum.dart';
import '../../presentation/utils/utils.dart';
import '../datasources/local_db/local_db.dart';
import 'product_imei_model.dart';

class OrderItemModel {
  String? id;
  List<OrderItemModel>? gifts;
  List<OrderItemModel>? attaches;
  List<OrderItemModel>? warranty;
  String? imeiNo;
  String? productName;
  double? originalPrice;
  double? sellingPrice;
  String? barCode;
  int? orderItemType;
  late ProductType productType;
  String? image;
  int? isGiftTaken;
  double? productPrice;
  int? orderId;
  String? productId;
  int? quantity;
  double? totalAmount;
  double? discountAmount;
  String? createdAt;
  int? promotionId;
  int? discountType;
  String? accessoryGroupId;
  String? accessoryGroupCode;
  double? repurchasePrice;
  String? note;
  String? belongOrderDetailId;
  int? merchantId;
  int? totalQuantityInStore;
  String? productCode;
  int? companyId;
  bool? belongToWarrantyImei;
  int? discountProgramId;

  OrderItemModel({
    this.id,
    this.gifts,
    this.attaches,
    this.warranty,
    this.imeiNo,
    this.productName,
    this.originalPrice,
    this.sellingPrice,
    this.barCode,
    this.orderItemType,
    required this.productType,
    this.image,
    this.isGiftTaken,
    this.productPrice,
    this.orderId,
    this.productId,
    this.quantity,
    this.totalAmount,
    this.discountAmount,
    this.createdAt,
    this.promotionId,
    this.discountType,
    this.accessoryGroupId,
    this.accessoryGroupCode,
    this.repurchasePrice,
    this.note,
    this.belongOrderDetailId,
    this.merchantId,
    this.totalQuantityInStore,
    this.productCode,
    this.companyId,
    this.belongToWarrantyImei,
  });

  OrderItemModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    if (json['gifts'] != null) {
      gifts = <OrderItemModel>[];
      json['gifts'].forEach((v) {
        gifts!.add(OrderItemModel.fromJson(v));
      });
    }
    if (json['attachs'] != null) {
      attaches = <OrderItemModel>[];
      json['attachs'].forEach((v) {
        attaches!.add(OrderItemModel.fromJson(v));
      });
    }
    if (json['warranty'] != null) {
      warranty = <OrderItemModel>[];
      json['warranty'].forEach((v) {
        warranty!.add(OrderItemModel.fromJson(v));
      });
    }
    imeiNo = json['imeiNo'] ?? json['imeiCode'];
    productName = json['productName'];
    originalPrice = Utils.toDouble(json['originalPrice']);
    sellingPrice = Utils.toDouble(json['sellingPrice']);
    barCode = json['barCode'];
    orderItemType = json['orderItemType'];
    productType = (json['productType'] as int? ?? -1).toProductType;
    image = json['image'];
    isGiftTaken = json['isGiftTaken'];
    productPrice = Utils.toDouble(json['productPrice']);
    orderId = json['orderId'];
    productId = json['productId'];
    quantity = json['quantity'];
    totalAmount = Utils.toDouble(json['totalAmount']);
    discountAmount = Utils.toDouble(json['discountAmount']);
    createdAt = json['createdAt'];
    promotionId = json['promotionId'];
    discountType = json['discountType'];
    accessoryGroupId = json['accessoryGroupId'];
    accessoryGroupCode = json['accessoryGroupCode'];
    repurchasePrice = Utils.toDouble(json['repurchasePrice']);
    note = json['note'];
    belongOrderDetailId = json['belongOrderDetailId'];
    merchantId = json['merchantId'];
    totalQuantityInStore = json['totalQuantityInStore'];
    productCode = json['productCode'];
    companyId = json['companyId'];
    belongToWarrantyImei = json['belongToWarrantyImei'];
    discountProgramId = json['discountProgramId'];
  }

  String get getImage => AppConstants.defaultImage;

  String get getName => productName ?? '';

  String get getImeiNo => imeiNo ?? '';

  double get getSellingPrice => sellingPrice ?? 0;

  double get getDiscountPrice => discountAmount ?? 0;

  int get getQuantity => quantity ?? 0;

  // todo: check với nhiều loại sản phẩn, voucher, chiết khấu tay,...
  ProductTable get convertToProductTable => ProductTable()
    ..itemId = id
    ..quantity = quantity
    ..productName = productName
    ..imei = ProductImeiModel(imeiNo: imeiNo)
    ..productCode = productCode
    ..barCode = barCode
    ..originalPrice = originalPrice
    ..sellingPrice = sellingPrice
    ..createdAt = createdAt
    ..companyId = companyId
    ..note = note
    ..merchantId = merchantId
    ..belongToWarrantyImei = belongToWarrantyImei
    ..discountProgramId = discountProgramId
    ..discountType = discountType
    ..discountAmount = discountAmount
    ..productType = productType
    ..productId = productId
    ..repurchasePrice = repurchasePrice;
}
