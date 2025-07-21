import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/retrofit.dart';

import '../../models/response/base_response.dart';

part 'employee_api.g.dart';

@RestApi()
abstract class EmployeeApi {
  factory EmployeeApi(Dio dio, {String baseUrl}) = _EmployeeApi;

  /// lấy danh sách nhân viên
  ///
  @GET('v1/employees/all')
  Future<BaseResponse> getEmployees();
}
