import 'dart:async';

import 'package:c_pos/common/extensions/extension.dart';
import 'package:c_pos/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../../../../common/constants/app_constants.dart';
import '../../../../../../common/di/injection/injection.dart';
import '../../../../../../common/enum/enum.dart';
import '../../../../../../data/models/models.dart';
import '../../../search_product/bloc/search_product_bloc.dart';
import 'search_product_dialog.dart';

class FilterProductDialog extends StatefulWidget {
  const FilterProductDialog({
    super.key,
    this.parentProductId,
    this.productType,
    this.cartType = CartType.retail,
    this.referenceId,
    this.isNeedInStock = false,
  });

  /// xem có cần check sản phẩm còn hàng mới cho ấn không
  final bool isNeedInStock;

  /// id sản phẩm trước đó
  /// chỗ này sẽ dành cho bán kèm hoặc quà tặng
  final String? parentProductId;

  /// loại cần tìm kiếm
  final XItemType? productType;

  /// loại đơn hàng
  final CartType cartType;

  /// id sản phẩm con trong sản phẩm combo
  /// dành cho phần tìm sản phẩm con của sản phẩm combo
  final String? referenceId;

  @override
  State<FilterProductDialog> createState() => _FilterProductDialogState();
}

class _FilterProductDialogState extends State<FilterProductDialog> {
  List<ProductModel> _products = [];
  final StreamController<List<ProductModel>> _filterProducts =
      StreamController.broadcast();

  final SearchProductBloc _searchProductBloc = getIt.get<SearchProductBloc>();
  final RefreshController _refreshController = RefreshController(
    initialRefresh: false,
  );
  final TextEditingController _searchController = TextEditingController();
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _onRefreshProducts();
  }

  @override
  void dispose() {
    _filterProducts.close();
    _refreshController.dispose();
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SearchProductBloc, SearchProductState>(
      bloc: _searchProductBloc,
      listener: (context, state) {
        if (state is GetProductsSuccess) {
          _products = state.products;
          _filterProducts.add(_products);
        }
      },
      child: Column(
        children: [
          const HeaderDialog(title: 'Tìm kiếm sản phẩm'),
          Expanded(child: _renderProductList()),
          _renderSearchBox(),
        ],
      ),
    );
  }

  Widget _renderProductList() {
    return StreamBuilder<List<ProductModel>>(
      stream: _filterProducts.stream,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final products = snapshot.data!;

          if (products.isNotEmpty) {
            return SmartRefresher(
              controller: _refreshController,
              enablePullDown: true,
              enablePullUp: false,
              header: const RefreshWidget(),
              onRefresh: () async {
                _onRefreshProducts();
                _refreshController.refreshCompleted();
              },
              child: SingleChildScrollView(
                child: XGridView(
                  type: XGridViewType.aligned,
                  padding:
                      EdgeInsets.symmetric(horizontal: 8.sp, vertical: 8.sp),
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  crossAxisCount: context.isSmallScreen ? 1 : 2,
                  mainAxisSpacing: 16.sp,
                  crossAxisSpacing: 16.sp,
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    final ProductModel product = products[index];
                    return ProductItemSearchDialog(
                      productName: product.getName,
                      productCode: product.getBarCode,
                      productImage: product.getImageThumbnail,
                      discountValue: product.getDiscountPrice,
                      productPrice: widget.referenceId.isNotNullOrEmpty
                          ? product.getListedPrice
                          : product.getSellingPrice,
                      isNeedInStock: widget.isNeedInStock,
                      isExistInStock: (product.inStockQuantity ?? 0) > 0,
                      productType: product.productType,
                      productsCombo: product.productsCombo,
                      onPressed: () => _onSelectProduct(product),
                    );
                  },
                ),
              ),
            );
          }

          return const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              EmptyDataWidget(
                emptyMessage: 'Không có sản phẩm',
              ),
            ],
          );
        }
        return const SizedBox.shrink();
      },
    );
  }

  Widget _renderSearchBox() {
    return SearchBoxWidget(
      onSearch: _onChangeText,
      searchController: _searchController,
      hintStr: 'Nhập tên sản phẩm',
    );
  }

  ///
  /// METHOD
  ///
  _onChangeText(String? value) {
    _timer?.cancel();
    _timer =
        Timer(const Duration(milliseconds: AppConstants.timeSearchValue), () {
      List<ProductModel> products = [..._products];
      if (value != null) {
        products = products
            .where((product) =>
                product.getName.toStrSearch.contains(value.toStrSearch))
            .toList();
      }
      _filterProducts.add(products);
    });
  }

  _onSelectProduct(ProductModel product) {
    Navigator.pop(context, product);
  }

  _onRefreshProducts() {
    _searchProductBloc.add(RefreshProductsEvent(
      searchAction: SearchAction.addToCart,
      parentProductId: widget.parentProductId,
      productType: widget.productType,
      cartType: widget.cartType,
      referenceId: widget.referenceId,
    ));
  }
}
