import 'package:c_pos/common/extensions/extension.dart';
import 'package:intl/intl.dart';

import '../../common/enum/enum.dart';

class HistoryChangeStoreModel {
  int? id;
  int? employeeId;
  int? currentStoreId;
  String? currentStoreName;
  int? targetStoreId;
  String? targetStoreName;
  int? createdBy;
  String? createdByName;
  int? approvedBy;
  String? approvedByName;
  ExchangeStoreStatus? status;
  String? description;
  String? createdAt;
  String? updatedAt;
  String? approvedAt;
  String? employeeName;
  String? employeeCode;
  String? statusName;
  String? jobTitleName;
  int? jobTitleId;

  HistoryChangeStoreModel(
      {this.id,
      this.employeeId,
      this.currentStoreId,
      this.currentStoreName,
      this.targetStoreId,
      this.targetStoreName,
      this.createdBy,
      this.createdByName,
      this.approvedBy,
      this.approvedByName,
      this.status,
      this.description,
      this.createdAt,
      this.updatedAt,
      this.approvedAt,
      this.employeeName,
      this.employeeCode,
      this.statusName,
      this.jobTitleName,
      this.jobTitleId});

  HistoryChangeStoreModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    employeeId = json['employeeId'];
    currentStoreId = json['currentStoreId'];
    currentStoreName = json['currentStoreName'];
    targetStoreId = json['targetStoreId'];
    targetStoreName = json['targetStoreName'];
    createdBy = json['createdBy'];
    createdByName = json['createdByName'];
    approvedBy = json['approvedBy'];
    approvedByName = json['approvedByName'];
    status = (json['status'] as int? ?? -1).getExchangeStoreStatus;
    description = json['description'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    approvedAt = json['approvedAt'];
    employeeName = json['employeeName'];
    employeeCode = json['employeeCode'];
    statusName = json['statusName'];
    jobTitleName = json['jobTitleName'];
    jobTitleId = json['jobTitleId'];
  }

  String get getIdStr => id?.toString() ?? '';

  String get getCurrentStoreName => currentStoreName ?? '';

  String get getTargetStoreName => targetStoreName ?? '';

  String get getDescription => description ?? '';

  String get getCreateDate {
    if (createdAt.isNullOrEmpty) return '';

    // Chuỗi thời gian gốc
    String originalDateTime = createdAt!;

    // Định dạng chuỗi thời gian gốc
    DateFormat originalFormat = DateFormat('dd/MM/yyyy HH:mm');
    // Định dạng chuỗi thời gian mới
    DateFormat desiredFormat = DateFormat('HH:mm, dd/MM/yyyy');

    // Chuyển đổi chuỗi thời gian gốc thành đối tượng DateTime
    DateTime dateTime = originalFormat.parse(originalDateTime);

    // Chuyển đổi đối tượng DateTime thành chuỗi thời gian mới
    String formattedDateTime = desiredFormat.format(dateTime);

    return formattedDateTime; // Output: 01:12, 20/05/2024
  }

  String get getStatusName => statusName ?? '';

  ExchangeStoreStatus get getExchangeStoreStatus =>
      status ?? ExchangeStoreStatus.none;
}
