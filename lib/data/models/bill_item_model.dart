import 'package:c_pos/common/extensions/extension.dart';

import '../../common/constants/app_constants.dart';
import '../../common/enum/enum.dart';
import '../datasources/local_db/local_db.dart';
import 'discount_program_model.dart';
import 'product_imei_model.dart';
import 'product_model.dart';

class BillItemModel {
  String? id;
  String? productId;
  String? barCode;
  String? createdAt;
  int? discountProgramId;
  int? promotionId;
  String? productName;
  String? productCode;
  int? productCategory;
  int? productWebCategory;
  String? productNameVat;
  String? productNote;
  int? warrantyMonthNo;
  int? productVatAmount;
  String? productUnit;
  late ProductType productType;
  int? quantity;
  double? productPrice;
  String? imeiNo;
  double? totalPrice;
  double?
      discountAmount; // giá giản này là trên tổng sản phẩm nên không nên nhân số lượng để tính
  int? discountType;
  List<BillItemModel>? listProductInCombo;
  int? billItemType;
  bool? isGiftTaken;
  String? accessoryGroupId;
  String? accessoryGroupCode;
  double? repurchasePrice;
  String? belongBillDetailId;
  String? note;
  List<BillItemModel>? listAccessoryPromotion;
  List<BillItemModel>? listProductPromotion;
  bool? issuedVat;
  double? sellingPrice;
  double? listedPrice;
  int? merchantId;
  String? flexibleComboId;
  String? flexibleComboName;
  String? flexibleComboItemId;
  String? warrantyReasonName;
  String? newProductId;
  String? newProductName;
  String? newProductCode;
  int? newQuantity;
  double? newProductPrice;
  int? newProductType;
  double? newTotalPrice;
  String? newImeiCode;
  bool? isLostProduct;
  int? voucherId;
  int? voucherDetailId;
  String? voucherCode;
  String? warrantyAddress;
  String? warrantyPhone;
  String? warrantyDescription;
  int? customerTypeId;
  int? customerDiscountType;
  double? customerDiscountAmount;
  double? customerDiscountSellingPrice;
  double? customerDiscountMaxAmount;
  DiscountProgramModel? discountProgram;
  bool? statusVieon;
  int? quantityInStock;
  bool? allowViewFullExternalImeiNo;
  bool? isSoftwareProduct;
  bool? isVieonProduct;

  List<BillItemModel>? gifts;
  List<BillItemModel>? attaches;

  BillItemModel({
    this.id,
    this.productId,
    this.barCode,
    this.createdAt,
    this.discountProgramId,
    this.promotionId,
    this.productName,
    this.productCode,
    this.productCategory,
    this.productWebCategory,
    this.productNameVat,
    this.productNote,
    this.warrantyMonthNo,
    this.productVatAmount,
    this.productUnit,
    required this.productType,
    this.quantity,
    this.productPrice,
    this.imeiNo,
    this.totalPrice,
    this.discountAmount,
    this.discountType,
    this.listProductInCombo,
    this.billItemType,
    this.isGiftTaken,
    this.accessoryGroupId,
    this.accessoryGroupCode,
    this.repurchasePrice,
    this.belongBillDetailId,
    this.note,
    this.listAccessoryPromotion,
    this.listProductPromotion,
    this.issuedVat,
    this.sellingPrice,
    this.listedPrice,
    this.merchantId,
    this.flexibleComboId,
    this.flexibleComboName,
    this.flexibleComboItemId,
    this.warrantyReasonName,
    this.newProductId,
    this.newProductName,
    this.newProductCode,
    this.newQuantity,
    this.newProductPrice,
    this.newProductType,
    this.newTotalPrice,
    this.newImeiCode,
    this.isLostProduct,
    this.voucherId,
    this.voucherDetailId,
    this.voucherCode,
    this.warrantyAddress,
    this.warrantyPhone,
    this.warrantyDescription,
    this.customerTypeId,
    this.customerDiscountType,
    this.customerDiscountAmount,
    this.customerDiscountSellingPrice,
    this.customerDiscountMaxAmount,
    this.discountProgram,
    this.statusVieon,
    this.quantityInStock,
    this.allowViewFullExternalImeiNo,
    this.isSoftwareProduct,
    this.isVieonProduct,
    this.gifts,
    this.attaches,
  });

  BillItemModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productId = json['productId'];
    barCode = json['barCode'];
    createdAt = json['createdAt'];
    discountProgramId = json['discountProgramId'];
    promotionId = json['promotionId'];
    productName = json['productName'];
    productCode = json['productCode'];
    productCategory = json['productCategory'];
    productWebCategory = json['productWebCategory'];
    productNameVat = json['productNameVat'];
    productNote = json['productNote'];
    warrantyMonthNo = json['warrantyMonthNo'];
    productVatAmount = json['productVatAmount'];
    productUnit = json['productUnit'];
    productType =
        (json['productType'] as int? ?? json['orderItemType'] as int? ?? -1)
            .toProductType;
    quantity = json['quantity'];
    productPrice = (json['productPrice'] as num?)?.toDouble();
    imeiNo = json['imeiNo'];
    totalPrice = (json['totalPrice'] as num?)?.toDouble();
    discountAmount = (json['discountAmount'] as num?)?.toDouble();
    discountType = json['discountType'];
    listProductInCombo = (json['listProductInCombo'] as List?)
        ?.map((e) => BillItemModel.fromJson(e))
        .toList();
    billItemType = json['billItemType'];
    isGiftTaken = json['isGiftTaken'];
    accessoryGroupId = json['accessoryGroupId'];
    accessoryGroupCode = json['accessoryGroupCode'];
    repurchasePrice = (json['repurchasePrice'] as num?)?.toDouble();
    belongBillDetailId = json['belongBillDetailId'];
    note = json['note'];
    listAccessoryPromotion = (json['listAccessoryPromotion'] as List?)
        ?.map((e) => BillItemModel.fromJson(e))
        .toList();
    listProductPromotion = (json['listProductPromotion'] as List?)
        ?.map((e) => BillItemModel.fromJson(e))
        .toList();
    issuedVat = json['issuedVat'];
    sellingPrice = (json['sellingPrice'] as num?)?.toDouble();
    listedPrice = (json['listedPrice'] as num?)?.toDouble();
    merchantId = json['merchantId'];
    flexibleComboId = json['flexibleComboId'];
    flexibleComboName = json['flexibleComboName'];
    flexibleComboItemId = json['flexibleComboItemId'];
    warrantyReasonName = json['warrantyReasonName'];
    newProductId = json['newProductId'];
    newProductName = json['newProductName'];
    newProductCode = json['newProductCode'];
    newQuantity = json['newQuantity'];
    newProductPrice = (json['newProductPrice'] as num?)?.toDouble();
    newProductType = json['newProductType'];
    newTotalPrice = (json['newTotalPrice'] as num?)?.toDouble();
    newImeiCode = json['newImeiCode'];
    isLostProduct = json['isLostProduct'];
    voucherId = json['voucherId'];
    voucherDetailId = json['voucherDetailId'];
    voucherCode = json['voucherCode'];
    warrantyAddress = json['warrantyAddress'];
    warrantyPhone = json['warrantyPhone'];
    warrantyDescription = json['warrantyDescription'];
    customerTypeId = json['customerTypeId'];
    customerDiscountType = json['customerDiscountType'];
    customerDiscountAmount =
        (json['customerDiscountAmount'] as num?)?.toDouble();
    customerDiscountSellingPrice =
        (json['customerDiscountSellingPrice'] as num?)?.toDouble();
    customerDiscountMaxAmount =
        (json['customerDiscountMaxAmount'] as num?)?.toDouble();

    discountProgram = json['discountProgram'] != null
        ? DiscountProgramModel.fromJson(json['discountProgram'])
        : null;
    statusVieon = json['statusVieon'];
    quantityInStock = json['quantityInStock'];
    allowViewFullExternalImeiNo = json['allowViewFullExternalImeiNo'];
    isSoftwareProduct = json['isSoftwareProduct'];
    isVieonProduct = json['isVieonProduct'];

    if (json['gifts'] != null) {
      gifts = <BillItemModel>[];
      json['gifts'].forEach((v) {
        gifts!.add(BillItemModel.fromJson(v));
      });
    }
    if (json['attaches'] != null) {
      attaches = <BillItemModel>[];
      json['attaches'].forEach((v) {
        attaches!.add(BillItemModel.fromJson(v));
      });
    }
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
        ..sellingPrice = sellingPrice
        ..createdAt = createdAt
        ..note = note
        ..merchantId = merchantId
        ..discountProgramId = discountProgramId
        ..discountType = discountType ?? 1
        ..discountAmount = discountAmount ?? 0
        ..productType = productType
        ..productId = productId
        ..repurchasePrice = repurchasePrice
        ..promotionId = promotionId
        ..accessoryGroupId = accessoryGroupId
        ..accessoryGroupCode = accessoryGroupCode
        ..note = note
        ..flexibleComboId = flexibleComboId
        ..flexibleComboItemId = flexibleComboItemId
        ..merchantId = merchantId
        ..belongBillDetailId =
            belongBillDetailId // Id sản phẩm gốc trong hóa đơn bán hàng
        // ..newProductId = newProductId
        // ..newQuantity = newQuantity
        // ..newProductPrice = newProductPrice
        // ..newProductType = newProductType
        // ..newProductName = newProductName
        // ..newProductCode = newProductCode
        // ..newImeiCode = newImeiCode
        // ..newImeiId = newImeiId
        // ..newTotalPrice = newTotalPrice
        // ..isLostProduct = isLostProduct
        ..warrantyMonthNo = warrantyMonthNo
        ..warrantyAddress = warrantyAddress
        ..warrantyPhone = warrantyPhone
        ..warrantyDescription = warrantyDescription
        ..discountProgramId = discountProgramId
        ..productCategory = productCategory
        ..productWebCategory = productWebCategory
      // ..discountProgram = discountProgram
      // ..gifts = gifts
      // ..attachs = attachs
      // ..allowViewFullExternalImeiNo = allowViewFullExternalImeiNo
      ;

  ProductModel toProductModel() => ProductModel(
        productType: productType,
        productName: getName,
        imeiNo: getImeiNo,
        sellingPrice: getSellingPrice,
        discountAmount: getDiscountPrice,
        discountPrice: getDiscountPrice,
        quantity: getQuantity,
        id: productId,
        barCode: barCode,
      );

  List<ProductTable> get getConvertGifts =>
      gifts
          ?.map((e) => e.convertToProductTable..itemType = XItemType.gift)
          .toList() ??
      [];

  List<ProductTable> get getConvertAttaches =>
      attaches
          ?.map((e) => e.convertToProductTable..itemType = XItemType.attach)
          .toList() ??
      [];

  // tính lại tiền sản phẩm
  double get calculateTotalPrice => (productPrice ?? 0) * (quantity ?? 1);
}
