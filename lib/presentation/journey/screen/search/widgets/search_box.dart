part of '../search_screen.dart';

class SearchBox extends StatefulWidget {
  const SearchBox({super.key, required this.searchProductBloc});

  final SearchProductBloc searchProductBloc;

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
    // return XTextField(
    //   hintText: 'Tìm sản phẩm ...',
    //   controller: _searchController,
    //   onChanged: (value) => _onChangeText(value),
    //   suffixWidget: CustomizePopUpWidget(
    //     content: _dataSearchType(context),
    //     child: _contentSearchType(context),
    //   ),
    // );
    return SearchBoxWidget(
      onSearch: _onChangeText,
      searchController: _searchController,
      hintStr: 'Tìm sản phẩm ...',
      // filterWidget: _dataSearchType(context),
      // isFilter: false,
    );
  }

  ///
  /// WIDGETS
  ///

  Widget _dataSearchType(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        XTextButton(
          title: SearchType.productName.getTitle,
          onPressed: () {
            onChangeSearchTypeEvent(SearchType.productName);
          },
        ),
        XTextButton(
          title: SearchType.imei.getTitle,
          onPressed: () {
            onChangeSearchTypeEvent(SearchType.imei);
          },
        ),
        XTextButton(
          title: SearchType.phoneProduct.getTitle,
          onPressed: () {
            onChangeSearchTypeEvent(SearchType.phoneProduct);
          },
        ),
        XTextButton(
          title: SearchType.accessoriesProduct.getTitle,
          onPressed: () {
            onChangeSearchTypeEvent(SearchType.accessoriesProduct);
          },
        ),
        XTextButton(
          title: SearchType.productCombo.getTitle,
          onPressed: () {
            onChangeSearchTypeEvent(SearchType.productCombo);
          },
        ),
      ],
    );
  }

  // Widget _contentSearchType(BuildContext context) {
  //   return Padding(
  //     padding: EdgeInsets.symmetric(vertical: 4.sp),
  //     child: BlocBuilder<SearchProductBloc, SearchProductState>(
  //       bloc: widget.searchProductBloc,
  //       buildWhen: (previous, current) => current is ChangeSearchTypeSuccess,
  //       builder: (context, state) {
  //         return Text(
  //           state.searchType.getShortTitle,
  //           style: AppFont.t.s(),
  //         );
  //       },
  //     ),
  //   );
  // }

  ///
  ///   METHODS
  ///

  onChangeSearchTypeEvent(SearchType type) {
    widget.searchProductBloc.add(ChangeSearchTypeEvent(searchType: type));
    Navigator.pop(context);
  }

  _onChangeText(String? value) {
    if (_timer?.isActive ?? false) _timer?.cancel();
    _timer =
        Timer(const Duration(milliseconds: AppConstants.timeSearchValue), () {
      final String textValue = _searchController.text.trim();
      if (textValue.isNullOrEmpty) {
        widget.searchProductBloc.add(RefreshProductsEvent());
      } else {
        widget.searchProductBloc.add(OnSearchProductsEvent(textValue));
      }
    });
  }
}
