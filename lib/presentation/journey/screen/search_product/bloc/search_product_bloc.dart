import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:c_pos/presentation/journey/screen/login/bloc/auth_bloc.dart';
import 'package:c_pos/presentation/mixins/logger_helper.dart';
import 'package:equatable/equatable.dart';

import '../../../../../common/di/injection/injection.dart';
import '../../../../../common/enum/enum.dart';
import 'package:c_pos/data/models/models.dart';
import '../../../../../data/services/services.dart';
import '../../drafting_invoice/detail/bloc/drafting_invoice_bloc.dart';

part 'search_product_event.dart';
part 'search_product_state.dart';

enum SearchAction {
  search,
  addToCart,
}

class SearchProductBloc extends Bloc<SearchProductEvent, SearchProductState> {
  final ProductServices productServices;

  final LoggerHelper _loggerHelper = LoggerHelper();
  final AuthBloc authBloc = getIt.get<AuthBloc>();
  final DraftingInvoiceBloc draftingInvoiceBloc =
      getIt.get<DraftingInvoiceBloc>();

  SearchProductBloc({
    required this.productServices,
  }) : super(SearchProductInitial(
          searchValue: '',
          searchType: SearchType.product,
          products: const [],
          pageInfo: PageInfoEntity(
            limit: 10,
            page: 1,
          ),
        )) {
    /// thay đổi loại tìm kiếm
    on<ChangeSearchTypeEvent>(_onChangeSearchType);

    /// refresh danh sách
    on<RefreshProductsEvent>(_onRefreshGetProducts);

    /// nhập tìm sản phẩm
    on<OnSearchProductsEvent>(_onSearchProducts);

    /// lấy thêm thông tin sản phẩm
    on<LoadMoreProductsEvent>(_onLoadMoreProducts);

    /// tìm kiếm sản phẩm bảo hành
    on<SearchWarrantyProductsEvent>(_onSearchWarrantyProducts);
  }

  FutureOr<void> _onSearchWarrantyProducts(SearchWarrantyProductsEvent event,
      Emitter<SearchProductState> emit) async {
    try {
      emit(SearchLoading(state: state));
      List<ProductModel> productsWarranty = await productServices
          .getWarrantyProductForSale(productId: event.parentProductId ?? '');
      emit(GetWarrantyProductsSuccess(
        state: state,
        productsWarranty: productsWarranty,
      ));
    } catch (e) {
      _loggerHelper.logError(message: 'SearchWarrantyProductsEvent', obj: e);
      emit(GetWarrantyProductsSuccess(
        state: state,
        productsWarranty: const [],
      ));
    }
  }

  FutureOr<void> _onChangeSearchType(
      ChangeSearchTypeEvent event, Emitter<SearchProductState> emit) async {
    emit(ChangeSearchTypeSuccess(state: state, searchType: event.searchType));
  }

  FutureOr<void> _onRefreshGetProducts(
      RefreshProductsEvent event, Emitter<SearchProductState> emit) async {
    try {
      emit(SearchLoading(state: state));

      PaginatedResponse<ProductModel>? res = await _getProducts(
        page: 1,
        limit: state.pageInfo.getLimit,
        param: state.searchValue,
        type: state.searchType,
        searchAction: event.searchAction,
        productType: event.productType,
        productId: event.parentProductId,
        cartType: event.cartType,
        referenceId: event.referenceId,
      );

      if (res == null) {
        emit(GetProductsSuccess(
          state: state,
          products: state.products,
          pageInfo: state.pageInfo.copyWith(
            page: 1,
            hasNextPage: state.products.length >= state.pageInfo.getLimit,
            itemCount: state.products.length,
            pageCount: 1,
          ),
          searchText: null,
        ));
        return;
      }

      List<ProductModel> currentProducts = [];
      currentProducts.addAll(res.items);

      emit(GetProductsSuccess(
        state: state,
        products: currentProducts,
        pageInfo: state.pageInfo.copyWith(
          page: 1,
          hasNextPage: res.items.length >= state.pageInfo.getLimit,
          itemCount: res.totalItems,
          pageCount: res.totalPages,
        ),
        searchText: null,
      ));
    } catch (e) {
      _loggerHelper.logError(message: 'RefreshProductsEvent', obj: e);
    }
  }

  FutureOr<void> _onSearchProducts(
      OnSearchProductsEvent event, Emitter<SearchProductState> emit) async {
    try {
      if (state is SearchLoading) {
        return;
      }
      emit(SearchLoading(state: state));

      PaginatedResponse<ProductModel>? res = await _getProducts(
        page: 1,
        limit: state.pageInfo.getLimit,
        param: event.searchValue,
        type: state.searchType,
        searchAction: event.searchAction,
        productType: event.productType,
        productId: event.parentProductId,
        cartType: event.cartType,
        referenceId: event.referenceId,
      );

      if (res == null) {
        emit(GetProductsSuccess(
          state: state,
          products: state.products,
          pageInfo: state.pageInfo.copyWith(
            page: 1,
            hasNextPage: state.products.length >= state.pageInfo.getLimit,
            itemCount: state.products.length,
            pageCount: 1,
          ),
          searchText: null,
        ));
        return;
      }

      List<ProductModel> currentProducts = [];
      currentProducts.addAll(res.items);

      emit(GetProductsSuccess(
        state: state,
        products: currentProducts,
        searchText: event.searchValue,
        pageInfo: state.pageInfo.copyWith(
          page: 1,
          hasNextPage: res.items.length >= state.pageInfo.getLimit,
          itemCount: res.totalItems,
          pageCount: res.totalPages,
        ),
      ));
    } catch (e) {
      _loggerHelper.logError(message: 'OnSearchProductsEvent', obj: e);
      emit(GetProductsSuccess(
        state: state,
        products: state.products,
        pageInfo: state.pageInfo,
        searchText: event.searchValue,
      ));
    }
  }

  FutureOr<void> _onLoadMoreProducts(
      LoadMoreProductsEvent event, Emitter<SearchProductState> emit) async {
    try {
      if (!state.pageInfo.checkCanLoadMore) {
        return;
      }
      List<ProductModel> currentProducts = state.products;
      int nextPage = state.pageInfo.getNextPage;
      emit(UpdateIsLoadMore(state: state));

      PaginatedResponse<ProductModel>? res = await _getProducts(
        page: nextPage,
        limit: state.pageInfo.getLimit,
        param: state.searchValue,
        type: state.searchType,
        searchAction: event.searchAction,
        productType: event.productType,
        productId: event.parentProductId,
        cartType: event.cartType,
        referenceId: event.referenceId,
      );

      if (res == null) {
        emit(GetProductsSuccess(
          state: state,
          products: state.products,
          pageInfo: state.pageInfo,
          searchText: null,
        ));
        return;
      }

      currentProducts.addAll(res.items);

      emit(GetProductsSuccess(
        state: state,
        products: currentProducts,
        pageInfo: state.pageInfo.copyWith(
          page: nextPage,
          hasNextPage: res.items.length >= state.pageInfo.getLimit,
          itemCount: res.totalItems,
          pageCount: res.totalPages,
        ),
        searchText: null,
      ));
    } catch (e) {
      _loggerHelper.logError(message: 'LoadMoreProductsEvent', obj: e);
    }
  }
}

extension SearchProductBlocExtension on SearchProductBloc {
  Future<PaginatedResponse<ProductModel>> getProducts({
    String? param,
    required int page,
    required int limit,
    required SearchType type,
  }) async {
    return await productServices.searchProduct(
      page: page,
      limit: limit,
      param: param ?? '',
      type: type.getValue,
    );
  }

  Future<PaginatedResponse<ProductModel>?> _getProducts({
    required int page,
    required int limit,
    required String param,
    required SearchType type,
    required SearchAction searchAction,
    int? storeId,
    bool isInterestZero = false,
    XItemType? productType,
    String? productId,
    CartType? cartType,
    String? referenceId,
  }) async {
    int? store = storeId ??
        draftingInvoiceBloc.state.currentStore?.getStoreId ??
        authBloc.state.getUserStoreId;

    if (searchAction != SearchAction.addToCart) {
      return await productServices.searchProduct(
        page: page,
        limit: limit,
        param: param,
        type: type.getValue,
      );
    }
    if ({CartType.retail, CartType.updateBill}.contains(cartType)) {
      return await _getProductForSale(
        page: page,
        limit: limit,
        param: param,
        type: type,
        searchAction: searchAction,
        productType: productType,
        productId: productId,
        storeId: store,
        referenceId: referenceId,
      );
    }
    if ({CartType.order, CartType.updateOrder}.contains(cartType)) {
      return await _getProduct(
        page: page,
        limit: limit,
        param: param,
        type: type,
        searchAction: searchAction,
        productType: productType,
        productId: productId,
        storeId: store,
        referenceId: referenceId,
      );
    }

    return null;
  }

  Future<PaginatedResponse<ProductModel>> _getProduct({
    required int page,
    required int limit,
    required String param,
    required SearchType type,
    required SearchAction searchAction,
    int? storeId,
    bool isInterestZero = false,
    XItemType? productType,
    String? productId,
    String? referenceId,
  }) async {
    List<ProductModel> res = [];

    if (productType == XItemType.gift) {
      res = await productServices.getGiftsProduct(
        productId: productId ?? '',
        productName: param,
        storeId: storeId,
        searchType: type,
      );
    } else if (productType == XItemType.attach) {
      res = await productServices.getAttachesProduct(
        productId: productId ?? '',
        productName: param,
        storeId: storeId,
        searchType: type,
      );
    } else {
      res = await productServices.productSearch(
        searchProduct: param,
        searchType: type,
        storeId: storeId,
        isInterestZero: isInterestZero,
      );
    }

    return PaginatedResponse(
      items: res,
      totalItems: res.length,
      totalPages: 1,
      currentPage: 1,
    );
  }

  Future<PaginatedResponse<ProductModel>> _getProductForSale({
    required int page,
    required int limit,
    required String param,
    required SearchType type,
    required SearchAction searchAction,
    int? storeId,
    bool isInterestZero = false,
    XItemType? productType,
    String? productId,
    String? referenceId,
  }) async {
    List<ProductModel> res = [];

    if (productType == XItemType.gift) {
      res = await productServices.productSearch(
        searchProduct: param,
        storeId: storeId,
      );
    } else if (productType == XItemType.attach) {
      res = await productServices.getAttachesProductForSale(
        productId: productId ?? '',
        storeId: storeId,
      );
    } else {
      res = await productServices.getProductForSale(
        searchText: param,
        page: page,
        size: limit,
        storeId: storeId,
        searchType: type,
        referenceId: referenceId,
      );
    }

    return PaginatedResponse(
      items: res,
      totalItems: res.length,
      totalPages: 1,
      currentPage: 1,
    );
  }

  Future getStockOfProduct(List<ProductModel> products) async {
    // // Tạo một danh sách các Future để gọi API song song
    // List<Future> stockFutures = products.map((product) async {
    //   // Gọi API để lấy stock
    //   List<StockModel> stock =
    //       await stockRepository.getStoreHasProductInStockById(product.id!);
    //   // Gán stock vào product
    //   product.stocks =
    //       stock.where((stock) => stock.getInStockQuantity > 0).toList();
    //   return product;
    // }).toList();

    // // Đợi tất cả các Future hoàn thành
    // await Future.wait(stockFutures);

    return products;
  }
}
