part of '../product_services.dart';

class ProductServicesImpl implements ProductServices {
  final ProductApi productApi;

  ProductServicesImpl({required this.productApi});

  @override
  Future<List<ProductModel>> getProducts(
      {required int page,
      required int limit,
      int? categoryId,
      int? status,
      int? productType,
      int? brandId,
      String? parentProductId,
      String? childProductId,
      String? name}) async {
    List<ProductModel> data = [];
    final res = await productApi.getProducts(
      page: page,
      limit: limit,
      categoryId: categoryId,
      status: status,
      productType: productType,
      brandId: brandId,
      parentProductId: parentProductId,
      childProductId: childProductId,
      name: name,
    );

    for (var item in (res.data['list_product'])) {
      data.add(ProductModel.fromJson(item));
    }

    return data;
  }

  @override
  Future<List<ProductModel>> searchProduct(
      {required int page, required int limit, int? type, String? param}) async {
    List<ProductModel> data = [];
    final res = await productApi.searchProduct(
      page: page,
      size: limit,
      param: param,
      type: type,
    );

    for (var item in res.data) {
      data.add(ProductModel.fromJson(item));
    }

    return data;
  }

  @override
  Future<ProductModel> getProductById({required String productId}) {
    return productApi
        .getProductById(productId)
        .then((value) => ProductModel.fromJson(value.data));
  }

  @override
  Future<List<ProductModel>> getProductsAttach(
      {required String productId,
      int? page,
      int? pageSize,
      String? searchProduct}) {
    return productApi
        .getProductAttached(
            productId: productId,
            page: page,
            pageSize: pageSize,
            searchProduct: searchProduct)
        .then(
      (value) {
        List<ProductModel> data = [];
        List<dynamic> products = [];

        if (value.data is Map<String, dynamic>) {
          if (value.data.containsKey('result')) {
            products = value.data['result'];
          }
        } else {
          products = value.data;
        }

        for (var product in products) {
          data.add(ProductModel.fromJson(product));
        }

        return data;
      },
    );
  }

  @override
  Future<List<ProductModel>> getProductsWarranty(
      {required String productId,
      required int page,
      required int pageSize,
      String? searchProduct}) {
    return productApi
        .getProductWarranties(
            productId: productId,
            page: page,
            pageSize: pageSize,
            searchProduct: searchProduct)
        .then(
      (value) {
        List<ProductModel> data = [];
        List<dynamic> products = [];

        if (value.data is Map<String, dynamic>) {
          if (value.data.containsKey('result')) {
            products = value.data['result'];
          }
        } else {
          products = value.data;
        }

        for (var product in products) {
          data.add(ProductModel.fromJson(product));
        }

        return data;
      },
    );
  }

  @override
  Future<List<ProductModel>> getPromotionProduct(
      {required String productId,
      required int page,
      required int pageSize,
      String? searchProduct}) {
    return productApi
        .getProductPromotions(
            productId: productId,
            page: page,
            pageSize: pageSize,
            searchProduct: searchProduct)
        .then(
      (value) {
        List<ProductModel> data = [];
        List<dynamic> products = [];

        if (value.data is Map<String, dynamic>) {
          if (value.data.containsKey('result')) {
            products = value.data['result'];
          }
        } else {
          products = value.data;
        }

        for (var product in products) {
          data.add(ProductModel.fromJson(product));
        }

        return data;
      },
    );
  }

  @override
  Future<Map<String, ProductDiscountModel?>> getProductDiscountInfoByCustomer(
      Map<String, dynamic> params) {
    return productApi.getProductDiscountInfoByCustomer(params).then(
      (value) {
        Map<String, ProductDiscountModel?> data = {};

        for (var product in value.data) {
          data.putIfAbsent(
              product['id'], () => ProductDiscountModel.fromJson(product));
        }

        return data;
      },
    );
  }

  @override
  Future<List<ProductImeiModel>> getImei(
      {int? limit, String? productId}) async {
    return productApi.getImei(limit: limit, productId: productId).then(
      (value) {
        List<ProductImeiModel> data = [];

        for (var imei in value.data) {
          data.add(ProductImeiModel.fromJson(imei));
        }

        return data;
      },
    );
  }

  @override
  Future<List<String>> getReasonSelectImei() async {
    return productApi.getReasonSelectImei().then((value) {
      List<String> data = [];

      for (var reason in (value.data ?? [])) {
        data.add(reason.toString());
      }

      return data;
    });
  }

  @override
  Future<PaginatedResponse<ImeiHistoryModel>> getImeiHistory({
    required int page,
    required int limit,
    String? search,
    int? storeId,
    List<int>? statusImei,
    String? searchProduct,
  }) async {
    final res = await productApi.getImeiHistory(
      page: page,
      limit: limit,
      search: search,
      statusImei: statusImei,
      storeId: storeId,
      searchProduct: searchProduct,
    );

    return PaginatedResponse.fromJson(
      res.data,
      (json) => ImeiHistoryModel.fromJson(json),
      itemsKey: 'list_imei',
    );
  }

  @override
  Future<List<ImeiTransactionModel>> getImeiHistoryTransaction(
      {required String imei}) {
    return productApi.getImeiHistoryTransaction(imei: imei).then(
      (value) {
        List<ImeiTransactionModel> data = [];

        for (var transaction in value.getListData) {
          data.add(ImeiTransactionModel.fromJson(transaction));
        }

        return data;
      },
    );
  }

  @override
  Future<List<TradeInTransactionModel>> getImeiTradeinTransaction(
      {required String imei}) {
    return productApi.getImeiTradeinTransaction(imei: imei).then(
      (value) {
        List<TradeInTransactionModel> data = [];

        for (var transaction in value.getListData) {
          data.add(TradeInTransactionModel.fromJson(transaction));
        }

        return data;
      },
    );
  }

  @override
  Future<List<ProductModel>> getProductInventory(
      {required int page,
      required int size,
      String? productName,
      bool? inStock,
      int? categoryId,
      int? productType}) async {
    List<ProductModel> data = [];
    final res = await productApi.getProductInventory(
      page: page,
      size: size,
      productName: productName,
      inStock: inStock,
      categoryId: categoryId,
      productType: productType,
    );

    for (var item in res.data) {
      data.add(ProductModel.fromJson(item));
    }

    return data;
  }
}
