import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/retrofit.dart';

import '../../models/response/base_response.dart';

part 'employee_api.g.dart';

@RestApi()
abstract class EmployeeApi {
  factory EmployeeApi(Dio dio, {String baseUrl}) = _EmployeeApi;

  /// lấy danh sách nhân viên
  ///
  @GET('employees/mobile')
  Future<BaseResponse> getEmployees({
    @Query('storeId') int? storeId,
  });

  ///
  ///
  @GET('bills')
  Future<BaseResponse> getEmployeeNote({
    @Query('page') required int page,
    @Query('limit') required int limit,
    @Query('storeId') required int storeId,
    @Query('type') int? type,
    @Query('fromDate') String? fromDate,
    @Query('toDate') String? toDate,
    @Query('saleId') int? saleId,
    @Query('status') int? status,
  });

  /// lấy ds nhân viên theo store
  ///ư
  @GET('employees/mobile?storeId={storeId}')
  Future<BaseResponse> getEmployeesByStoreId({
    @Path() required int storeId,
  });
}
