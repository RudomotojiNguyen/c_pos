class SuggestNoteModel {
  int? id;
  String? name;
  String? content;
  String? createdBy;
  String? createdAt;

  SuggestNoteModel(
      {this.id, this.name, this.content, this.createdBy, this.createdAt});

  SuggestNoteModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    content = json['content'];
    createdBy = json['createdBy'];
    createdAt = json['createdAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['content'] = content;
    data['createdBy'] = createdBy;
    data['createdAt'] = createdAt;
    return data;
  }
}
