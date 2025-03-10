import '../models/stock_model.dart';
import '../services/stock_services.dart';

part 'impl/stock_repository_impl.dart';

abstract class StockRepository {
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
