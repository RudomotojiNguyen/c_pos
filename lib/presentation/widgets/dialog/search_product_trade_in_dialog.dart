import 'dart:async';

import 'package:c_pos/common/constants/app_constants.dart';
import 'package:c_pos/common/di/injection/injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../common/configs/box.dart';
import '../../../data/models/product_model.dart';
import '../../journey/screen/trade_in/bloc/trade_in_bloc.dart';
import '../widgets.dart';

class SearchProductTradeInDialog extends StatefulWidget {
  const SearchProductTradeInDialog(
      {super.key, this.searchStr, required this.onResult});

  final String? searchStr;
  final Function(ProductModel product) onResult;

  @override
  State<SearchProductTradeInDialog> createState() =>
      _SearchProductTradeInDialogState();
}

class _SearchProductTradeInDialogState
    extends State<SearchProductTradeInDialog> {
  final TradeInBloc _tradeInBloc = getIt.get<TradeInBloc>();
  final TextEditingController _searchController = TextEditingController();
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _searchController.text = widget.searchStr ?? '';
    _onChangeText(widget.searchStr);
  }

  @override
  void dispose() {
    _timer?.cancel();
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _header(),
        BoxSpacer.s16,
        Expanded(child: _listSearch()),
      ],
    );
  }

  ///
  /// WIDGET
  ///

  Widget _header() {
    return XTextField(
      labelText: 'Tìm sản phẩm',
      hintText: 'Iphone .......',
      controller: _searchController,
      onChanged: _onChangeText,
      autoFocus: true,
    );
  }

  Widget _listSearch() {
    return BlocBuilder<TradeInBloc, TradeInState>(
      bloc: _tradeInBloc,
      builder: (context, state) {
        if (state is IsCriteriaLoading) {
          return const ProductsLoading();
        }

        final List<ProductModel> products =
            state is SearchProductsSuccess ? state.products : [];

        if (products.isNotEmpty) {
          return ListView.separated(
            itemBuilder: (context, index) {
              final ProductModel product = products[index];
              return ProductItemDetailWidget(
                productName: product.getName,
                productImei: '',
                productImage: product.getImageThumbnail,
                sellingPrice: product.getSellingPrice,
                discountPrice: 0,
                onPressed: ({action}) {
                  widget.onResult(product);
                  Navigator.pop(context);
                },
              );
            },
            separatorBuilder: (context, index) => const XDivider(),
            itemCount: products.length,
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
      },
    );
  }

  ///
  /// METHOD
  ///
  _onChangeText(String? value) {
    if (_timer?.isActive ?? false) _timer?.cancel();
    _timer =
        Timer(const Duration(milliseconds: AppConstants.timeSearchValue), () {
      _tradeInBloc.add(SearchProductByNameEvent((value ?? '').trim()));
    });
  }
}
