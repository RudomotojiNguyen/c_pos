import 'package:c_pos/common/extensions/extension.dart';

import '../../common/constants/app_constants.dart';
import '../../common/enum/enum.dart';
import '../../presentation/utils/utils.dart';
import '../datasources/local_db/local_db.dart';
import 'stock_model.dart';
import 'waranty_info_model.dart';

class ProductModel {
  String? id;
  String? productName;
  String? productCode;
  String? productCodeVat;
  String? productNameVat;
  int? returnSellingPrice;
  String? parentProductId;
  String? barCode;
  int? status;
  late ProductType productType;
  String? brand;
  int? productCategory;
  int? productWebCategory;
  String? warrantyAddress;
  String? warrantyPhone;
  int? warrantyMonthNo;
  String? warrantyDescription;
  double? originalPrice;
  double? sellingPrice;
  double? wholesalePrice;
  double? listedPrice;
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
  List<ProductModel>? products;
  List<ProductModel>? productsCombo;
  bool? belongToWarrantyImei;
  String? externalImeiNo;
  // type product warranty & attach & gift
  double? repurchasePrice;
  double? discountValue;
  double? fromPrice;
  double? toPrice;
  int? warrantyPackageId;
  String? code;
  int? promotionId;
  String? accessoryGroupId;

  int? discountProgramId;
  int? discountType;
  double? discountAmount;
  double? discountPrice;

  List<StockModel>? stocks;

  List<ProductModel>? gifts;
  List<ProductModel>? attachs;

  /// lý do KPVD
  String? reasonName;

  String? imeiNo;
  int? quantity;

  ProductModel? productChildSelected;

  List<String>? images;
  String? imageUrl;

  ProductModel({
    this.id,
    this.productName,
    this.productCode,
    this.productCodeVat,
    this.productNameVat,
    this.returnSellingPrice,
    this.parentProductId,
    this.barCode,
    this.status,
    required this.productType,
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
    this.products,
    this.belongToWarrantyImei,
    this.discountProgramId,
    this.discountType,
    this.discountAmount,
    this.discountPrice,
    this.stocks,
    this.repurchasePrice,
    this.discountValue,
    this.warrantyPackageId,
    this.code,
    this.promotionId,
    this.accessoryGroupId,
    //
    this.reasonName,
    this.imeiNo,
    this.quantity,
    this.gifts,
    this.attachs,
    this.externalImeiNo,
    this.productChildSelected,
    this.productsCombo,
    this.images,
    this.imageUrl,
  });

  ProductModel.fromJson(Map<String, dynamic> json, {ProductType? type}) {
    productType = type ?? convertType(json['productType'] ?? -1);
    id = json['id'] ?? json['productId'];
    productName = json['productName'];
    productCode = json['productCode'];
    productCodeVat = json['productCodeVat'];
    productNameVat = json['productNameVat'];
    returnSellingPrice = json['returnSellingPrice'];
    parentProductId = json['parentProductId'];
    barCode = json['barCode'];
    status = json['status'];
    brand = json['brand'];
    productCategory = json['productCategory'];
    productWebCategory = json['productWebCategory'];
    warrantyAddress = json['warrantyAddress'];
    warrantyPhone = json['warrantyPhone'];
    warrantyMonthNo = json['warrantyMonthNo'];
    warrantyDescription = json['warrantyDescription'];
    originalPrice = Utils.toDouble(json['originalPrice']);
    sellingPrice = Utils.toDouble(json['sellingPrice'] ?? 0);
    wholesalePrice = Utils.toDouble(json['wholesalePrice']);
    listedPrice = Utils.toDouble(json['listedPrice']);
    totalQuantityInStock = json['totalQuantityInStock'];
    totalQuantityInTransfer = json['totalQuantityInTransfer'];
    createdAt = json['createdAt'];
    companyId = json['companyId'];
    note = json['note'];
    merchantId = json['merchantId'];
    productTradeName = json['productTradeName'];
    unitId = json['unitId'];
    fulfillmentType = json['fulfillmentType'];
    totalQuantityInStore = json['totalQuantityInStore'];
    if (productType == ProductType.combo) {
      if (json['products'] != null) {
        productsCombo = <ProductModel>[];
        (json['products'] ?? []).forEach((v) {
          productsCombo!.add(ProductModel.fromJson(v));
        });
      }
    } else {
      if (json['products'] != null || json['childs'] != null) {
        products = <ProductModel>[];
        (json['products'] ?? json['childs']).forEach((v) {
          products!.add(ProductModel.fromJson(v));
        });
      }
    }

    belongToWarrantyImei = json['belongToWarrantyImei'];
    discountProgramId = json['discountProgramId'];
    discountType = json['discountType'];
    discountAmount = Utils.toDouble(json['discountAmount']);
    discountPrice = Utils.toDouble(json['discountPrice']);

    repurchasePrice = Utils.toDouble(json['repurchasePrice']);
    discountValue = Utils.toDouble(json['discountValue']);
    fromPrice = Utils.toDouble(json['fromPrice']);
    toPrice = Utils.toDouble(json['toPrice']);
    warrantyPackageId = json['warrantyPackageId'];
    code = json['code'];
    promotionId = json['promotionId'];
    accessoryGroupId = json['accessoryGroupId'];

    if (json['productStocks'] != null) {
      stocks = <StockModel>[];
      json['productStocks'].forEach((v) {
        stocks!.add(StockModel.fromJson(v));
      });
    }

    if (json['gifts'] != null) {
      gifts = <ProductModel>[];
      json['gifts'].forEach((v) {
        gifts!.add(ProductModel.fromJson(v));
      });
    }

    if (json['attachs'] != null) {
      attachs = <ProductModel>[];
      json['attachs'].forEach((v) {
        attachs!.add(ProductModel.fromJson(v));
      });
    }

    externalImeiNo = json['externalImeiNo'];

    if (json['imageUrls'] != null) {
      images = <String>[];
      for (var v in json['imageUrls']) {
        if (v != null) {
          images!.add(v);
        }
      }
    }

    imageUrl = json['imageUrl'];
  }

  ProductType convertType(int value) => value.toProductType;

  String get getImageThumbnail {
    return imageUrl.isNullOrEmpty ? AppConstants.defaultImage : imageUrl!;
  }

  List<String> get getImages => images ?? [];

  String get getName => productChildSelected?.getName ?? productName ?? '';

  String get getDataCopy => '$productName - $barCode';

  String getChildName(String parentName) {
    String lowerParentName = parentName.toLowerCase();
    String lowerChildProduct = getName.toLowerCase();

    // Kiểm tra xem tên sản phẩm con có chứa tên sản phẩm cha (bất kể hoa thường)
    if (lowerChildProduct.contains(lowerParentName)) {
      // Xác định vị trí kết thúc của tên cha trong tên sản phẩm con
      int endIndex =
          lowerChildProduct.indexOf(lowerParentName) + lowerParentName.length;
      return getName
          .substring(endIndex)
          .trim()
          .replaceFirst(RegExp(r'^- '), '');
    }
    return getName;
  }

  String get getBarCode => barCode ?? '';

  int get getStockQuantity => totalQuantityInStock ?? 0;

  double get getDiscountPrice => discountPrice ?? 0;

  /// giá bán
  double get getSellingPrice {
    switch (productType) {
      case ProductType.attach:
        return getRepurchasePrice;
      default:
        return sellingPrice ?? 0;
    }
  }

  /// giá bán sau chiết khấu
  /// hoặc có thể là giá thu lại (đối với quà tặng)
  double get getRepurchasePrice => repurchasePrice ?? 0;

  double get getListedPrice => listedPrice ?? 0;

  int get getTotalQuantityInStore => totalQuantityInStore ?? 0;

  // bool get isExistInStock => getTotalQuantityInStore > 0;
  bool get isExistInStock => true;

  List<ProductModel> get getProducts {
    List<ProductModel> data = (products ?? []);
    data.sort((a, b) => a.getName.compareTo(b.getName));
    return data;
  }

  List<ProductModel> get getProductsCombo {
    return (productsCombo ?? []);
  }

  Map<String, dynamic> toChildJson() => {
        "id": id,
        "productName": productName,
        "productCode": productCode,
        "sellingPrice": sellingPrice,
        "quantity": quantity ?? 1,
        "discountAmount": discountAmount,
        "accessoryGroupId": accessoryGroupId,
        "code": code,
        "discountType": discountType,
        "discountProgramId": discountProgramId,
      };

  List<Map<String, dynamic>> toChildComboJson() => (productsCombo ?? [])
      .map((e) => {
            "id": e.id,
            "parentProductId": e.parentProductId,
            "productName": e.productName,
            "productNameVat": e.productNameVat,
            "productType": e.productType.getValueType,
            "originalPrice": e.originalPrice,
            "sellingPrice": e.sellingPrice,
            "inComboQuantity": 1,
            "totalQuantityInStock": e.totalQuantityInStock,
            "totalQuantityInStore": e.totalQuantityInStore,
            "belongToWarrantyImei": e.belongToWarrantyImei,
          })
      .toList();

  WarrantyInfoModel get getWarrantyInfo => WarrantyInfoModel(
        warrantyAddress: warrantyAddress,
        warrantyPhone: warrantyPhone,
        warrantyMonthNo: warrantyMonthNo,
        warrantyDescription: warrantyDescription,
      );

  ProductTable convertToTable({int? cartId, int quantity = 1}) => ProductTable(
        cartId: cartId,
        image: imageUrl,
        quantity: quantity,
        imeiStr: null,
        productId: id,
        productName: productName,
        productCode: productCode,
        productCodeVat: productCodeVat,
        productNameVat: productNameVat,
        returnSellingPrice: returnSellingPrice,
        parentProductId: parentProductId,
        barCode: barCode,
        status: status,
        productType: productType,
        brand: brand,
        productCategory: productCategory,
        productWebCategory: productWebCategory,
        warrantyAddress: warrantyAddress,
        warrantyPhone: warrantyPhone,
        warrantyMonthNo: warrantyMonthNo,
        warrantyDescription: warrantyDescription,
        originalPrice: originalPrice,
        sellingPrice: sellingPrice,
        wholesalePrice: wholesalePrice,
        listedPrice: listedPrice,
        totalQuantityInStock: totalQuantityInStock,
        totalQuantityInTransfer: totalQuantityInTransfer,
        createdAt: createdAt,
        companyId: companyId,
        note: note,
        merchantId: merchantId,
        productTradeName: productTradeName,
        unitId: unitId,
        fulfillmentType: fulfillmentType,
        totalQuantityInStore: totalQuantityInStore,
        belongToWarrantyImei: belongToWarrantyImei,
        discountProgramId: discountProgramId,
        discountType: discountType,
        discountAmount: discountAmount,
        discountPrice: discountPrice,
        warrantyPackageId: warrantyPackageId,
        discountValue: discountValue,
        repurchasePrice: repurchasePrice,
        fromPrice: fromPrice,
        toPrice: toPrice,
        code: code,
        promotionId: promotionId,
        accessoryGroupId: accessoryGroupId,
      )
        ..productChild = productChildSelected
        ..productChildCombo = productsCombo;
}
