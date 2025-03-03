import 'dart:convert';

import 'package:c_pos/common/extensions/extension.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../common/enum/enum.dart';
import '../../presentation/theme/themes.dart';
import 'employee_model.dart';
import 'ticket_body_data_model.dart';

class TicketModel {
  int? id;
  int? userCreated;
  int? userAssignee;
  String? type;
  String? extra;
  String? summary;
  String? reason;
  String? body;
  SupportTicketStatus? status;
  String? createdAt;
  String? updatedAt;
  TicketTypeSetting? ticketTypeSetting;
  UserCreateTicket? userCreateTicket;
  UserCreateTicket? userAssigneeTicket;

  TicketModel(
      {this.id,
      this.userCreated,
      this.userAssignee,
      this.type,
      this.extra,
      this.summary,
      this.reason,
      this.body,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.ticketTypeSetting,
      this.userCreateTicket,
      this.userAssigneeTicket});

  TicketModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userCreated = json['userCreated'];
    userAssignee = json['userAssignee'];
    type = json['type'];
    extra = json['extra'];
    summary = json['summary'];
    reason = json['reason'];
    body = json['body'];
    status = (json['status'] as int? ?? -1).getSupportTicketStatus;
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    ticketTypeSetting = json['TicketTypeSetting'] != null
        ? TicketTypeSetting.fromJson(json['TicketTypeSetting'])
        : null;
    userCreateTicket = json['userCreateTicket'] != null
        ? UserCreateTicket.fromJson(json['userCreateTicket'])
        : null;
    userAssigneeTicket = json['userAssigneeTicket'] != null
        ? UserCreateTicket.fromJson(json['userAssigneeTicket'])
        : null;
  }

  TicketType get getTicketType =>
      ticketTypeSetting?.functionAction ?? TicketType.none;

  SupportTicketStatus get getSupportTicketStatus =>
      status ?? SupportTicketStatus.none;

  Color get statusColor => status?.getColor ?? AppColors.neutralColor;

  String get getDescription => summary ?? '';

  String get getStatusName => status?.getTitle ?? '';

  String get getTypeName => ticketTypeSetting?.name ?? '';

  String get getCreateDate {
    if (createdAt.isNullOrEmpty) return '';

    // Chuỗi thời gian gốc
    String originalDateTime = createdAt!;

    // Định dạng chuỗi thời gian gốc
    DateFormat originalFormat = DateFormat('yyyy-MM-ddTHH:mm:ss.sssZ');
    // Định dạng chuỗi thời gian mới
    DateFormat desiredFormat = DateFormat('HH:mm, dd/MM/yyyy');

    // Chuyển đổi chuỗi thời gian gốc thành đối tượng DateTime
    DateTime dateTime = originalFormat.parse(originalDateTime);

    // Chuyển đổi đối tượng DateTime thành chuỗi thời gian mới
    String formattedDateTime = desiredFormat.format(dateTime);

    return formattedDateTime; // Output: 01:12, 20/05/2024
  }

  String get getEmployeeNameCreateTicket =>
      userCreateTicket?.employee?.getFullName ?? '';

  String get getEmployeeNameAssigneeTicket =>
      userAssigneeTicket?.employee?.getFullName ?? '';

  List<String> get imageUrls {
    // Chuỗi JSON chứa các URL hình ảnh
    String jsonString = extra ?? '[]';

    // Chuyển đổi chuỗi JSON thành mảng String
    List<String> urls = List<String>.from(json.decode(jsonString));

    return urls;
  }

  TicketBodyDataModel get parseBodyData {
    if (body == null) return TicketBodyDataModel();
    // Chuyển đổi chuỗi JSON thành đối tượng Map
    Map<String, dynamic> data = json.decode(body!);

    return TicketBodyDataModel.fromJson(data);
  }

  bool get checkEnableResent => status == SupportTicketStatus.newTicket;
}

class TicketTypeSetting {
  int? id;
  String? name;
  String? code;
  TicketType? functionAction;

  TicketTypeSetting({this.id, this.name, this.code, this.functionAction});

  TicketTypeSetting.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    code = json['code'];
    functionAction = (json['functionAction'] as String? ?? '').getTicketType;
  }
}

class UserCreateTicket {
  int? employeeId;
  EmployeeModel? employee;

  UserCreateTicket({this.employeeId, this.employee});

  UserCreateTicket.fromJson(Map<String, dynamic> json) {
    employeeId = json['employeeId'];
    employee = json['employee'] != null
        ? EmployeeModel.fromJson(json['employee'])
        : null;
  }
}
