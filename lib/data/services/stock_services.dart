import '../datasources/remote/stock_api.dart';
import '../models/stock_model.dart';

part 'impl/stock_services_impl.dart';

abstract class StockServices {
  // Future<dynamic> getInventoryInStock({
  //   required int page,
  //   required int size,
  //   String? productName,
  //   bool? inStock,
  //   int? categoryId,
  //   int? productType,
  // });

  Future<List<StockModel>> getStoreHasProductInStockById(String productId);
}
