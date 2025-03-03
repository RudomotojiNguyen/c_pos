import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../common/network/exceptions/ddv_exception.dart';
import '../widgets/widgets.dart';

mixin HandleException {
  void handleResponseException(dynamic e) {
    debugPrint('>>>>> HandleException: ${e.toString()}');
    if (e is String) {
      XToast.showNegativeMessage(message: e.toString());
    } else if (e is FetchDataException) {
      XToast.showNegativeMessage(message: e.message);
    } else if (e is DioException && e is SocketException) {
      XToast.showNegativeMessage(message: 'Lỗi kết nối');
    } else if (e is DioException && e is UnauthorisedException) {
      XToast.showNegativeMessage(message: 'Không có quyền truy cập');
    } else if (e is Map<String, dynamic>) {
      XToast.showNegativeMessage(message: e['message']);
    } else {
      XToast.showNegativeMessage(message: 'Đã xảy ra lỗi');
    }
  }
}
