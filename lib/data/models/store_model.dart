import '../../presentation/utils/utils.dart';

class StoreModel {
  int? id;
  String? name;
  String? shortName;
  int? companyId;
  String? siteCode;
  int? storeType;
  String? address;
  double? longitude;
  double? latitude;
  String? shipCode;
  String? storeName;
  int? areaId;

  StoreModel({
    this.id,
    this.name,
    this.shortName,
    this.companyId,
    this.siteCode,
    this.storeType,
    this.address,
    this.longitude,
    this.latitude,
    this.shipCode,
    this.storeName,
    this.areaId,
  });

  StoreModel.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? json['storeId'];
    name = json['name'];
    shortName = json['shortName'];
    companyId = json['companyId'];
    siteCode = json['siteCode'];
    storeType = json['storeType'];
    address = json['address'];
    longitude = Utils.toDouble(json['longitude']);
    latitude = Utils.toDouble(json['latitude']);
    shipCode = json['shipCode'];
    storeName = json['storeName'];
    areaId = json['areaId'];
  }

  String get getName => name ?? '';

  int get getStoreId => id ?? -1;
}
