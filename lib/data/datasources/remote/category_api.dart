import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/retrofit.dart';

import '../../models/response/base_response.dart';

part 'category_api.g.dart';

@RestApi()
abstract class CategoryApi {
  factory CategoryApi(Dio dio, {String baseUrl}) = _CategoryApi;

  @GET('category/mobile/get-all')
  Future<BaseResponse> getAllInternalCategory();
}
