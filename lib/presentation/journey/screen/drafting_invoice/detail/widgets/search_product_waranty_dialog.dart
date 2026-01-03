import 'dart:async';

import 'package:c_pos/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../common/constants/app_constants.dart';
import '../../../../../../common/di/injection/injection.dart';
import '../../../../../../data/models/product_model.dart';
import '../../../search_product/bloc/search_product_bloc.dart';
import 'search_product_dialog.dart';

class SearchProductWarantyDialog extends StatefulWidget {
  const SearchProductWarantyDialog({super.key, this.parentProductId});

  final String? parentProductId;

  @override
  State<SearchProductWarantyDialog> createState() =>
      _SearchProductWarantyDialogState();
}

class _SearchProductWarantyDialogState
    extends State<SearchProductWarantyDialog> {
  final SearchProductBloc _searchProductBloc = getIt.get<SearchProductBloc>();
  final TextEditingController _searchController = TextEditingController();
  final ValueNotifier<List<ProductModel>> _products = ValueNotifier([]);
  List<ProductModel> _productsWarranty = [];
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _searchProductBloc.add(
        SearchWarrantyProductsEvent(parentProductId: widget.parentProductId));
  }

  @override
  void dispose() {
    _timer?.cancel();
    _products.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const HeaderDialog(title: 'Tìm kiếm sản phẩm bảo hành'),
        Expanded(
          child: BlocConsumer<SearchProductBloc, SearchProductState>(
            bloc: _searchProductBloc,
            buildWhen: (previous, current) =>
                current is GetWarrantyProductsSuccess ||
                current is SearchLoading,
            listener: (context, state) {
              if (state is GetWarrantyProductsSuccess) {
                _productsWarranty = state.products;
                _products.value = state.products;
              }
            },
            builder: (context, state) {
              if (state is SearchLoading) {
                return const ProductLoading();
              }
              List<ProductModel> products = [];
              if (state is GetWarrantyProductsSuccess) {
                products = state.productsWarranty;
              }
              return _renderProductList(data: products);
            },
          ),
        ),
        _renderSearchBox(),
      ],
    );
  }

  ///
  /// WIDGET
  ///
  Widget _renderSearchBox() {
    return SearchBoxWidget(
      onSearch: _onChangeText,
      searchController: _searchController,
      hintStr: 'Tìm kiếm sản phẩm bảo hành',
    );
  }

  Widget _renderProductList({required List<ProductModel> data}) {
    return ValueListenableBuilder(
        valueListenable: _products,
        builder: (context, value, child) {
          List<ProductModel> products = value.isEmpty ? data : value;

          return ListView.separated(
            itemBuilder: (context, index) {
              final product = products[index];
              return ProductItemSearchDialog(
                productName: product.getName,
                productCode: product.getBarCode,
                productImage: product.getImageThumbnail,
                productPrice: product.getSellingPrice,
                discountValue: product.getDiscountPrice,
                isNeedInStock: false,
                isExistInStock: true,
                productType: product.productType,
                productsCombo: product.productsCombo,
                onPressed: () => _onSelectProduct(product),
              );
            },
            separatorBuilder: (context, index) => const XDivider(),
            itemCount: products.length,
          );
        });
  }

  ///
  /// METHOD
  ///

  _onSelectProduct(ProductModel product) {
    Navigator.pop(context, product);
  }

  _onChangeText(String? value) {
    _timer?.cancel();
    _timer =
        Timer(const Duration(milliseconds: AppConstants.timeSearchValue), () {
      List<ProductModel> products = [..._productsWarranty];
      if (value != null) {
        products = products
            .where((product) => product.getName.contains(value))
            .toList();
      }
      _products.value = products;
    });
  }
}
