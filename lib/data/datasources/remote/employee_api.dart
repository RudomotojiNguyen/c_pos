import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/retrofit.dart';
import 'package:c_pos/data/models/models.dart';

part 'employee_api.g.dart';

@RestApi()
abstract class EmployeeApi {
  factory EmployeeApi(Dio dio, {String baseUrl}) = _EmployeeApi;

  /// lấy danh sách nhân viên
  ///
  @GET('v1/employees/all')
  Future<BaseResponse> getEmployees();

  /// lấy danh sách nhân viên theo store
  @GET('v1/employees/by-store')
  Future<BaseResponse> getEmployeesByStore({
    @Query('storeIds') required List<int> storeIds,
  });
}
