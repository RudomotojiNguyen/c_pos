import 'package:c_pos/common/enum/enum.dart';
import 'package:c_pos/common/extensions/extension.dart';
import 'package:c_pos/presentation/theme/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../../../../common/configs/box.dart';
import '../../../../../../common/constants/go_router.dart';
import '../../../../../../data/models/imei_history_model.dart';
import '../../../../../widgets/widgets.dart';
import '../../../../router.dart';
import '../../../product/bloc/product_bloc.dart';

part './imei_history_item_widget.dart';

class ListImeiWidget extends StatefulWidget {
  const ListImeiWidget({super.key, required this.productBloc});

  final ProductBloc productBloc;

  @override
  State<ListImeiWidget> createState() => _ListImeiWidgetState();
}

class _ListImeiWidgetState extends State<ListImeiWidget> {
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
    return BlocConsumer<ProductBloc, ProductState>(
      bloc: widget.productBloc,
      listener: (context, state) {
        if (state is UpdateFilterSuccess) {
          widget.productBloc.add(GetImeiHistoryEvent());
        }
        if (state.pageInfo.checkCanLoadMore) {
          _refreshController.loadComplete();
        }
        if (!state.pageInfo.checkCanLoadMore) {
          _refreshController.loadNoData();
        }
      },
      builder: (context, state) {
        if (state is IsLoading) {
          return const LoadingTransaction();
        }
        final List<ImeiHistoryModel> data = state.listImeiHistory;
        if (data.isEmpty) {
          return const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              EmptyDataWidget(
                emptyMessage: 'Không thấy Imei sản phẩm',
              ),
            ],
          );
        }
        return SmartRefresher(
          controller: _refreshController,
          enablePullDown: true,
          enablePullUp: true,
          header: const RefreshWidget(),
          footer: const BottomLoadWidget(
            canLoadingStr: 'Vuốt để tìm thêm imei',
            noMoreStr: 'Đã hết dữ liệu',
          ),
          onRefresh: () async {
            widget.productBloc.add(GetImeiHistoryEvent());
            _refreshController.refreshCompleted();
          },
          onLoading: () {
            widget.productBloc.add(GetMoreImeiHistoryEvent());
          },
          child: SingleChildScrollView(
            child: XGridView(
              type: XGridViewType.aligned,
              crossAxisCount: crossAxisCount,
              mainAxisSpacing: 16.sp,
              crossAxisSpacing: 16.sp,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              padding: EdgeInsets.symmetric(horizontal: 20.sp, vertical: 16.sp),
              itemCount: data.length,
              itemBuilder: (context, index) {
                final ImeiHistoryModel item = data[index];
                return ImeiHistoryItemWidget(
                  imei: item.getImei,
                  status: item.getStatus,
                  colorStatus: item.getColorImeiStatus,
                  productImage: item.getProductImage,
                  productName: item.getProductName,
                  sellingPrice: item.getSellingPrice,
                  provider: item.getProvider,
                  onPressed: () {
                    MainRouter.instance.pushNamed(context,
                        routeName: RouteName.imeiHistory,
                        queryParameters: {
                          'imei': item.getImei,
                        });
                  },
                );
              },
            ),
          ),
        );
      },
    );
  }
}
