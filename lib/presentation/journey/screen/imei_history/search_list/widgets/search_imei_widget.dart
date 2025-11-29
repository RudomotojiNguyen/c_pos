import 'package:c_pos/common/constants/app_constants.dart';
import 'package:c_pos/common/extensions/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

import '../../../../../../common/configs/box.dart';
import '../../../../../../common/di/injection/injection.dart';
import '../../../../../../common/enum/enum.dart';
import 'package:c_pos/data/models/models.dart';
import '../../../../../theme/themes.dart';
import '../../../../../widgets/widgets.dart';
import '../../../product/bloc/product_bloc.dart';
import '../../../store/bloc/store_bloc.dart';

class SearchImeiWidget extends StatefulWidget {
  const SearchImeiWidget({super.key, required this.productBloc});

  final ProductBloc productBloc;

  @override
  State<SearchImeiWidget> createState() => _SearchImeiWidgetState();
}

class _SearchImeiWidgetState extends State<SearchImeiWidget> {
  final TextEditingController _searchImeiController = TextEditingController();

  /// for filter
  final TextEditingController _storeController = TextEditingController();
  final StoreBloc _storeBloc = getIt.get<StoreBloc>();
  final ValueNotifier<StoreModel?> storeSelected = ValueNotifier(null);
  final ValueNotifier<ImeiStatus> statusSelected =
      ValueNotifier(ImeiStatus.all);
  final List<ImeiStatus> statusFilter = [
    ImeiStatus.all,
    ImeiStatus.newImei,
    ImeiStatus.sold,
    ImeiStatus.delivering,
    ImeiStatus.error,
    ImeiStatus.returnedNCC,
    ImeiStatus.movingStore,
    ImeiStatus.returnedWarranty,
    ImeiStatus.warrantying,
    ImeiStatus.keeping,
    ImeiStatus.loaning,
  ];

  @override
  void dispose() {
    _storeController.dispose();
    storeSelected.dispose();
    statusSelected.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductBloc, ProductState>(
      bloc: widget.productBloc,
      buildWhen: (previous, current) => current is UpdateFilterSuccess,
      builder: (context, state) {
        return SearchBoxWidget(
          onSearch: _onSearch,
          searchController: _searchImeiController,
          hintStr: 'DNJWNDF123....',
          filterWidget: _dataFilter(context),
          isFilter: state.filterImeiHistory.isFilter,
          suffixWidget: XIconScancode(
            scanMode: XScanMode.inventory,
            onResult: ({String? code, List<String>? codes}) {
              if (code.isNotNullOrEmpty) {
                _searchImeiController.text = code ?? '';
                _onSearch(_searchImeiController.text);
              }
            },
          ),
        );
      },
    );
  }

  ///
  /// METHOD
  ///
  _onSearch(String value) {
    Future.delayed(const Duration(milliseconds: AppConstants.timeSearchValue),
        () {
      widget.productBloc.add(UpdateImeiFilterEvent(
        imeiStatus: statusSelected.value,
        store: storeSelected.value,
        search: value,
      ));
    });
  }

  _onUpdateFilter() {
    widget.productBloc.add(UpdateImeiFilterEvent(
        imeiStatus: statusSelected.value,
        store: storeSelected.value,
        search: _searchImeiController.text));
    Navigator.pop(context);
  }

  _onSetFilterDefault() {
    widget.productBloc.add(SetDefaultImeiFilterEvent());
    storeSelected.value = null;
    statusSelected.value = ImeiStatus.all;
    Future.delayed(
      const Duration(milliseconds: 400),
      () {
        Navigator.pop(context);
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
          _store(context),
          BoxSpacer.s8,
          _status(context),
          BoxSpacer.s16,
          _bottom(context),
        ],
      ),
    );
  }

  Widget _store(BuildContext context) {
    return TypeAheadField<StoreModel>(
      controller: _storeController,
      itemBuilder: (context, store) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.sp, vertical: 4.sp),
          child: Text(
            store.getName,
            style: AppFont.t.s(),
          ),
        );
      },
      onSelected: (value) {
        storeSelected.value = value;
        _storeController.text = value.getName;
      },
      suggestionsCallback: (search) =>
          _storeBloc.suggestionsUserCallback(search),
      constraints: BoxConstraints(maxHeight: 180.sp),
      emptyBuilder: (context) {
        return const EmptyDataWidget(
          emptyMessage: 'Không có cửa hàng trùng khớp',
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
                  borderRadius: BorderRadius.all(AppRadius.xxl),
                  border:
                      Border.all(width: 1.sp, color: AppColors.dividerColor)),
              child: XTextField(
                controller: controller,
                focusNode: focusNode,
                hintText: 'Chọn cửa hàng',
                autoFocus: false,
                decorationStyle: DecorationStyle.search,
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _status(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Trạng thái',
          style: AppFont.t.s(),
        ),
        BoxSpacer.s4,
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              ...statusFilter.map(
                (e) => ValueListenableBuilder(
                    valueListenable: statusSelected,
                    builder: (context, value, _) {
                      return _itemFilter(
                        title: e.getTitle,
                        isSelected: value == e,
                        onPressed: () {
                          statusSelected.value = e;
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

  Widget _bottom(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        XButton(
          title: 'Mặc định',
          padding: EdgeInsets.symmetric(vertical: 12.sp, horizontal: 32.sp),
          type: XButtonType.secondary,
          onPressed: _onSetFilterDefault,
        ),
        BoxSpacer.s8,
        XButton(
          padding: EdgeInsets.symmetric(vertical: 12.sp, horizontal: 32.sp),
          title: 'Lọc',
          onPressed: _onUpdateFilter,
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
}
