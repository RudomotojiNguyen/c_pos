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

  /// tìm sản phầm tồn kho
  ///
  @GET('v1/product-search')
  Future<BaseResponse> getProductInventory({
    @Query('page') required int page,
    @Query('size') required int size,
    @Query('searchText') String? searchText,
    @Query('storeId') int? storeId,
    @Query('inStock') bool? inStock,
  });

  /// Lấy danh sách SP tặng kèm(gift)
  ///
  @GET('v1/product-search/promotions')
  Future<BaseResponse> getGiftsProduct({
    @Query('productId') required String productId,
    @Query('productName') String? productName,
    @Query('imeiCode') String? imeiCode,
    @Query('storeId') int? storeId,
  });

  /// Lấy danh sách SP bán kèm(attach)
  ///
  @GET('v1/product-search/accessories')
  Future<BaseResponse> getAttachesProduct({
    @Query('productId') required String productId,
    @Query('productName') String? productName,
    @Query('imeiCode') String? imeiCode,
    @Query('storeId') int? storeId,
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

  /// search product for sale
  /// note: dành cho việc lên bill

  /// tìm sản phầm để bán
  ///
  @GET('v1/product-search/for-sale')
  Future<BaseResponse> getProductForSale({
    @Query('page') required int page,
    @Query('size') required int size,
    @Query('searchText') String? searchText,
    @Query('storeId') int? storeId,
  });

  /// tìm sản phầm để bán
  ///
  @GET('v1/product-search/by-imei-for-sale')
  Future<BaseResponse> getProductForSaleByImei({
    @Query('page') required int page,
    @Query('size') required int size,
    @Query('searchText') String? searchText,
    @Query('storeId') int? storeId,
  });

  /// tìm sản phẩm bán kèm
  @GET('v1/product-promotion/attach')
  Future<BaseResponse> getAttachesProductForSale({
    @Query('productId') required String productId,
    @Query('storeId') int? storeId,
  });

  /// tìm sản phẩm combo
  @GET('v1/flexible-combo/search')
  Future<BaseResponse> getComboProductForSale({
    @Query('page') required int page,
    @Query('size') required int size,
    @Query('searchText') String? searchText,
    @Query('storeId') int? storeId,
  });

  /// tìm sản phẩm con của combo
  @GET('v1/flexible-combo/search-product')
  Future<BaseResponse> getComboItemProductForSale({
    @Query('page') required int page,
    @Query('size') required int size,
    @Query('searchText') String? searchText,
    @Query('storeId') int? storeId,
    @Query('referenceType') int? referenceType,
    @Query('referenceId') String? referenceId,
  });

  /// sản phẩm gói bảo hành
  @GET('v1/product-promotion/warranty')
  Future<BaseResponse> getWarrantyProductForSale(
      {@Query('productId') required String productId});
}
