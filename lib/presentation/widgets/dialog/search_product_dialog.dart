import 'dart:async';

import 'package:c_pos/common/enum/enum.dart';
import 'package:c_pos/common/extensions/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../common/configs/box.dart';
import '../../../common/constants/app_constants.dart';
import '../../../common/di/injection/injection.dart';
import '../../../data/models/product_model.dart';
import '../../journey/screen/search/bloc/search_product_bloc.dart';
import '../../theme/themes.dart';
import '../widgets.dart';

class SearchProductDialog extends StatefulWidget {
  const SearchProductDialog({
    super.key,
    this.onSelectProduct,
    this.isNeedInStock = false,
  });

  final Function(ProductModel)? onSelectProduct;
  final bool
      isNeedInStock; // xem có cần check sản phẩm còn hàng mới cho ấn không

  @override
  State<SearchProductDialog> createState() => _SearchProductDialogState();
}

class _SearchProductDialogState extends State<SearchProductDialog> {
  final SearchProductBloc _searchProductBloc = getIt.get<SearchProductBloc>();
  final RefreshController _refreshController = RefreshController(
    initialRefresh: false,
  );
  final TextEditingController _searchController = TextEditingController();
  Timer? _timer;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _refreshController.dispose();
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BoxSpacer.s16,
        const HeaderDialog(title: 'Tìm kiếm sản phẩm'),
        Expanded(child: _renderProductList()),
        _renderSearchBox(),
      ],
    );
  }

  ///
  /// WIDGET
  ///
  Widget _renderSearchBox() {
    return BlocBuilder<SearchProductBloc, SearchProductState>(
      bloc: _searchProductBloc,
      buildWhen: (previous, current) => current is ChangeSearchTypeSuccess,
      builder: (context, state) {
        return SearchBoxWidget(
          onSearch: _onChangeText,
          searchController: _searchController,
          hintStr: state.searchType.getHintText,
          filterWidget: _dataSearchType(),
        );
      },
    );
  }

  Widget _dataSearchType() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        XTextButton(
          title: SearchType.product.getTitle,
          onPressed: () {
            onChangeSearchTypeEvent(SearchType.product);
          },
        ),
        XTextButton(
          title: SearchType.imei.getTitle,
          onPressed: () {
            onChangeSearchTypeEvent(SearchType.imei);
          },
        ),
      ],
    );
  }

  Widget _renderProductList() {
    return BlocBuilder<SearchProductBloc, SearchProductState>(
      bloc: _searchProductBloc,
      buildWhen: (previous, current) =>
          current is GetProductsSuccess || current is SearchLoading,
      builder: (context, state) {
        if (state is SearchLoading) {
          return XGridView(
            type: XGridViewType.aligned,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            crossAxisCount: context.isSmallScreen ? 1 : 2,
            mainAxisSpacing: 16.sp,
            crossAxisSpacing: 16.sp,
            itemCount: 4,
            itemBuilder: (context, index) {
              return const ProductItemSearchLoading();
            },
          );
        }

        List<ProductModel> products = state.products;
        if (state.products.isEmpty) {
          return const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              EmptyDataWidget(emptyMessage: 'Không có sản phẩm cần tìm'),
            ],
          );
        }

        return SmartRefresher(
          controller: _refreshController,
          enablePullDown: true,
          enablePullUp: false,
          header: const RefreshWidget(),
          onRefresh: () async {
            _refreshController.refreshCompleted();
          },
          child: SingleChildScrollView(
            child: XGridView(
              type: XGridViewType.aligned,
              padding: EdgeInsets.symmetric(horizontal: 8.sp, vertical: 8.sp),
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
                  productPrice: product.getSellingPrice,
                  isNeedInStock: widget.isNeedInStock,
                  isExistInStock: product.isExistInStock,
                  onPressed: () => _onSelectProduct(product),
                );
              },
            ),
          ),
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
      final String textValue = _searchController.text.trim();
      if (textValue.isNullOrEmpty) {
        _searchProductBloc
            .add(RefreshProductsEvent(searchAction: SearchAction.addToCart));
      } else {
        _searchProductBloc.add(OnSearchProductsEvent(textValue,
            searchAction: SearchAction.addToCart));
      }
    });
  }

  _onSelectProduct(ProductModel product) {
    widget.onSelectProduct?.call(product);
    Navigator.pop(context);
  }

  onChangeSearchTypeEvent(SearchType type) {
    _searchProductBloc.add(ChangeSearchTypeEvent(searchType: type));
    Navigator.pop(context);
  }
}

class ProductItemSearchDialog extends StatelessWidget {
  const ProductItemSearchDialog({
    super.key,
    required this.productName,
    required this.productCode,
    required this.productImage,
    required this.productPrice,
    this.onPressed,
    this.onRemove,
    required this.isNeedInStock,
    required this.isExistInStock,
  });

  final String productName;
  final String productCode;
  final String productImage;
  final double productPrice;
  final Function()? onPressed;
  final Function()? onRemove;
  final bool isNeedInStock;
  final bool isExistInStock;

  // nếu như cần check stock và sp hết hàng thì không cho ấn
  // nếu như không cần check stock thì cho ấn
  bool get isDisable => isNeedInStock && !isExistInStock;

  @override
  Widget build(BuildContext context) {
    return XBaseButton(
      disable: isDisable,
      onPressed: onPressed,
      decoration: BoxDecoration(
        color: isDisable ? AppColors.lightGreyColor : AppColors.white,
        borderRadius: BorderRadius.all(AppRadius.l),
        boxShadow: [
          BoxShadow(
            color: AppColors.shadowColor,
            blurRadius: 16.sp,
            offset: const Offset(0, .1), // changes position of shadow
          ),
        ],
      ),
      padding: EdgeInsets.symmetric(horizontal: 8.sp, vertical: 8.sp),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          XImage(
            imagePath: productImage,
            size: Size(80.sp, 80.sp),
            borderRadius: BorderRadius.all(AppRadius.l),
          ),
          BoxSpacer.s8,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  productName,
                  style: AppFont.t.s(13).copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                if (!isDisable) ...[
                  BoxSpacer.s4,
                  Text(
                    productPrice.formatCurrency,
                    style: AppFont.t.s().primaryColor,
                  ),
                ],
                if (isDisable) ...[
                  BoxSpacer.s4,
                  Text(
                    'Không còn hàng',
                    style: AppFont.t.s().copyWith(
                          color: AppColors.warningColor,
                        ),
                  ),
                ],
              ],
            ),
          ),
          if (onRemove != null) ...[
            BoxSpacer.s8,
            XBaseButton(
              onPressed: onRemove,
              child: Icon(
                Icons.backspace_outlined,
                color: AppColors.primaryColor,
                size: 18.sp,
              ),
            ),
          ],
        ],
      ),
    );
  }
}
