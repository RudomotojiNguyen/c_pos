part of '../product_repository.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductServices productServices;

  ProductRepositoryImpl({required this.productServices});

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
      String? name}) {
    return productServices.getProducts(
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
  }

  @override
  Future<PaginatedResponse<ProductModel>> searchProduct(
      {required int page, required int limit, int? type, String? param}) {
    return productServices.searchProduct(
        limit: limit, page: page, param: param, type: type);
  }

  @override
  Future<ProductModel> getProductById({required String productId}) {
    return productServices.getProductById(productId: productId);
  }

  @override
  Future<List<ProductModel>> getProductsAttach(
      {required String productId,
      int? page,
      int? pageSize,
      String? searchProduct}) {
    return productServices.getProductsAttach(
      productId: productId,
      page: page,
      pageSize: pageSize,
      searchProduct: searchProduct,
    );
  }

  @override
  Future<List<ProductModel>> getProductsWarranty(
      {required String productId,
      required int page,
      required int pageSize,
      String? searchProduct}) {
    return productServices.getProductsWarranty(
        productId: productId,
        page: page,
        pageSize: pageSize,
        searchProduct: searchProduct);
  }

  @override
  Future<List<ProductModel>> getPromotionProduct(
      {required String productId,
      required int page,
      required int pageSize,
      String? searchProduct}) {
    return productServices.getPromotionProduct(
        productId: productId,
        page: page,
        pageSize: pageSize,
        searchProduct: searchProduct);
  }

  // @override
  // Future<Map<String, ProductDiscountModel?>> getProductDiscountInfoByCustomer(
  //     {required List<ProductTable> products,
  //     required String customerPhone,
  //     int? billNumber}) {
  //   Map<String, dynamic> data = {
  //     'productIds': products.getUnitProductIds,
  //     'customerPhone': customerPhone,
  //     'billNumber': billNumber,
  //   };
  //   return productServices.getProductDiscountInfoByCustomer(data);
  // }

  @override
  Future<List<ProductImeiModel>> getImei({int? limit, String? productId}) {
    return productServices.getImei(limit: limit, productId: productId);
  }

  @override
  Future<List<String>> getReasonSelectImei() {
    return productServices.getReasonSelectImei();
  }

  @override
  Future<PaginatedResponse<ImeiHistoryModel>> getImeiHistory({
    required int page,
    required int limit,
    String? search,
    int? storeId,
    List<int>? statusImei,
    String? searchProduct,
  }) {
    return productServices.getImeiHistory(
      page: page,
      limit: limit,
      search: search,
      statusImei: statusImei,
      storeId: storeId,
      searchProduct: searchProduct,
    );
  }

  @override
  Future<List<ImeiTransactionModel>> getImeiHistoryTransaction({
    required String imei,
    required int page,
    required int limit,
  }) {
    return productServices.getImeiHistoryTransaction(
      imei: imei,
      page: page,
      limit: limit,
    );
  }

  @override
  Future<List<TradeInTransactionModel>> getImeiTradeinTransaction(
      {required String imei}) {
    return productServices.getImeiTradeinTransaction(imei: imei);
  }

  @override
  Future<List<ProductModel>> getProductInventory(
      {required int page,
      required int size,
      String? productName,
      bool? inStock,
      int? categoryId,
      int? productType}) {
    return productServices.getProductInventory(
      page: page,
      size: size,
      productName: productName,
      inStock: inStock,
      categoryId: categoryId,
      productType: productType,
    );
  }
}
