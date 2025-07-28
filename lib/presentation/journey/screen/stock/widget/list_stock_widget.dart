import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../../../common/configs/box.dart';
import 'package:c_pos/data/models/models.dart';
import '../../../../widgets/widgets.dart';
import '../../search/widgets/product_item.dart';
import '../bloc/stock_bloc.dart';

class ListStockWidget extends StatefulWidget {
  const ListStockWidget({super.key, required this.stockBloc});

  final StockBloc stockBloc;

  @override
  State<ListStockWidget> createState() => _ListStockWidgetState();
}

class _ListStockWidgetState extends State<ListStockWidget> {
  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  @override
  void dispose() {
    _refreshController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<StockBloc, StockState>(
      bloc: widget.stockBloc,
      listener: (context, state) {
        if (state is UpdateFilterSuccess) {
          widget.stockBloc.add(GetProductsEvent());
          _refreshController.refreshCompleted();
        }
        if (!state.pageInfo.checkCanLoadMore) {
          _refreshController.loadNoData();
        }
        if (state.pageInfo.checkCanLoadMore) {
          _refreshController.loadComplete();
        }
      },
      builder: (context, state) {
        if (state is StockIsLoading) {
          return ListView.separated(
            itemCount: 10,
            padding: EdgeInsets.symmetric(horizontal: 20.sp, vertical: 16.sp),
            itemBuilder: (context, index) {
              return const ProductItemSearchLoading();
            },
            separatorBuilder: (context, index) => BoxSpacer.s16,
          );
        }

        final List<ProductModel> products = state.products;

        if (products.isEmpty) {
          return const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              EmptyDataWidget(
                emptyMessage: 'Không có sản phẩm nào',
              )
            ],
          );
        }

        return SmartRefresher(
          controller: _refreshController,
          enablePullDown: true,
          enablePullUp: true,
          header: const RefreshWidget(),
          footer: const BottomLoadWidget(
            canLoadingStr: 'Vuốt để xem thêm sản phẩm',
            noMoreStr: 'Đã hết',
          ),
          onRefresh: () async {
            widget.stockBloc.add(GetProductsEvent());
            _refreshController.refreshCompleted();
          },
          onLoading: () {
            widget.stockBloc.add(GetMoreProductsEvent());
          },
          child: ListView.separated(
            itemCount: products.length,
            padding: EdgeInsets.symmetric(horizontal: 20.sp, vertical: 16.sp),
            itemBuilder: (context, index) {
              ProductModel product = products[index];
              return ProductItemInCart(
                key: ValueKey(product.id!),
                product: state.products[index],
              );
            },
            separatorBuilder: (context, index) => BoxSpacer.s16,
          ),
        );
      },
    );
  }
}
