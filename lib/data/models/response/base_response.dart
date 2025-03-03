import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../../common/network/exceptions/ddv_exception.dart';

@immutable
// ignore: must_be_immutable
class BaseResponse extends Equatable {
  dynamic data;
  int? statusCode;
  String? message;
  PageInfoEntity? pageInfo;

  BaseResponse({
    this.data,
    this.statusCode,
    this.message,
    this.pageInfo,
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
    pageInfo =
        json['meta'] != null ? PageInfoEntity.fromJson(json['meta']) : null;
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

class PageInfoEntity {
  int? limit;
  int? page;
  int? total;
  int? itemCount;
  int? pageCount;
  bool? hasPreviousPage;
  bool? hasNextPage;

  PageInfoEntity({
    this.limit,
    this.page,
    this.total,
    this.itemCount,
    this.pageCount,
    this.hasPreviousPage,
    this.hasNextPage,
  });

  PageInfoEntity.fromJson(Map<String, dynamic> json) {
    limit = json['limit'];
    page = json['page'];
    total = json['total'];
    itemCount = json['itemCount'];
    pageCount = json['pageCount'];
    hasPreviousPage = json['hasPreviousPage'];
    hasNextPage = json['hasNextPage'];
  }

  bool get checkHasNextPage => hasNextPage ?? false;

  int get getPage => page ?? 1;

  int get getLimit => limit ?? 10;
}
