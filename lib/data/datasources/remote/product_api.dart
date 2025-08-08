import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/retrofit.dart';
import 'package:c_pos/data/models/models.dart';

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
  // @GET('product/mobile/v2/{productId}/product-attachs')
  // Future<BaseResponse> getProductAttached({
  //   @Path() required String productId,
  //   @Query('page') int? page,
  //   @Query('pageSize') int? pageSize,
  //   @Query('searchProduct') String? searchProduct,
  // });

  /// Lấy danh sách SP bán kèm(attach)
  ///
  // @GET('product/mobile/{productId}/product-promotions')
  // Future<BaseResponse> getProductPromotions({
  //   @Path() required String productId,
  //   @Query('page') required int page,
  //   @Query('pageSize') required int pageSize,
  //   @Query('searchProduct') String? searchProduct,
  // });

  /// Lấy danh sách SP gói bảo hành(warranty) của 1 SP cha
  ///
  // @GET('product/mobile/{productId}/product-warrantys')
  // Future<BaseResponse> getProductWarranties({
  //   @Path() required String productId,
  //   @Query('page') required int page,
  //   @Query('pageSize') required int pageSize,
  //   @Query('searchProduct') String? searchProduct,
  // });

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

  /// Lấy danh sách SP tặng kèm(gift)
  ///
  @GET('v1/product-search/promotions')
  Future<BaseResponse> getGiftsProduct({
    @Query('productId') required String productId,
    @Query('productName') required String productName,
  });

  /// Lấy danh sách SP bán kèm(attach)
  ///
  @GET('v1/product-search/accessories')
  Future<BaseResponse> getAttachesProduct({
    @Query('productId') required String productId,
    @Query('productName') required String productName,
  });

  /// tìm sản phẩm
  @GET('products')
  Future<BaseResponse> searchProduct({
    @Query('page') required int page,
    @Query('limit') required int limit,
    @Query('productType') int? type,
    @Query('name') String? name,
    @Query('storeId') int? storeId,
  });

  /// dành cho tìm sản phẩm để thêm vào đơn
  /// tìm sản phẩm theo imei
  @GET('productSearch')
  Future<BaseResponse> productSearch({
    @Query('isInterestZero') bool? isInterestZero,
    @Query('searchProduct') String? searchProduct,
    @Query('storeId') int? storeId,
  });

  /// tìm sản phẩm theo imei
  @GET('productSearch/search-by-imei')
  Future<BaseResponse> productSearchByImei({
    @Query('imeiCode') String? imeiCode,
    @Query('storeId') int? storeId,
  });

  ///
  ///
  // @GET('product/mobile/{productId}')
  // Future<BaseResponse> getProductById(@Path() String productId);

  /// Tìm sản phẩm cho sản phẩm combo
  ///
  // @GET('flexible-combo/search')
  // Future<BaseResponse> searchProductCombo({
  //   @Query('textSearch') String? textSearch,
  //   @Query('storeId') int? storeId,
  //   @Query('page') required int page,
  //   @Query('size') required int size,
  // });

  /// Tìm sản phẩm cho sản phẩm combo
  ///
  // @GET('flexible-combo/search-product')
  // Future<BaseResponse> searchProductInCombo({
  //   @Query('textSearch') String? textSearch,
  //   @Query('referenceType') int? referenceType,
  //   @Query('referenceId') int? referenceId,
  //   @Query('page') required int page,
  //   @Query('size') required int size,
  // });

  /// lấy barcode sp từ link
  ///
  // @GET('{link}')
  // @Headers(<String, dynamic>{
  //   'Content-Type': 'application/json',
  //   'isUseBaseUrl': false,
  // })
  // Future<BaseResponse> getProductBarcode(@Path() String link);

  /// lấy thông tin giảm giá cho danh sách SP hiện tại
  /// params: {
  ///            productIds: List<int>,
  ///            customerPhone: String,
  ///            billNumber: int,
  ///          };
  // @POST('customer/discount')
  // Future<BaseResponse> getProductDiscountInfoByCustomer(
  //     @Body() Map<String, dynamic> params);

  /// lấy imeis
  @GET('imeis/get-by-product')
  Future<BaseResponse> getImei({
    @Query('productId') String? productId,
    @Query('storeId') int? storeId,
  });

  /// lấy danh sách lý chọn imei khác chứ không chọn FIFO
  @GET('product/select-imei-reason')
  Future<BaseResponse> getReasonSelectImei();

  /// tìm imei sản phẩm để kiểm tra lịch sử giao dịch của nó
  @GET('imeis')
  Future<BaseResponse> getImeiHistory({
    @Query('page') required int page,
    @Query('limit') required int limit,
    @Query('search') String? search, // imeiNo
    @Query('searchProduct') String? searchProduct, // product name
    @Query('storeId') int? storeId,
    @Query('status') List<int>? statusImei,
  });

  /// lấy lịch sử giao dịch của imei
  @GET('v1/imei-histories')
  Future<BaseResponse> getImeiHistoryTransaction({
    @Query('searchIMEI') required String imei,
    @Query('page') required int page,
    @Query('limit') required int limit,
  });

  /// lấy lịch sử thu cũ của imei
  @GET('tradeIn/mobile')
  Future<BaseResponse> getImeiTradeinTransaction({
    @Query('imei') required String imei,
  });
}
