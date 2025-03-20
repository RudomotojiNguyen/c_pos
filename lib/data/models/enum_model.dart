class EnumModel {
  int? id;
  String? name;

  EnumModel({this.id, this.name});

  EnumModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }
}
