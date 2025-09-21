import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/retrofit.dart';
import 'package:c_pos/data/models/models.dart';

part 'bill_api.g.dart';

@RestApi()
abstract class BillApi {
  factory BillApi(Dio dio, {String baseUrl}) = _BillApi;

  /// lấy danh sách hóa đơn
  ///
  @GET('v1/bills')
  Future<BaseResponse> getBills({
    @Query('page') required int page,
    @Query('size') required int size,
    @Query('billNumber') String? billNumber,
    @Query('orderId') String? orderId,
    @Query('customerPhoneSearch') String? customerPhoneSearch,
    @Query('productSearch') String? productSearch,
    @Query('imeiSearch') String? imeiSearch,
    @Query('searchCoupon') String? searchCoupon,
    @Query('employeeId') int? employeeId,
    @Query('type') int? type,
    @Query('storeIds') List<int>? storeIds,
  });

  /// lấy thông tin hóa đơn
  ///
  @GET('v1/bills/{billId}')
  Future<BaseResponse> getBillDetail(@Path() String billId);

  /// tạo hóa đơn
  ///
  @POST('v1/bills')
  Future<BaseResponse> createBill(@Body() Map<String, dynamic> data);

  /// cập nhật hóa đơn
  ///
  @PUT('v1/bills/')
  Future<BaseResponse> updateBill(@Body() Map<String, dynamic> data);
}
