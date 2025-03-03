import 'package:dio/dio.dart';

class DdvException implements Exception {
  final String message;
  final String prefix;

  DdvException({required this.message, required this.prefix});

  @override
  String toString() {
    return message;
  }

  String formattedString() {
    return '[$prefix] $message';
  }
}

class FetchDataException extends DdvException {
  FetchDataException({required super.message})
      : super(
          prefix: '',
        );
}

class BadRequestException extends DdvException {
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
