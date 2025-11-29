part of '../manage_stock/search_stock_screen.dart';

class SearchBox extends StatefulWidget {
  const SearchBox({super.key, required this.searchProductBloc});

  final StockBloc searchProductBloc;

  @override
  State<SearchBox> createState() => _SearchBoxState();
}

class _SearchBoxState extends State<SearchBox> {
  final TextEditingController _searchController = TextEditingController();
  Timer? _timer;
  final ValueNotifier<bool> checkInStock = ValueNotifier(true);

  int? userStoreId = getIt.get<AuthBloc>().state.userInfo?.employee?.storeId;
  final TextEditingController _storeController = TextEditingController();
  final ValueNotifier<StoreModel?> store = ValueNotifier(null);
  final StoreBloc _storeBloc = getIt.get<StoreBloc>();
  final LinkedOverlayController _filterController = LinkedOverlayController();

  @override
  void initState() {
    super.initState();
    if (userStoreId != null) {
      final store = _getCurrentUserStore();
      _onSetStore(store);
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    checkInStock.dispose();
    _storeController.dispose();
    store.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SearchBoxWidget(
      onSearch: _onChangeText,
      searchController: _searchController,
      hintStr: 'Iphone 15...',
      filterWidget: _dataFilter(context),
      filterController: _filterController,
      suffixWidget: XIconScancode(
        scanMode: XScanMode.inventory,
        onResult: ({String? code, List<String>? codes}) {
          if (code.isNotNullOrEmpty) {
            _searchController.text = code ?? '';
            _onChangeText(_searchController.text);
          }
        },
      ),
    );
  }

  ///
  /// WIDGETS
  ///

  Widget _dataFilter(BuildContext context) {
    return SizedBox(
      width: 300.sp,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          BoxSpacer.s8,
          _store(context),
          BoxSpacer.s8,
          _checkInstock(context),
          BoxSpacer.s32,
          _bottom(context),
        ],
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
            checkInStock.value = true;
            final store = _getCurrentUserStore();
            _onSetStore(store);

            widget.searchProductBloc
                .add(UpdateFilterEvent(isInStock: true, storeId: store?.id));

            _onCloseFilter();
          },
        ),
        BoxSpacer.s8,
        XButton(
          padding: EdgeInsets.symmetric(vertical: 12.sp, horizontal: 32.sp),
          title: 'Lọc',
          onPressed: () {
            widget.searchProductBloc.add(
              UpdateFilterEvent(
                isInStock: checkInStock.value,
                storeId: store.value?.id,
              ),
            );

            _onCloseFilter();
          },
        ),
      ],
    );
  }

  Widget _store(BuildContext context) {
    return TypeAheadField<StoreModel>(
      controller: _storeController,
      itemBuilder: (context, store) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.sp, vertical: 4.sp),
          child: Text(
            store.name ?? '',
            style: AppFont.t.s(),
          ),
        );
      },
      onSelected: (value) => _onSetStore(value),
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
            Text(
              'Cửa hàng',
              style: AppFont.t.s(),
            ),
            BoxSpacer.s4,
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
      },
    );
  }

  ///
  ///   METHODS
  ///

  onChangeSearchTypeEvent(SearchType type) {
    widget.searchProductBloc.add(UpdateFilterEvent(searchType: type));

    // Đóng overlay bằng cách unfocus và pop nếu có route
    _onCloseFilter();
  }

  _onChangeText(String? value) {
    if (_timer?.isActive ?? false) _timer?.cancel();
    _timer =
        Timer(const Duration(milliseconds: AppConstants.timeSearchValue), () {
      final String textValue = _searchController.text.trim();
      if (textValue.isNullOrEmpty) {
        widget.searchProductBloc.add(GetProductsEvent());
      } else {
        widget.searchProductBloc.add(UpdateFilterEvent(searchValue: textValue));
      }
    });
  }

  _onSetStore(StoreModel? value) {
    store.value = value;
    _storeController.text = value?.getName ?? '';
  }

  StoreModel? _getCurrentUserStore() {
    if (userStoreId != null) {
      final store = _storeBloc.state.storesOfUser
          .firstWhereOrNull((element) => element.id == userStoreId);
      return store;
    }
    return null;
  }

  _onCloseFilter() {
    _filterController.hide();
  }
}
