import '../../presentation/utils/utils.dart';

class StockModel {
  String? id;
  int? storeId;
  int? quantity;
  int? inStockQuantity;
  int? deliveryQuantity;
  int? transferQuantity;
  int? holdingQuantity;
  int? warrantyQuantity;
  String? productId;
  String? providerId;
  int? originalPrice;
  int? sellingPrice;
  int? companyId;
  String? firstTransactionDate;
  String? lastTransactionDate;
  String? lastSaleDate;
  String? tmpLastSaleDate;
  bool? isCreatedFromNhanh;
  String? storeName;
  String? storeShortName;
  String? storeAddress;
  double? longitude;
  double? latitude;
  double? d;

  StockModel(
      {this.id,
      this.storeId,
      this.quantity,
      this.inStockQuantity,
      this.deliveryQuantity,
      this.transferQuantity,
      this.holdingQuantity,
      this.warrantyQuantity,
      this.productId,
      this.providerId,
      this.originalPrice,
      this.sellingPrice,
      this.companyId,
      this.firstTransactionDate,
      this.lastTransactionDate,
      this.lastSaleDate,
      this.tmpLastSaleDate,
      this.isCreatedFromNhanh,
      this.storeName,
      this.storeShortName,
      this.storeAddress,
      this.longitude,
      this.latitude,
      this.d});

  StockModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    storeId = json['storeId'];
    quantity = json['quantity'];
    inStockQuantity = json['inStockQuantity'];
    deliveryQuantity = json['deliveryQuantity'];
    transferQuantity = json['transferQuantity'];
    holdingQuantity = json['holdingQuantity'];
    warrantyQuantity = json['warrantyQuantity'];
    productId = json['productId'];
    providerId = json['providerId'];
    originalPrice = json['originalPrice'];
    sellingPrice = json['sellingPrice'];
    companyId = json['companyId'];
    firstTransactionDate = json['firstTransactionDate'];
    lastTransactionDate = json['lastTransactionDate'];
    lastSaleDate = json['lastSaleDate'];
    tmpLastSaleDate = json['tmpLastSaleDate'];
    isCreatedFromNhanh = Utils.toBoolean(json['isCreatedFromNhanh']);
    storeName = json['storeName'];
    storeShortName = json['storeShortName'];
    storeAddress = json['storeAddress'];
    longitude = Utils.toDouble(json['longitude']);
    latitude = Utils.toDouble(json['latitude']);
    d = Utils.toDouble(json['d']);
  }

  String get getStoreName => storeName ?? '';

  String get getStoreAddress => storeAddress ?? '';

  int get getInStockQuantity => inStockQuantity ?? 0;
}
