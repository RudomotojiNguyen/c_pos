import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/retrofit.dart';
import 'package:c_pos/data/models/models.dart';

part 'address_api.g.dart';

@RestApi()
abstract class AddressApi {
  factory AddressApi(Dio dio, {String baseUrl}) = _AddressApi;

  @GET('city')
  Future<BaseResponse> getCity();

  @GET('city/{cityId}/district')
  Future<BaseResponse> getDistrict(@Path('cityId') String cityId);

  @GET('city/{districtId}/ward')
  Future<BaseResponse> getWard(@Path('districtId') String districtId);
}
