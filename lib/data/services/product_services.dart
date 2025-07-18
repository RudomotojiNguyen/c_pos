import '../datasources/remote/product_api.dart';
import '../models/imei_history_model.dart';
import '../models/imei_transaction_model.dart';
import '../models/product_imei_model.dart';
import '../models/product_model.dart';
import '../models/response/paginated_response.dart';
import '../models/trade_in_transaction_model.dart';

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

  Future<ProductModel> getProductById({required String productId});

  Future<List<ProductModel>> getProductsWarranty({
    required String productId,
    required int page,
    required int pageSize,
    String? searchProduct,
  });

  Future<List<ProductModel>> getProductsAttach({
    required String productId,
    int? page,
    int? pageSize,
    String? searchProduct,
  });

  Future<List<ProductModel>> getPromotionProduct({
    required String productId,
    required int page,
    required int pageSize,
    String? searchProduct,
  });

  Future<List<ProductImeiModel>> getImei({int? limit, String? productId});

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
