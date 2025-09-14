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

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SearchBoxWidget(
      onSearch: _onChangeText,
      searchController: _searchController,
      hintStr: 'Tìm sản phẩm ...',
      filterWidget: _dataSearchType(),
      suffixWidget: _contentSearchType(),
    );
  }

  ///
  /// WIDGETS
  ///

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
        XTextButton(
          title: SearchType.productCombo.getTitle,
          onPressed: () {
            onChangeSearchTypeEvent(SearchType.productCombo);
          },
        ),
        XTextButton(
          title: SearchType.service.getTitle,
          onPressed: () {
            onChangeSearchTypeEvent(SearchType.service);
          },
        ),
      ],
    );
  }

  Widget _contentSearchType() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4.sp),
      child: BlocBuilder<StockBloc, StockState>(
        bloc: widget.searchProductBloc,
        buildWhen: (previous, current) => current is UpdateFilterSuccess,
        builder: (context, state) {
          return Text(
            state.productStockFilter.searchType?.getShortTitle ?? '',
            style: AppFont.t.s(),
          );
        },
      ),
    );
  }

  ///
  ///   METHODS
  ///

  onChangeSearchTypeEvent(SearchType type) {
    widget.searchProductBloc.add(UpdateFilterEvent(searchType: type));
    Navigator.pop(context);
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
}
