part of '../stock_services.dart';

class StockServicesImpl implements StockServices {
  final StockApi stockApi;

  StockServicesImpl({required this.stockApi});

  @override
  Future<List<StockModel>> getStoreHasProductInStockById(String productId) {
    return stockApi.getStoreHasProductInStockById(productId).then(
      (value) {
        List<StockModel> data = [];

        for (var item in value.data) {
          data.add(StockModel.fromJson(item));
        }

        return data;
      },
    );
  }
}
