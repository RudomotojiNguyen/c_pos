import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/retrofit.dart';

import '../../models/response/base_response.dart';

part 'bill_api.g.dart';

@RestApi()
abstract class BillApi {
  factory BillApi(Dio dio, {String baseUrl}) = _BillApi;

  /// lấy danh sách hóa đơn
  ///
  @GET('bills/mobile')
  Future<BaseResponse> getBills({
    @Query('page') required int page,
    @Query('size') required int size,
    @Query('type') int? type,
    @Query('storeId') int? storeId,
    @Query('searchType') int? searchType,
    @Query('param') String? search,
  });

  /// lấy thông tin hóa đơn
  ///
  @GET('bills/mobile/{billId}')
  Future<BaseResponse> getBillDetail(@Path() String billId);

  /// tạo hóa đơn
  ///
  @POST('bills/mobile/v2')
  Future<BaseResponse> createBill(@Body() Map<String, dynamic> data);

  /// cập nhật hóa đơn
  ///
  @PUT('bills/v2')
  Future<BaseResponse> updateBill(@Body() Map<String, dynamic> data);
}
