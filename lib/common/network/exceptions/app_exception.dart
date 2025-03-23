import 'package:dio/dio.dart';

class AppException implements Exception {
  final String message;
  final String prefix;

  AppException({required this.message, required this.prefix});

  @override
  String toString() {
    return message;
  }

  String formattedString() {
    return '[$prefix] $message';
  }
}

class FetchDataException extends AppException {
  FetchDataException({required super.message})
      : super(
          prefix: '',
        );
}

class BadRequestException extends AppException {
  BadRequestException({required super.message})
      : super(
          prefix: 'Invalid Request',
        );
}

class UnauthorisedException extends DioError {
  UnauthorisedException({
    required super.requestOptions,
    super.response,
  }) : super(
          type: DioErrorType.unknown,
        );
}
