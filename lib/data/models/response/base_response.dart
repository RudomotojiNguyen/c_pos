import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../../common/network/exceptions/app_exception.dart';

@immutable
// ignore: must_be_immutable
class BaseResponse extends Equatable {
  dynamic data;
  int? statusCode;
  String? message;

  BaseResponse({
    this.data,
    this.statusCode,
    this.message,
  });

  BaseResponse.fromJson(Map<String, dynamic> json) {
    final statusCode = json['statusCode'] ?? json['status'];
    if (statusCode == 0) {
      throw FetchDataException(
        message: json['message'] ?? '',
      );
    }
    data = json['data'];
    this.statusCode = statusCode;
    message = json['message'];
  }

  BaseResponse.fromErrorJson(Map<String, dynamic> json) {
    final statusCode = json['statusCode'] ?? json['status'];
    data = json['data'];
    this.statusCode = statusCode;
    message = json['message'];
  }

  @override
  List<Object?> get props => [data];

  int get getStatusCode => statusCode ?? 0;

  bool get checkIsSuccess =>
      (getStatusCode >= 200 && getStatusCode < 300 || getStatusCode == 1);

  String get getMess => message ?? '';

  List<dynamic> get getListData {
    if (data is Map) {
      if (data.containsKey('data')) {
        return data['data'] ?? [];
      }
    }

    return data ?? [];
  }
}
