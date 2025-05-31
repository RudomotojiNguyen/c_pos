class CityModel {
  int? id;
  String? name;

  CityModel({this.id, this.name});

  CityModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  String get getName => name ?? '';
}

class DistrictModel {
  int? id;
  String? name;
  int? cityId;
  int? cityLocationId;

  DistrictModel({this.id, this.name, this.cityId, this.cityLocationId});

  DistrictModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    cityId = json['cityId'];
    cityLocationId = json['cityLocationId'];
  }

  String get getName => name ?? '';
}

class WardModel {
  int? id;
  String? name;
  int? districtId;
  int? districtLocationId;

  WardModel({this.id, this.name, this.districtId, this.districtLocationId});

  WardModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    districtId = json['districtId'];
    districtLocationId = json['districtLocationId'];
  }

  String get getName => name ?? '';
}
