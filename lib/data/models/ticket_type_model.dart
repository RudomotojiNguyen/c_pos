import 'package:c_pos/common/extensions/extension.dart';

import '../../common/enum/enum.dart';

class TicketTypeModel {
  int? id;
  String? name;
  String? code;
  String? extra;
  String? rolesId;
  String? rolesCompleted;
  TicketType? functionAction;
  int? status;
  String? createdAt;
  String? updatedAt;

  TicketTypeModel(
      {this.id,
      this.name,
      this.code,
      this.extra,
      this.rolesId,
      this.rolesCompleted,
      this.functionAction,
      this.status,
      this.createdAt,
      this.updatedAt});

  TicketTypeModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    code = json['code'];
    extra = json['extra'];
    rolesId = json['roles_id'];
    rolesCompleted = json['roles_completed'];
    functionAction = (json['functionAction'] as String? ?? '').getTicketType;
    status = json['status'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  TicketType get getTicketType => functionAction ?? TicketType.none;
}
