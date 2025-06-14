import 'dart:convert';

import 'package:c_pos/common/extensions/extension.dart';
import 'package:c_pos/data/datasources/local_db/table/voucher_table.dart';
import 'package:isar/isar.dart';

import '../../../../common/constants/app_constants.dart';
import '../../../../common/di/injection/injection.dart';
import '../../../../common/enum/enum.dart';
import '../../../../presentation/journey/screen/drafting_invoice/bloc/drafting_invoice_bloc.dart';
import '../../../../presentation/utils/utils.dart';
import '../../../models/product_discount_model.dart';
import '../../../models/product_imei_model.dart';
import '../../../models/product_model.dart';

part 'product_table.g.dart';

part 'extensions/product_table_extension.dart';
part 'extensions/products_table_extension.dart';

@Collection()
class ProductTable {
  Id id = Isar.autoIncrement;

  String? itemId; // dùng để update thông tin sản phẩm trong bill
  int? quantity;
  String? image;

  /// imei sản phẩm
  String? imeiStr;

  @ignore
  ProductImeiModel? get imei =>
      imeiStr != null ? ProductImeiModel().toModel(imeiStr!) : null;

  set imei(ProductImeiModel? value) {
    imeiStr = value != null ? jsonEncode(value.toJson()) : null;
  }

  String? productName;
  String? productCode;
  String? productCodeVat;
  String? productNameVat;
  int? returnSellingPrice;
  String? parentProductId;
  String? barCode;
  int? status;
  String? brand;
  int? productCategory;
  int? productWebCategory;
  String? warrantyAddress;
  String? warrantyPhone;
  int? warrantyMonthNo;
  String? warrantyDescription;
  double? originalPrice;
  double? sellingPrice;
  double? listedPrice;
  double? wholesalePrice;
  int? totalQuantityInStock;
  int? totalQuantityInTransfer;
  String? createdAt;
  int? companyId;
  String? note;
  int? merchantId;
  String? productTradeName;
  int? unitId;
  int? fulfillmentType;
  int? totalQuantityInStore;
  bool? belongToWarrantyImei;

  int? appearTimes;
  String? belongBillDetailId;

  /// tạo bảo hành
  int? warrantyReasonId;
  String? warrantyReasonName;
  String? externalImeiId;
  bool? isLostProduct; // bảo hành mất xác

  final IsarLink<ProductTable> replacedWarrantyProduct =
      IsarLink<ProductTable>();

  /// D-mem: giảm giá SP theo phân loại khách
  String? customerDiscountForProductStr;

  @ignore
  ProductDiscountModel? get customerDiscountForProduct =>
      customerDiscountForProductStr != null
          ? ProductDiscountModel().toModel(customerDiscountForProductStr!)
          : null;

  set customerDiscountForProduct(ProductDiscountModel? value) {
    customerDiscountForProductStr =
        value != null ? jsonEncode(value.toJson()) : null;
  }

  ///
  String? externalImeiNo; // imei đính kèm cho phụ kiện
  String? selectImeiReason; // lý do chọn imei khác

  bool? isComboProduct;
  String? flexibleComboId; // id cu sản phẩm combo bọc bên ngoài
  String? comboId;
  String?
      flexibleComboItemId; //id của các item bên trong sp combo không phải sp thêm vào
  int? productInComboQuantity;
  int? discountProgramId;
  int? discountType;
  double? discountAmount;
  double? discountPrice;

  ///Giảm giá bằng tay
  String? discountByHandStr;

  @ignore
  HandDiscount? get discountByHand => discountByHandStr != null
      ? HandDiscount().toModel(discountByHandStr!)
      : null;

  set discountByHand(HandDiscount? value) {
    discountByHandStr = value != null ? jsonEncode(value.toJson()) : null;
  }

  // sản phảm con được chọn
  String? productChildStr;

  @ignore
  ProductModel? get productChild => productChildStr.isNotNullOrEmpty
      ? ProductModel.fromJson(jsonDecode(productChildStr!))
      : null;

  set productChild(ProductModel? value) {
    productChildStr = value != null ? jsonEncode(value.toChildJson()) : null;
  }

  // sản phảm con của sản phẩm combo
  String? productChildComboStr;

  @ignore
  List<ProductModel>? get productChildCombo => productChildComboStr
          .isNotNullOrEmpty
      ? (jsonDecode(productChildComboStr!) as List)
          .map((e) => ProductModel.fromJson(e))
          .toList()
      : null;

  set productChildCombo(List<ProductModel>? value) {
    productChildComboStr = value != null
        ? jsonEncode(value.map((e) => e.toChildJson()).toList())
        : null;
  }

  int? cartId; //
  @Enumerated(EnumType.ordinal)
  ProductType productType; // loại sản phẩm
  @Enumerated(EnumType.ordinal)
  ProductType productChildType; // loại sản phẩm con lúc thêm vòa đơn
  String? productId; //

  /// warranty & attach & gift
  int? warrantyPackageId;
  double? repurchasePrice;
  double? discountValue;
  double? fromPrice;
  double? toPrice;
  String? code;
  int? promotionId;
  String? accessoryGroupId;
  String? accessoryGroupCode;

  bool? isRepurchasePrice; // thu lại sản phẩm
  String? attachedImei; // imei sản phẩm bán kèm

  final productsGift = IsarLinks<ProductTable>(); // quà tặng
  @ignore
  List<ProductTable>? giftsSelected;

  final productsAttach = IsarLinks<ProductTable>(); // mua kèm
  @ignore
  List<ProductTable>? attachesSelected;

  final productsWarranty = IsarLinks<ProductTable>(); // gói bảo hành
  @ignore
  List<ProductTable>? warrantiesSelected;

  final vouchers = IsarLinks<VoucherTable>(); // mã giảm giá
  @ignore
  List<VoucherTable>? vouchersSelected;

  ProductTable({
    this.itemId,
    this.appearTimes,
    this.externalImeiNo,
    this.selectImeiReason,
    this.isComboProduct,
    this.flexibleComboItemId,
    this.comboId,
    this.productInComboQuantity,
    this.cartId,
    this.quantity,
    this.image,
    this.imeiStr,
    this.productId,
    this.productName,
    this.productCode,
    this.productCodeVat,
    this.productNameVat,
    this.returnSellingPrice,
    this.parentProductId,
    this.barCode,
    this.status,
    this.productType = ProductType.normal,
    this.productChildType = ProductType.normal,
    this.brand,
    this.productCategory,
    this.productWebCategory,
    this.warrantyAddress,
    this.warrantyPhone,
    this.warrantyMonthNo,
    this.warrantyDescription,
    this.originalPrice,
    this.sellingPrice,
    this.wholesalePrice,
    this.listedPrice,
    this.totalQuantityInStock,
    this.totalQuantityInTransfer,
    this.createdAt,
    this.companyId,
    this.note,
    this.merchantId,
    this.productTradeName,
    this.unitId,
    this.fulfillmentType,
    this.totalQuantityInStore,
    this.belongToWarrantyImei,
    this.discountProgramId,
    this.discountType,
    this.discountAmount,
    this.discountPrice,
    this.discountByHandStr,
    this.warrantyPackageId,
    this.repurchasePrice,
    this.discountValue,
    this.fromPrice,
    this.toPrice,
    this.code,
    this.promotionId,
    this.accessoryGroupId,
  });
}

class HandDiscount {
  int? type;
  double? amount;

  HandDiscount({this.type, this.amount});

  HandDiscount.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    amount = json['amount'];
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = <String, dynamic>{};
    data['type'] = type;
    data['amount'] = amount;
    return data;
  }

  HandDiscount toModel(String value) {
    final res = jsonDecode(value);
    HandDiscount data = HandDiscount.fromJson(res);
    return data;
  }

  XDiscountType get getDiscountType =>
      type?.getDiscountType ?? XDiscountType.none;

  @override
  String toString() {
    return jsonEncode(toJson());
  }
}
