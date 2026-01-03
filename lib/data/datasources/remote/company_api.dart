import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/retrofit.dart';
import 'package:c_pos/data/models/models.dart';

part 'company_api.g.dart';

@RestApi()
abstract class CompanyApi {
  factory CompanyApi(Dio dio, {String baseUrl}) = _CompanyApi;

  @GET('v1/companies/all')
  Future<BaseResponse> getCompanies();
}
