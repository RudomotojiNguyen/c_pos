import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/retrofit.dart';

import '../../models/response/base_response.dart';

part 'product_api.g.dart';

@RestApi()
abstract class ProductApi {
  factory ProductApi(Dio dio, {String baseUrl}) = _ProductApi;

  /// lấy danh sách sản phẩm
  ///
  @GET('product')
  Future<BaseResponse> getProducts({
    @Query('page') required int page,
    @Query('limit') required int limit,
    @Query('categoryId') int? categoryId,
    @Query('status') int? status,
    @Query('productType') int? productType,
    @Query('brandId') int? brandId,
    @Query('parentProductId') String? parentProductId,
    @Query('childProductId') String? childProductId,
    @Query('name') String? name,
  });

  /// Lấy danh sách SP tặng kèm(gift)
  ///
  @GET('product/mobile/v2/{productId}/product-attachs')
  Future<BaseResponse> getProductAttached({
    @Path() required String productId,
    @Query('page') int? page,
    @Query('pageSize') int? pageSize,
    @Query('searchProduct') String? searchProduct,
  });

  /// Lấy danh sách SP bán kèm(attach)
  ///
  @GET('product/mobile/{productId}/product-promotions')
  Future<BaseResponse> getProductPromotions({
    @Path() required String productId,
    @Query('page') required int page,
    @Query('pageSize') required int pageSize,
    @Query('searchProduct') String? searchProduct,
  });

  /// Lấy danh sách SP gói bảo hành(warranty) của 1 SP cha
  ///
  @GET('product/mobile/{productId}/product-warrantys')
  Future<BaseResponse> getProductWarranties({
    @Path() required String productId,
    @Query('page') required int page,
    @Query('pageSize') required int pageSize,
    @Query('searchProduct') String? searchProduct,
  });

  /// tìm sản phầm tồn kho
  ///
  @GET('product/mobile/product-stocks')
  Future<BaseResponse> getProductInventory({
    @Query('page') required int page,
    @Query('size') required int size,
    @Query('productName') String? productName,
    @Query('inStock') bool? inStock,
    @Query('categoryId') int? categoryId,
    @Query('productType') int? productType,
  });

  /// do lấy quá nhiều dữ liệu nên tạm thời bỏ
  /// Lấy danh sách SP tặng kèm(gift) / bán kèm(attach) / gói bảo hành(warranty) của 1 SP cha
  // @GET('product/mobile/{productId}/product-attachs')
  // Future<BaseResponse> getAttachesProduct(@Path() String productId);

  /// tìm sản phẩm (nếu là imei thì có thêm imeiNo)
  ///
  @GET('product/mobile/search')
  Future<BaseResponse> searchProduct({
    @Query('page') required int page,
    @Query('size') required int size,
    @Query('type') int? type,
    @Query('param') String? param,
  });

  ///
  ///
  @GET('product/mobile/{productId}')
  Future<BaseResponse> getProductById(@Path() String productId);

  /// Tìm sản phẩm cho sản phẩm combo
  ///
  @GET('flexible-combo/search')
  Future<BaseResponse> searchProductCombo({
    @Query('textSearch') String? textSearch,
    @Query('storeId') int? storeId,
    @Query('page') required int page,
    @Query('size') required int size,
  });

  /// Tìm sản phẩm cho sản phẩm combo
  ///
  @GET('flexible-combo/search-product')
  Future<BaseResponse> searchProductInCombo({
    @Query('textSearch') String? textSearch,
    @Query('referenceType') int? referenceType,
    @Query('referenceId') int? referenceId,
    @Query('page') required int page,
    @Query('size') required int size,
  });

  /// lấy barcode sp từ link
  ///
  @GET('{link}')
  @Headers(<String, dynamic>{
    'Content-Type': 'application/json',
    'isUseBaseUrl': false,
  })
  Future<BaseResponse> getProductBarcode(@Path() String link);

  /// lấy thông tin giảm giá cho danh sách SP hiện tại
  /// params: {
  ///            productIds: List<int>,
  ///            customerPhone: String,
  ///            billNumber: int,
  ///          };
  @POST('customer/discount')
  Future<BaseResponse> getProductDiscountInfoByCustomer(
      @Body() Map<String, dynamic> params);

  /// lấy imeis
  /// với phần lấy imei ưu tiên có thể truyền limit là 1
  @GET('product/mobile/obsolete-imeis')
  Future<BaseResponse> getImei({
    @Query('limit') int? limit,
    @Query('productId') String? productId,
  });

  /// lấy danh sách lý chọn imei khác chứ không chọn FIFO
  @GET('product/select-imei-reason')
  Future<BaseResponse> getReasonSelectImei();

  /// tìm imei sản phẩm để kiểm tra lịch sử giao dịch của nó
  @GET('productEmeiStock/mobile')
  Future<BaseResponse> getImeiHistory({
    @Query('search') String? search,
    @Query('page') required int page,
    @Query('size') required int size,
    @Query('storeId') int? storeId,
    @Query('status') int? statusImei,
  });

  /// lấy lịch sử giao dịch của imei
  @GET('productEmeiStock/mobile/history')
  Future<BaseResponse> getImeiHistoryTransaction({
    @Query('imei') required String imei,
  });

  /// lấy lịch sử thu cũ của imei
  @GET('tradeIn/mobile')
  Future<BaseResponse> getImeiTradeinTransaction({
    @Query('imei') required String imei,
  });
}
