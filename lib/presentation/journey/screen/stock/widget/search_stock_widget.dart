import 'dart:async';

import 'package:c_pos/common/constants/app_constants.dart';
import 'package:c_pos/common/extensions/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

import '../../../../../common/configs/box.dart';
import '../../../../../common/enum/enum.dart';
import '../../../../../data/models/category_model.dart';
import '../../../../theme/themes.dart';
import '../../../../widgets/widgets.dart';
import '../../category/bloc/category_bloc.dart';
import '../bloc/stock_bloc.dart';

class SearchStockWidget extends StatefulWidget {
  const SearchStockWidget(
      {super.key, required this.stockBloc, required this.categoryBloc});

  final StockBloc stockBloc;
  final CategoryBloc categoryBloc;

  @override
  State<SearchStockWidget> createState() => _SearchStockWidgetState();
}

class _SearchStockWidgetState extends State<SearchStockWidget> {
  final TextEditingController _searchOrderController = TextEditingController();
  final TextEditingController _cateController = TextEditingController();
  Timer? _timer;
  final ValueNotifier<CategoryModel?> cateSelected = ValueNotifier(null);
  final ValueNotifier<SearchType> typeSelected = ValueNotifier(SearchType.all);
  final ValueNotifier<bool> checkInStock = ValueNotifier(true);

  @override
  void dispose() {
    _searchOrderController.dispose();
    _cateController.dispose();
    cateSelected.dispose();
    typeSelected.dispose();
    checkInStock.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StockBloc, StockState>(
      bloc: widget.stockBloc,
      buildWhen: (previous, current) => current is UpdateFilterSuccess,
      builder: (context, state) {
        return SearchBoxWidget(
          onSearch: _onChangeText,
          hintStr: 'Nhập thông tin tìm kiếm',
          isFilter: state.productStockFilter.isFilter,
          filterWidget: _dataFilter(context),
        );
      },
    );
  }

  ///
  /// WIDGET
  ///
  Widget _dataFilter(BuildContext context) {
    return SizedBox(
      width: 300.sp,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _category(context),
          BoxSpacer.s16,
          _type(context),
          BoxSpacer.s16,
          _checkInstock(context),
          BoxSpacer.s32,
          _bottom(context),
        ],
      ),
    );
  }

  Widget _category(BuildContext context) {
    return TypeAheadField<CategoryModel>(
      controller: _cateController,
      itemBuilder: (context, cate) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.sp, vertical: 4.sp),
          child: Text(
            cate.getCategoryName,
            style: AppFont.t.s(),
          ),
        );
      },
      onSelected: (value) {
        cateSelected.value = value;
        _cateController.text = value.getCategoryName;
      },
      suggestionsCallback: (search) =>
          widget.categoryBloc.suggestionsCallback(search),
      constraints: BoxConstraints(maxHeight: 180.sp),
      emptyBuilder: (context) {
        return const EmptyDataWidget(
          emptyMessage: 'Không có danh mục trùng khớp',
        );
      },
      builder: (context, controller, focusNode) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.all(AppRadius.l),
                  border:
                      Border.all(width: 1.sp, color: AppColors.dividerColor)),
              child: XTextField(
                controller: controller,
                focusNode: focusNode,
                hintText: 'Chọn danh mục',
                autoFocus: false,
                decorationStyle: DecorationStyle.search,
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _type(BuildContext context) {
    final List<SearchType> typeFilter = [
      SearchType.all,
      SearchType.accessoriesProduct,
      SearchType.imei,
      SearchType.productCombo,
    ];
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Text(
        //   'Loại',
        //   style: context.appTheme.textTheme.labelSmall,
        // ),
        // BoxSpacer.s4,
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              ...typeFilter.map(
                (e) => ValueListenableBuilder(
                    valueListenable: typeSelected,
                    builder: (context, value, _) {
                      return _itemFilter(
                        title: e.getTitle,
                        isSelected: value == e,
                        onPressed: () {
                          typeSelected.value = e;
                        },
                      );
                    }),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _itemFilter(
      {required String title, Function()? onPressed, bool isSelected = false}) {
    return XBaseButton(
      padding: EdgeInsets.symmetric(horizontal: 4.sp, vertical: 4.sp),
      onPressed: onPressed,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(AppRadius.s),
          color: isSelected ? AppColors.primaryColor : AppColors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.1),
              offset: const Offset(-1, 1), // changes position of shadow
            ),
          ],
        ),
        padding: EdgeInsets.symmetric(horizontal: 8.sp, vertical: 4.sp),
        child: Text(
          title,
          style: AppFont.t.s().copyWith(
                color: !isSelected ? AppColors.neutralColor : AppColors.white,
              ),
        ),
      ),
    );
  }

  Widget _bottom(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        XButton(
          title: 'Mặc định',
          padding: EdgeInsets.symmetric(vertical: 12.sp, horizontal: 32.sp),
          type: XButtonType.secondary,
          onPressed: () {
            cateSelected.value = null;
            typeSelected.value = SearchType.all;
            checkInStock.value = true;

            widget.stockBloc.add(SetDefaultFilterEvent());

            Navigator.pop(context);
          },
        ),
        BoxSpacer.s8,
        XButton(
          padding: EdgeInsets.symmetric(vertical: 12.sp, horizontal: 32.sp),
          title: 'Lọc',
          onPressed: () {
            widget.stockBloc.add(UpdateFilterEvent(
              isInStock: checkInStock.value,
              searchType: typeSelected.value,
              cateSelected: cateSelected.value,
            ));
            Navigator.pop(context);
          },
        ),
      ],
    );
  }

  Widget _checkInstock(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: checkInStock,
        builder: (context, value, _) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                'Chỉ lấy còn tồn',
                style: AppFont.t.s(),
              ),
              BoxSpacer.s8,
              XToggleButton(
                isOn: value,
                toggleSwitch: () {
                  checkInStock.value = !value;
                },
              ),
            ],
          );
        });
  }

  ///
  /// METHOD
  ///
  _onChangeText(String? value) {
    if (_timer?.isActive ?? false) _timer?.cancel();
    _timer =
        Timer(const Duration(milliseconds: AppConstants.timeSearchValue), () {
      widget.stockBloc.add(UpdateFilterEvent(
        isInStock: checkInStock.value,
        searchType: typeSelected.value,
        cateSelected: cateSelected.value,
        searchValue: value ?? '',
      ));
    });
  }
}
