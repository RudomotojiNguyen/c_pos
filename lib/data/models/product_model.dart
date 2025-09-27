// ignore_for_file: prefer_initializing_formals

import 'package:c_pos/common/extensions/extension.dart';

import '../../common/constants/app_constants.dart';
import '../../common/enum/enum.dart';
import '../../presentation/utils/utils.dart';
import '../datasources/local_db/local_db.dart';
import 'stock_model.dart';

class ProductModel {
  String? id;
  String? productName;
  String? productCode;
  String? productCodeVat;
  String? productNameVat;
  int? returnSellingPrice;
  String? parentProductId;
  String? barCode;
  XProductStatus? status;
  late ProductType productType;
  String? brand;
  int? productCategory;
  int? productWebCategory;
  String? warrantyAddress;
  String? warrantyPhone;
  String? warrantyMonthNo;
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

  // type product warranty & attach & gift
  double? repurchasePrice;
  double? discountValue;
  double? fromPrice;
  double? toPrice;
  int? warrantyPackageId;
  String? code;
  int? promotionId;
  String? accessoryGroupId;
  String? accessoryGroupCode;

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

  /// stock
  int? inStockQuantity;

  /// product combo
  String? description;
  int? flexibleComboItemId; // id của sản phẩm con trong sản phẩm combo
  String? referenceId;
  double? discountRate;

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
    this.accessoryGroupCode,
    //
    this.reasonName,
    this.imeiNo,
    this.quantity,
    this.gifts,
    this.attachs,
    this.productChildSelected,
    this.productsCombo,
    this.images,
    this.imageUrl,
    this.inStockQuantity,
    this.description,
    this.flexibleComboItemId,
    this.referenceId,
    this.discountRate,
  });

  ProductModel.fromJson(Map<String, dynamic> json, {ProductType? type}) {
    productType = type ?? convertType(json['productType'] ?? -1);
    id = json['id']?.toString() ?? json['productId']?.toString();
    productName = json['productName'] ?? json['name'];
    productCode = json['productCode'] ?? json['code'];
    productCodeVat = json['productCodeVat'];
    productNameVat = json['productNameVat'];
    returnSellingPrice = json['returnSellingPrice'];
    parentProductId = json['parentProductId'];
    barCode = json['barCode'];
    status = (json['status'] as int?)?.getProductStatus;
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
    accessoryGroupCode = json['accessoryGroupCode'];
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

    if (json['imageUrls'] != null) {
      images = <String>[];
      for (var v in json['imageUrls']) {
        if (v != null) {
          images!.add(v);
        }
      }
    }

    imageUrl = json['imageUrl'] ?? json['productImageUrl'];
    inStockQuantity = json['inStockQuantity'];
    description = json['description'];
    if (json['listItem'] != null) {
      /// nếu có thông in listItem thì chứng tỏ nó là sp combo
      /// cập nhật lại productType là combo
      productType = ProductType.combo;

      productsCombo = <ProductModel>[];
      (json['listItem'] ?? []).forEach((v) {
        final prod = ProductModel.fromJson(v);
        prod.flexibleComboItemId = v['id'];
        productsCombo!.add(prod);
      });
    }
    flexibleComboItemId = json['flexibleComboItemId'];
    referenceId = json['referenceId'];
    discountRate = Utils.toDouble(json['discountRate']);
  }

  ProductType convertType(int value) => value.toProductType;

  String get getImageThumbnail {
    return imageUrl.isNullOrEmpty ? AppConstants.defaultImage : imageUrl!;
  }

  List<String> get getImages => images ?? [];

  String get getName => productChildSelected?.getName ?? productName ?? '';

  String get getDescription => description ?? '';

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
    return sellingPrice ?? 0;
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
        "listedPrice": listedPrice,
        "quantity": quantity ?? 1,
        "discountAmount": discountAmount,
        "accessoryGroupId": accessoryGroupId,
        "code": code,
        "discountType": discountType,
        "discountProgramId": discountProgramId,
        "flexibleComboItemId": flexibleComboItemId,
        "referenceId": referenceId,
        "discountRate": discountRate,
        "repurchasePrice": repurchasePrice,
      };

  ProductModel updateProductCombo(ProductModel product) => product
    ..discountAmount = discountAmount
    ..code = code
    ..discountType = discountType
    ..discountProgramId = discountProgramId
    ..flexibleComboItemId = flexibleComboItemId
    ..referenceId = referenceId
    ..discountRate = discountRate
    ..accessoryGroupId = accessoryGroupId;

  ProductTable convertToTable({
    int? cartId,
    int quantity = 1,
    required XItemType itemType,
  }) =>
      ProductTable(
        itemType: itemType,
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
        status: status?.getValueNum,
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
        discountProgramId: discountProgramId,
        discountPrice: discountPrice,
        warrantyPackageId: warrantyPackageId,
        discountValue: discountValue,
        repurchasePrice: repurchasePrice,
        fromPrice: fromPrice,
        toPrice: toPrice,
        code: code,
        promotionId: promotionId,
        accessoryGroupId: accessoryGroupId,
        accessoryGroupCode: accessoryGroupCode,
      )
        ..productChild = productChildSelected
        ..productChildCombo = productsCombo;

  int get getQuantity => quantity ?? 1;
}

/// tính toán cho combo
extension ProductComboExtension on ProductModel {
  double get getDiscountRate => discountRate ?? 0;

  double get getTotalPriceComboAfterDiscount {
    return getTotalPriceComboBeforeDiscount - getComboPriceDiscount;
  }

  double get getTotalPriceComboBeforeDiscount {
    return getListedPrice * getQuantity;
  }

  double get getComboPriceDiscount {
    if (discountType == XDiscountType.amount.value) {
      return getDiscountRate;
    }
    if (discountType == XDiscountType.percent.value) {
      return getTotalPriceComboBeforeDiscount * (getDiscountRate / 100);
    }
    return 0;
  }

  bool get isProductEnoughInformation {
    return getName.isNotNullOrEmpty;
  }
}
