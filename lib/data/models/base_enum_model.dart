class BaseEnumModel {
  int? id;
  String? name;
  String? key;
  int? conditionCancel;

  BaseEnumModel({this.id, this.name, this.key, this.conditionCancel});

  BaseEnumModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    key = json['key'];
    conditionCancel = json['conditionCancel'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['key'] = key;
    data['conditionCancel'] = conditionCancel;
    return data;
  }

  String get getName => name ?? '';
}
