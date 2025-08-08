import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/retrofit.dart';
import 'package:c_pos/data/models/models.dart';

part 'trade_in_api.g.dart';

@RestApi()
abstract class TradeInApi {
  factory TradeInApi(Dio dio, {String baseUrl}) = _TradeInApi;

  /// lấy thông tin định giá của sản phẩm
  /// params: {
  ///         tradeInProgramId: int,
  ///         imei: String,
  ///         productId: int,
  ///         productBuyingPrice: double,
  ///         totalCriteriaPrice: double,
  ///         finalBuyingPrice: double,
  ///         customer: CustomerModel,
  ///         criteriaGroups: List<TradeInProgramCreteriaGroupOptionModel>,
  ///         note: String,
  ///         typeTradeIn: int,
  ///       }
  @POST('v1/trade-ins/mobile')
  Future<BaseResponse> saveBillTradeIn(@Body() Map<String, dynamic> params);

  /// Lấy danh sách phiếu định giá
  ///
  @GET('v1/trade-ins')
  Future<BaseResponse> getListTradeIn({
    @Query('page') required int page,
    @Query('limit') required int limit,
    @Query('searchCustomer') String? searchCustomer,
    @Query('fromDate') String? fromDate,
    @Query('toDate') String? toDate,
    @Query('searchProduct') String? searchProduct,
  });

  /// Lấy thông tin chi tiết của 1 phiếu định giá
  ///
  // @GET('tradeIn/mobile/detail/{id}')
  // Future<BaseResponse> getTradeInDetail(@Path() int id);

  /// Lấy danh sách phiếu định giá của 1 khách hàng theo số điện thoại của khách
  ///
  @GET('tradeIn/mobile/list-by-customer')
  Future<BaseResponse> getCustomerTradeIn({
    @Query('page') required int page,
    @Query('limit') required int limit,
    @Query('customerPhone') String? customerPhone,
  });

  /// tìm sản phẩm trade-in theo tên
  ///
  @GET('v1/trade-in-programs/mobile/by-product-name')
  Future<BaseResponse> getTradeInProductByName({
    @Query('productName') required String productName,
  });

  /// lấy chương trình định giá của sản phẩm
  ///
  @GET('v1/trade-in-programs/mobile/by-product-id')
  Future<BaseResponse> getTradeInCriterion({
    @Query('productId') required String productId,
  });

  /// Tìm sp theo Imei
  ///
  // @GET('tradeIn/mobile/check-imei?imei={imei}')
  // Future<BaseResponse> getProductByImei({@Query('imei') required String imei});
}
