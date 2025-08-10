import '../../common/enum/search_type.dart';
import '../datasources/remote/api_remote.dart';
import '../models/models.dart';

part 'impl/product_service_impl.dart';

abstract class ProductServices {
  Future<List<ProductModel>> getProducts({
    required int page,
    required int limit,
    int? categoryId,
    int? status,
    int? productType,
    int? brandId,
    String? parentProductId,
    String? childProductId,
    String? name,
  });

  Future<PaginatedResponse<ProductModel>> searchProduct({
    required int page,
    required int limit,
    int? type,
    String? param,
  });

  Future<List<ProductModel>> productSearch({
    String? searchProduct,
    bool isInterestZero = false,
    int? storeId,
    SearchType searchType = SearchType.product,
  });

  // Future<ProductModel> getProductById({required String productId});

  // Future<List<ProductModel>> getProductsWarranty({
  //   required String productId,
  //   required int page,
  //   required int pageSize,
  //   String? searchProduct,
  // });

  // Future<List<ProductModel>> getProductsAttach({
  //   required String productId,
  //   int? page,
  //   int? pageSize,
  //   String? searchProduct,
  // });

  // Future<List<ProductModel>> getPromotionProduct({
  //   required String productId,
  //   required int page,
  //   required int pageSize,
  //   String? searchProduct,
  // });

  Future<List<ProductModel>> getGiftsProduct({
    required String productId,
    String? productName,
    int? storeId,
    SearchType searchType = SearchType.product,
  });

  Future<List<ProductModel>> getAttachesProduct({
    required String productId,
    String? productName,
    int? storeId,
    SearchType searchType = SearchType.product,
  });

  Future<List<ProductImeiModel>> getImei({String? productId, int? storeId});

  Future<List<String>> getReasonSelectImei();

  Future<PaginatedResponse<ImeiHistoryModel>> getImeiHistory({
    required int page,
    required int limit,
    String? search,
    int? storeId,
    List<int>? statusImei,
    String? searchProduct,
  });

  Future<List<ImeiTransactionModel>> getImeiHistoryTransaction({
    required String imei,
    required int page,
    required int limit,
  });

  Future<List<TradeInTransactionModel>> getImeiTradeinTransaction({
    required String imei,
  });

  Future<List<ProductModel>> getProductInventory({
    required int page,
    required int size,
    String? productName,
    bool? inStock,
    int? categoryId,
    int? productType,
  });
}
