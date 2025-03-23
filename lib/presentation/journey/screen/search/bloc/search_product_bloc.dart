import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:c_pos/presentation/mixins/logger_helper.dart';
import 'package:equatable/equatable.dart';

import '../../../../../common/enum/enum.dart';
import '../../../../../data/models/product_model.dart';
import '../../../../../data/models/response/base_response.dart';
import '../../../../../data/repository/product_repository.dart';
import '../../../../../data/repository/stock_repository.dart';

part 'search_product_event.dart';
part 'search_product_state.dart';

class SearchProductBloc extends Bloc<SearchProductEvent, SearchProductState> {
  final ProductRepository productRepository;
  final StockRepository stockRepository;

  final LoggerHelper _loggerHelper = LoggerHelper();

  SearchProductBloc({
    required this.productRepository,
    required this.stockRepository,
  }) : super(SearchProductInitial(
          searchValue: '',
          searchType: SearchType.productName,
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
  }

  FutureOr<void> _onChangeSearchType(
      ChangeSearchTypeEvent event, Emitter<SearchProductState> emit) async {
    emit(ChangeSearchTypeSuccess(state: state, searchType: event.searchType));
  }

  FutureOr<void> _onRefreshGetProducts(
      RefreshProductsEvent event, Emitter<SearchProductState> emit) async {
    try {
      emit(SearchLoading(state: state));

      List<ProductModel> products = await _getProduct(
        page: 1,
        limit: state.pageInfo.getLimit,
        param: state.searchValue,
        type: state.searchType,
      );

      // await getStockOfProduct(products);

      List<ProductModel> currentProducts = [];
      currentProducts.addAll(products);

      emit(GetProductsSuccess(
        state: state,
        products: currentProducts,
        pageInfo: state.pageInfo.copyWith(
          page: 1,
          canLoadMore: products.length >= state.pageInfo.getLimit,
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
      emit(SearchLoading(state: state));

      List<ProductModel> products = await _getProduct(
        page: 1,
        limit: state.pageInfo.getLimit,
        param: event.searchValue,
        type: state.searchType,
      );

      await getStockOfProduct(products);

      List<ProductModel> currentProducts = [];
      currentProducts.addAll(products);

      emit(GetProductsSuccess(
        state: state,
        products: currentProducts,
        searchText: event.searchValue,
        pageInfo: state.pageInfo.copyWith(
          page: 1,
          canLoadMore: products.length >= state.pageInfo.getLimit,
        ),
      ));
    } catch (e) {
      _loggerHelper.logError(message: 'OnSearchProductsEvent', obj: e);
    }
  }

  FutureOr<void> _onLoadMoreProducts(
      LoadMoreProductsEvent event, Emitter<SearchProductState> emit) async {
    try {
      if (!state.pageInfo.checkCanLoadMore) {
        return;
      }
      int nextPage = state.pageInfo.getPage + 1;
      emit(UpdateIsLoadMore(state: state));
      List<ProductModel> products = await _getProduct(
        page: nextPage,
        limit: state.pageInfo.getLimit,
        param: state.searchValue,
        type: state.searchType,
      );

      await getStockOfProduct(products);

      List<ProductModel> currentProducts = state.products;
      currentProducts.addAll(products);

      emit(GetProductsSuccess(
        state: state,
        products: currentProducts,
        pageInfo: state.pageInfo.copyWith(
          page: nextPage,
          canLoadMore: products.length >= state.pageInfo.getLimit,
        ),
        searchText: null,
      ));
    } catch (e) {
      _loggerHelper.logError(message: 'LoadMoreProductsEvent', obj: e);
    }
  }
}

extension SearchProductBlocExtension on SearchProductBloc {
  Future _getProduct({
    required int page,
    required int limit,
    required String param,
    required SearchType type,
  }) async {
    return await productRepository.searchProduct(
      page: page,
      limit: limit,
      param: param,
      type: type.getValue,
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
