class CategoryModel {
  int? id;
  String? code;
  String? name;
  int? parentId;
  int? level;
  int? deleted;
  String? createdAt;
  String? updatedAt;
  int? companyId;
  int? merchantId;
  String? tradeName;
  int? updatedBy;
  int? purchasingDepartmentId;

  CategoryModel(
      {this.id,
      this.code,
      this.name,
      this.parentId,
      this.level,
      this.deleted,
      this.createdAt,
      this.updatedAt,
      this.companyId,
      this.merchantId,
      this.tradeName,
      this.updatedBy,
      this.purchasingDepartmentId});

  CategoryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    code = json['code'];
    name = json['name'];
    parentId = json['parentId'];
    level = json['level'];
    deleted = json['deleted'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    companyId = json['companyId'];
    merchantId = json['merchantId'];
    tradeName = json['tradeName'];
    updatedBy = json['updatedBy'];
    purchasingDepartmentId = json['purchasingDepartmentId'];
  }

  String get getCategoryName => name ?? '';
}
