import 'package:c_pos/common/extensions/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../../../data/models/product_model.dart';
import '../../../../widgets/widgets.dart';
import '../bloc/search_product_bloc.dart';
import 'product_item.dart';

class ProductsSearch extends StatefulWidget {
  const ProductsSearch({super.key, required this.searchProductBloc});

  final SearchProductBloc searchProductBloc;

  @override
  State<ProductsSearch> createState() => _ProductsSearchState();
}

class _ProductsSearchState extends State<ProductsSearch> {
  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  @override
  void dispose() {
    _refreshController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    int crossAxisCount = context.isSmallScreen ? 1 : 2;
    return BlocConsumer<SearchProductBloc, SearchProductState>(
      bloc: widget.searchProductBloc,
      listener: (context, state) {
        if (state is ChangeSearchTypeSuccess) {
          if (state.pageInfo.checkCanLoadMore) {
            _refreshController.loadComplete();
          } else {
            _refreshController.loadNoData();
          }
        }
      },
      builder: (context, state) {
        if (state is SearchLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        List<ProductModel> products = state.products;

        if (products.isEmpty) {
          return const Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              EmptyDataWidget(),
            ],
          );
        }

        return SmartRefresher(
          controller: _refreshController,
          enablePullDown: true,
          enablePullUp: true,
          header: const RefreshWidget(),
          footer: const BottomLoadWidget(
            canLoadingStr: 'Vuốt để lấy thêm sản phẩm',
            noMoreStr: 'Đã hết sản phẩm',
          ),
          onRefresh: () async {
            widget.searchProductBloc.add(RefreshProductsEvent());
            _refreshController.refreshCompleted();
          },
          onLoading: () {
            widget.searchProductBloc.add(LoadMoreProductsEvent());
          },
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 16.sp, vertical: 16.sp),
            child: XGridView(
              type: XGridViewType.normal,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: crossAxisCount,
              mainAxisSpacing: 16.sp,
              crossAxisSpacing: 16.sp,
              itemCount: products.length,
              itemBuilder: (context, index) {
                ProductModel product = state.products[index];
                return ProductItemInCart(
                  // type: ProductItemType.addOn,
                  key: ValueKey(product.id!),
                  product: state.products[index],
                  // productItemType: widget.productItemType,
                );
              },
            ),
          ),
        );
      },
    );
  }
}
