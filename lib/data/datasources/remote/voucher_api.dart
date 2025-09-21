import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/retrofit.dart';
import 'package:c_pos/data/models/models.dart';

part 'voucher_api.g.dart';

@RestApi()
abstract class VoucherApi {
  factory VoucherApi(Dio dio, {String baseUrl}) = _VoucherApi;

  @GET('v1/vouchers/usable')
  Future<BaseResponse> getVoucherUsable({
    @Query('productId') required int productId,
    @Query('productAmount') required double productAmount,
    @Query('storeId') int? storeId,
    @Query('customerPhone') String? customerPhone,
  });
}
