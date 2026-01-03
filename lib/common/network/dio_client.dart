import 'dart:async';

import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import 'interceptor/network_interceptor.dart';

class DioClient {
  static FutureOr<Dio> setup({
    required NetworkInterceptor interceptor,
    required String baseUrl,
    required bool isDioLog,
  }) async {
    final options = BaseOptions(
      headers: <String, dynamic>{
        'Content-Type': 'application/json; charset=utf-8',
      },
      responseType: ResponseType.json,
      validateStatus: (status) => true,
      baseUrl: baseUrl,
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
    );
    final dio = Dio(options);

    /// Unified add authentication request header
    dio.interceptors.add(interceptor);

    // if (!kIsWeb) {
    //   (dio.httpClientAdapter as IOHttpClientAdapter).onHttpClientCreate =
    //       (io.HttpClient client) {
    //     client.badCertificateCallback =
    //         (io.X509Certificate cert, String host, int port) => true;
    //     return client;
    //   };
    // }

    /// Print Log if current is not release mode
    if (isDioLog) {
      dio.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: true,
        compact: true,
      ));
    }

    return dio;
  }
}
