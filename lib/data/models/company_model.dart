class CompanyModel {
  int? id;
  String? code;
  String? name;

  CompanyModel({this.id, this.code, this.name});

  CompanyModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    code = json['code'];
    name = json['name'];
  }

  String get getName => name ?? '';
}
