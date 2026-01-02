import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/retrofit.dart';
import 'package:c_pos/data/models/models.dart';

part 'store_api.g.dart';

@RestApi()
abstract class StoreApi {
  factory StoreApi(Dio dio, {String baseUrl}) = _StoreApi;

  /// Lấy danh sách cửa hàng
  ///
  @GET('stores/getStores')
  Future<BaseResponse> getStores();

  /// Tạo phiếu chuyển cửa hàng
  /// params: {
  ///           currentStoreId: int,
  ///           targetStoreId: int,
  ///           targetStoreName: String,
  ///           description: String,
  ///         }
  @POST('transfer-store-forms/create')
  Future<BaseResponse> createSwitchStore(@Body() Map<String, dynamic> params);

  /// Đổi cửa hàng nhanh trong list cửa hàng của user
  /// params: {storeId: int}
  @PUT('employees/mobile/change-store')
  Future<BaseResponse> changeStore(@Body() Map<String, dynamic> params);

  /// lấy danh sách cửa hàng của nhân viên
  ///
  @GET('employees/approve-stores')
  Future<BaseResponse> getApproveStores();

  /// Kiểm tra trạng thái check IP wifi ở CH
  ///
  @GET('user-accesses/option')
  Future<BaseResponse> getStatusAccessOfStore({
    @Query('storeId') required int storeId,
  });

  /// Thay đổi trạng thái check IP wifi ở CH
  /// params: {id: int}
  @PUT('user-accesses/changeStatus')
  Future<BaseResponse> changeStatusAccessOfStore(
      @Body() Map<String, dynamic> params);

  /// lấy danh sách cửa hàng theo user
  @GET('v1/stores/get-by-user')
  Future<BaseResponse> getStoresByUser();
}
