import 'dart:async';

import 'package:c_pos/common/constants/app_constants.dart';
import 'package:c_pos/common/extensions/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../common/configs/box.dart';
import '../../../common/di/injection/injection.dart';
import '../../../data/models/product_imei_model.dart';
import '../../journey/screen/product/bloc/product_bloc.dart';
import '../../mixins/mixins.dart';
import '../../theme/themes.dart';
import '../../utils/utils.dart';
import '../widgets.dart';

class ImeiOfProductDialog extends StatefulWidget {
  const ImeiOfProductDialog({
    super.key,
    required this.productId,
    required this.callback,
    this.storeId,
  });

  final String productId;
  final int? storeId;
  final Function(ProductImeiModel result) callback;

  @override
  State<ImeiOfProductDialog> createState() => _ImeiOfProductDialogState();
}

class _ImeiOfProductDialogState extends State<ImeiOfProductDialog>
    with DialogHelper {
  final ProductBloc _productBloc = getIt.get<ProductBloc>();
  final RefreshController _refreshController = RefreshController(
    initialRefresh: false,
  );

  /// danh sách imei có thể bán
  // final ValueNotifier<List<ProductImeiModel>> imeiList = ValueNotifier([]);

  /// imei cần phải bán trước
  // final ValueNotifier<ProductImeiModel?> imeiHighPriority = ValueNotifier(null);

  /// imei đang chọn
  final ValueNotifier<ProductImeiModel?> imeiSelected = ValueNotifier(null);

  final TextEditingController _searchController = TextEditingController();
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _productBloc.add(GetProductObsoleteImeiEvent(
      widget.productId,
      widget.storeId,
    ));
  }

  @override
  void dispose() {
    // imeiList.dispose();
    // imeiHighPriority.dispose();
    imeiSelected.dispose();
    _refreshController.dispose();
    _searchController.dispose();
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Column(
        children: [
          _header(),
          BoxSpacer.s16,
          Expanded(child: _content()),
          BoxSpacer.s16,
          _bottom(),
        ],
      ),
    );
  }

  ///
  /// WIDGET
  ///
  Widget _header() {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 16.sp),
          padding: EdgeInsets.symmetric(horizontal: 4.sp),
          decoration: BoxDecoration(
            border: Border.all(width: 1.sp, color: AppColors.dividerColor),
            borderRadius: BorderRadius.all(AppRadius.l),
          ),
          child: XTextField(
            hintText: 'Nhập tên hoặc mã sản phẩm',
            controller: _searchController,
            decorationStyle: DecorationStyle.search,
            onChanged: _onChangeText,
            suffixWidget: XBaseButton(
              onPressed: () => _productBloc.add(GetProductImeiSearchTextEvent(
                  search: _searchController.text)),
              child: Icon(
                Icons.search,
                size: 24.sp,
                color: AppColors.iconColor,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _bottom() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.sp),
      child: XButton(
        padding: EdgeInsets.symmetric(vertical: 12.sp),
        onPressed: () {
          final result = imeiSelected.value;
          if (result != null) {
            widget.callback(result);
            Navigator.pop(context);
          }
        },
        title: 'Xong',
      ),
    );
  }

  Widget _content() {
    return BlocBuilder<ProductBloc, ProductState>(
      bloc: _productBloc,
      builder: (context, state) {
        if (state is OnLoadingGetProductImei) {
          return ListView.separated(
            padding: EdgeInsets.symmetric(horizontal: 16.sp, vertical: 12.sp),
            itemBuilder: (context, index) {
              return _loadingItem(Utils.randomNumber(40, 200).sp);
            },
            separatorBuilder: (context, index) => BoxSpacer.s16,
            itemCount: 10,
          );
        }

        List<ProductImeiModel> imeiList = [];

        if (state is GetProductImeiDataSuccess) {
          imeiList = state.productsImeiSearchText ?? [];
        }

        if (imeiList.isEmpty) {
          return const EmptyDataWidget(emptyMessage: 'Không tìm thấy IMEI');
        }

        return SmartRefresher(
          controller: _refreshController,
          enablePullDown: true,
          enablePullUp: false,
          header: const RefreshWidget(),
          onRefresh: () async {
            _refreshController.refreshCompleted();
            _searchController.clear();
            _productBloc.add(GetProductImeiSearchTextEvent());
          },
          child: ListView.separated(
            padding: EdgeInsets.symmetric(
              horizontal: 16.sp,
              vertical: 12.sp,
            ),
            itemBuilder: (context, index) {
              final ProductImeiModel imei = imeiList[index];
              return XBaseButton(
                onPressed: () => imeiSelected.value = imei,
                child: Container(
                  padding: EdgeInsets.symmetric(
                    vertical: 16.sp,
                    horizontal: 16.sp,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(AppRadius.xxm),
                    color: AppColors.white,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        imei.getImeiNoValue,
                        style: AppFont.t.s(),
                      ),
                      ValueListenableBuilder(
                        valueListenable: imeiSelected,
                        builder: (context, selected, child) {
                          bool isSelected = selected?.imeiNo == imei.imeiNo;
                          if (isSelected) {
                            return Icon(
                              Icons.check_circle,
                              size: 18.sp,
                              color: AppColors.primaryColor,
                            );
                          }
                          return BoxSpacer.blank;
                        },
                      ),
                    ],
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) => BoxSpacer.s4,
            itemCount: imeiList.length,
          ),
        );
      },
    );
  }

  Widget _loadingItem(double width) {
    return XPlaceHolder(width: width, height: 12.sp);
  }

  ///
  /// METHOD
  ///
  _onChangeText(String? value) {
    if (_timer?.isActive ?? false) _timer?.cancel();
    _timer =
        Timer(const Duration(milliseconds: AppConstants.timeSearchValue), () {
      _productBloc.add(GetProductImeiSearchTextEvent(search: value));
    });
  }
}
