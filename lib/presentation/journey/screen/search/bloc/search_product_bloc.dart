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
  }

  FutureOr<void> _onChangeSearchType(
      ChangeSearchTypeEvent event, Emitter<SearchProductState> emit) async {
    emit(ChangeSearchTypeSuccess(state: state, searchType: event.searchType));
  }

  FutureOr<void> _onRefreshGetProducts(
      RefreshProductsEvent event, Emitter<SearchProductState> emit) async {
    try {
      emit(SearchLoading(state: state));

      final res = await _getProduct(
        page: 1,
        limit: state.pageInfo.getLimit,
        param: state.searchValue,
        type: state.searchType,
        searchAction: event.searchAction,
      );

      // await getStockOfProduct(products);

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
      emit(SearchLoading(state: state));

      final res = await _getProduct(
        page: 1,
        limit: state.pageInfo.getLimit,
        param: event.searchValue,
        type: state.searchType,
        searchAction: event.searchAction,
      );

      // await getStockOfProduct(products);

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
      final res = await _getProduct(
        page: nextPage,
        limit: state.pageInfo.getLimit,
        param: state.searchValue,
        type: state.searchType,
        searchAction: event.searchAction,
      );

      // await getStockOfProduct(res.items);

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
  Future<PaginatedResponse<ProductModel>> _getProduct({
    required int page,
    required int limit,
    required String param,
    required SearchType type,
    required SearchAction searchAction,
    int? storeId,
    bool isInterestZero = false,
  }) async {
    if (searchAction == SearchAction.addToCart) {
      final AuthBloc authBloc = getIt.get<AuthBloc>();
      final DraftingInvoiceBloc draftingInvoiceBloc =
          getIt.get<DraftingInvoiceBloc>();
      int? store = storeId ??
          draftingInvoiceBloc.state.currentStore?.getStoreId ??
          authBloc.state.getUserStoreId;

      final res = await productServices.productSearch(
        searchProduct: param,
        searchType: type,
        storeId: store,
        isInterestZero: isInterestZero,
      );

      return PaginatedResponse(
        items: res,
        totalItems: res.length,
        totalPages: 1,
        currentPage: 1,
      );
    } else {
      return await productServices.searchProduct(
        page: page,
        limit: limit,
        param: param,
        type: type.getValue,
      );
    }
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
