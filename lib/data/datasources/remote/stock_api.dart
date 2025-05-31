import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/retrofit.dart';

import '../../models/response/base_response.dart';

part 'stock_api.g.dart';

@RestApi()
abstract class StockApi {
  factory StockApi(Dio dio, {String baseUrl}) = _StockApi;

  /// lấy danh sách sản phẩm cho kiểm tra tồn toàn hệ thống
  ///
  @GET('mobile-reports/by-role')
  Future<BaseResponse> getInventoryInStock({
    @Query('page') required int page,
    @Query('size') required int size,
    @Query('productName') String? productName,
    @Query('inStock') bool? inStock,
    @Query('categoryId') int? categoryId,
    @Query('productType') int? productType,
  });

  /// Lấy danh sách cửa hàng còn tồn sản phẩm bằng productId
  ///
  @GET('products/mobile/{productId}/product-stocks')
  Future<BaseResponse> getStoreHasProductInStockById(@Path() String productId);
}
