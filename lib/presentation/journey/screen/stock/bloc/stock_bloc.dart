import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../common/enum/enum.dart';
import 'package:c_pos/data/models/models.dart';
import '../../../../../data/services/services.dart';
import '../../../../mixins/logger_helper.dart';

part 'stock_event.dart';
part 'stock_state.dart';

class StockBloc extends Bloc<StockEvent, StockState> {
  final StockServices stockServices;
  final ProductServices productServices;
  final LoggerHelper _loggerHelper = LoggerHelper();

  StockBloc({
    required this.stockServices,
    required this.productServices,
  }) : super(StockInitial(
          productStocks: const [],
          products: const [],
          pageInfo: PageInfoEntity(),
          productStockFilter: const FilterProductStockModel(),
        )) {
    /// lấy danh sách chi nhánh có sản phẩm trong kho
    on<GetStockOfProductEvent>(_onGetStockOfProduct);

    /// cập nhật bộ filter
    on<UpdateFilterEvent>(_onUpdateFilter);

    /// đặt lại bộ filter
    on<SetDefaultFilterEvent>(_onSetDefaultFilter);

    /// lấy danh sách sản phẩm
    on<GetProductsEvent>(_onGetProducts);

    /// lấy thêm danh sách sản phẩm
    on<GetMoreProductsEvent>(_onGetMoreProducts);
  }

  FutureOr<void> _onGetStockOfProduct(
      GetStockOfProductEvent event, Emitter<StockState> emit) async {
    try {
      emit(StockIsLoading(state: state));
      final res =
          await stockServices.getStoreHasProductInStockById(event.productId);
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
            storeId: event.storeId,
          )));
      add(GetProductsEvent());
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

      final res = await productServices.getProductInventory(
        page: 1,
        size: state.pageInfo.getLimit,
        searchText: state.productStockFilter.searchValue,
        inStock: state.productStockFilter.isInStock,
        storeId: state.productStockFilter.getStoreId,
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
      emit(GetProductsSuccess(
        state: state,
        products: const [],
        pageInfo: state.pageInfo,
      ));
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

      final res = await productServices.getProductInventory(
        page: page,
        size: state.pageInfo.getLimit,
        searchText: state.productStockFilter.searchValue,
        inStock: state.productStockFilter.isInStock,
        storeId: state.productStockFilter.getStoreId,
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
