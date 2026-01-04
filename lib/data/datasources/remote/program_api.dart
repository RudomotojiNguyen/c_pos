import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/retrofit.dart';
import 'package:c_pos/data/models/models.dart';

part 'program_api.g.dart';

@RestApi()
abstract class ProgramApi {
  factory ProgramApi(Dio dio, {String baseUrl}) = _ProgramApi;

  /// kiểm tra lại chương trình chiết khấu sản phẩm
  ///
  @GET('discount-programs/by-product/{productId}/{storeId}')
  Future<BaseResponse> checkProgramDiscountOfProduct({
    @Path() required String productId,
    @Path() required int storeId,
    @Query('productIds') required List<String> productIds,
  });
}
