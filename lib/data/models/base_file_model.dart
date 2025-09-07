class BaseFileModel {
  String? id;
  String? name;
  String? originalName;
  String? mimeType;
  int? size;
  int? width;
  int? height;
  String? ext;
  String? url;
  String? status;
  String? createdAt;
  String? updatedAt;

  BaseFileModel({
    this.id,
    this.name,
    this.originalName,
    this.mimeType,
    this.size,
    this.width,
    this.height,
    this.ext,
    this.url,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  BaseFileModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    originalName = json['originalName'];
    mimeType = json['mimeType'];
    size = json['size'];
    width = json['width'];
    height = json['height'];
    ext = json['ext'];
    url = json['url'];
    status = json['status'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }
}
