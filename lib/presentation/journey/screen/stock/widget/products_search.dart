part of '../manage_stock/search_stock_screen.dart';

class ProductsSearch extends StatefulWidget {
  const ProductsSearch({super.key, required this.searchProductBloc});

  final StockBloc searchProductBloc;

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
    return BlocConsumer<StockBloc, StockState>(
      bloc: widget.searchProductBloc,
      buildWhen: (previous, current) =>
          {StockIsLoading, GetProductsSuccess}.contains(current.runtimeType),
      listener: (context, state) {
        if (state.pageInfo.checkCanLoadMore) {
          _refreshController.loadComplete();
        }
        if (!state.pageInfo.checkCanLoadMore) {
          _refreshController.loadNoData();
        }
      },
      builder: (context, state) {
        if (state is StockIsLoading) {
          return const LoadingTransaction();
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
            widget.searchProductBloc.add(GetProductsEvent());
            _refreshController.refreshCompleted();
          },
          onLoading: () {
            widget.searchProductBloc.add(GetMoreProductsEvent());
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
                return ProductItemInStock(
                  key: ValueKey(product.id!),
                  product: state.products[index],
                );
              },
            ),
          ),
        );
      },
    );
  }
}
