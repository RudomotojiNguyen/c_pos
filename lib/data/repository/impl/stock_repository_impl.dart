part of '../stock_repository.dart';

class StockRepositoryImpl extends StockRepository {
  final StockServices stockServices;

  StockRepositoryImpl({required this.stockServices});

  // @override
  // Future getInventoryInStock(
  //     {required int page,
  //     required int size,
  //     String? productName,
  //     bool? inStock,
  //     int? categoryId,
  //     int? productType}) {
  //   return stockServices.getInventoryInStock(
  //       page: page,
  //       size: size,
  //       productName: productName,
  //       inStock: inStock,
  //       categoryId: categoryId,
  //       productType: productType);
  // }

  @override
  Future<List<StockModel>> getStoreHasProductInStockById(String productId) {
    return stockServices.getStoreHasProductInStockById(productId);
  }
}
