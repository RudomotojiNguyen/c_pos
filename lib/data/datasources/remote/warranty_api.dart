import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/retrofit.dart';
import 'package:c_pos/data/models/models.dart';

part 'warranty_api.g.dart';

@RestApi()
abstract class WarrantyApi {
  factory WarrantyApi(Dio dio, {String baseUrl}) = _WarrantyApi;

  /// lấy danh sách yêu cầu bảo hành
  ///
  @GET('bill-item-warranties')
  Future<BaseResponse> getWarrantyList({
    @Query('page') required int page,
    @Query('size') required int size,
    @Query('storeIds') required List<int> storeIds,
  });

  /// lấy thông tin ghi chú bảo hành
  ///
  @GET('warrantyInfo/mobile')
  Future<BaseResponse> getWarrantyInfo({
    @Query('page') required int page,
    @Query('size') required int size,
    @Query('name') String? name,
  });
}
