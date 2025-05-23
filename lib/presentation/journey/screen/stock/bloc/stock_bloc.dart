import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../common/enum/enum.dart';
import '../../../../../data/models/category_model.dart';
import '../../../../../data/models/filter/filter_product_stock_model.dart';
import '../../../../../data/models/product_model.dart';
import '../../../../../data/models/response/page_info_entity.dart';
import '../../../../../data/models/stock_model.dart';
import '../../../../../data/repository/product_repository.dart';
import '../../../../../data/repository/stock_repository.dart';
import '../../../../mixins/logger_helper.dart';

part 'stock_event.dart';
part 'stock_state.dart';

class StockBloc extends Bloc<StockEvent, StockState> {
  final StockRepository stockRepository;
  final ProductRepository productRepository;
  final LoggerHelper _loggerHelper = LoggerHelper();

  StockBloc({
    required this.stockRepository,
    required this.productRepository,
  }) : super(StockInitial(
          productStocks: const [],
          products: const [],
          pageInfo: PageInfoEntity(),
          productStockFilter: const FilterProductStockModel(),
        )) {
    on<GetStockOfProductEvent>(_onGetStockOfProduct);
    on<UpdateFilterEvent>(_onUpdateFilter);
    on<SetDefaultFilterEvent>(_onSetDefaultFilter);
    on<GetProductsEvent>(_onGetProducts);
    on<GetMoreProductsEvent>(_onGetMoreProducts);
  }

  FutureOr<void> _onGetStockOfProduct(
      GetStockOfProductEvent event, Emitter<StockState> emit) async {
    try {
      emit(StockIsLoading(state: state));
      final res =
          await stockRepository.getStoreHasProductInStockById(event.productId);
      List<StockModel> stores =
          res.where((e) => e.getInStockQuantity > 0).toList();
      emit(GetStockOfProductSuccess(state: state, productStocks: stores));
    } catch (e) {
      _loggerHelper.logError(message: 'GetStockOfProductEvent', obj: e);
    }
  }

  FutureOr<void> _onUpdateFilter(
      UpdateFilterEvent event, Emitter<StockState> emit) async {
    try {
      emit(UpdateFilterSuccess(
          state: state,
          productStockFilter: state.productStockFilter.copyWith(
            cateSelected: event.cateSelected,
            isInStock: event.isInStock,
            searchType: event.searchType,
            searchValue: event.searchValue,
          )));
    } catch (e) {
      _loggerHelper.logError(message: 'UpdateFilterEvent', obj: e);
    }
  }

  FutureOr<void> _onSetDefaultFilter(
      SetDefaultFilterEvent event, Emitter<StockState> emit) async {
    try {
      emit(UpdateFilterSuccess(
        state: state,
        productStockFilter: const FilterProductStockModel(),
      ));
    } catch (e) {
      _loggerHelper.logError(message: 'SetDefaultFilterEvent', obj: e);
    }
  }

  FutureOr<void> _onGetProducts(
      GetProductsEvent event, Emitter<StockState> emit) async {
    try {
      emit(StockIsLoading(state: state));

      final res = await productRepository.getProductInventory(
        page: 1,
        size: state.pageInfo.getLimit,
        categoryId: state.productStockFilter.cateSelected?.id,
        inStock: state.productStockFilter.isInStock,
        productName: state.productStockFilter.searchValue,
        productType: state.productStockFilter.getProductTypeValue,
      );

      emit(GetProductsSuccess(
        state: state,
        products: res,
        pageInfo: state.pageInfo.copyWith(
          page: 1,
          itemCount: res.length,
        ),
      ));
    } catch (e) {
      _loggerHelper.logError(message: 'GetProductsEvent', obj: e);
    }
  }

  FutureOr<void> _onGetMoreProducts(
      GetMoreProductsEvent event, Emitter<StockState> emit) async {
    try {
      if (!state.pageInfo.checkCanLoadMore || state is StockIsLoadMore) {
        return;
      }

      emit(StockIsLoadMore(state: state));

      final int page = state.pageInfo.getNextPage;
      final List<ProductModel> products = state.products;

      final res = await productRepository.getProductInventory(
        page: page,
        size: state.pageInfo.getLimit,
        categoryId: state.productStockFilter.cateSelected?.id,
        inStock: state.productStockFilter.isInStock,
        productName: state.productStockFilter.searchValue,
        productType: state.productStockFilter.getProductTypeValue,
      );

      products.addAll(res);

      emit(GetProductsSuccess(
        state: state,
        products: products,
        pageInfo: state.pageInfo.copyWith(
          page: page,
          itemCount: res.length,
        ),
      ));
    } catch (e) {
      _loggerHelper.logError(message: 'GetMoreProductsEvent', obj: e);
    }
  }
}
