import 'dart:async';

import 'package:c_pos/common/constants/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../widgets/widgets.dart';
import '../../bloc/trade_in_bloc.dart';
import 'filter_trade_in_modal.dart';
import 'icon_search_type_trade_in.dart';

class SearchTradeInWidget extends StatefulWidget {
  const SearchTradeInWidget({super.key, required this.tradeInBloc});

  final TradeInBloc tradeInBloc;

  @override
  State<SearchTradeInWidget> createState() => _SearchTradeInWidgetState();
}

class _SearchTradeInWidgetState extends State<SearchTradeInWidget> {
  final TextEditingController _searchOrderController = TextEditingController();
  Timer? _timer;

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TradeInBloc, TradeInState>(
      bloc: widget.tradeInBloc,
      buildWhen: (previous, current) =>
          current is UpdateFilterSuccess ||
          current is UpdateDefaultFilterSuccess,
      builder: (context, state) {
        return SearchBoxWidget(
          searchController: _searchOrderController,
          onSearch: _onChangeText,
          hintStr: 'Nhập thông tin tìm kiếm',
          suffixWidget: IconSearchTypeTradeIn(tradeInBloc: widget.tradeInBloc),
          isFilter: state.filterInfo.isFilter,
          filterWidget: FilterTradeInModal(
            onFilter: (dates) {
              switch (dates.length) {
                case 1:
                  widget.tradeInBloc
                      .add(UpdateFilterEvent(fromDate: dates.first));
                  break;
                case 2:
                  widget.tradeInBloc.add(UpdateFilterEvent(
                      fromDate: dates.first, toDate: dates.last));
                  break;
                default:
                  break;
              }
            },
            onSetDefaultFilter: () {
              _searchOrderController.text = '';
              widget.tradeInBloc.add(SetDefaultFilter());
            },
            data: state.filterInfo.getDates,
          ),
        );
      },
    );
  }

  ///
  /// METHOD
  ///
  _onChangeText(String? value) {
    if (_timer?.isActive ?? false) _timer?.cancel();
    _timer =
        Timer(const Duration(milliseconds: AppConstants.timeSearchValue), () {
      widget.tradeInBloc.add(OnChangeTextSearchEvent(searchValue: value));
    });
  }
}
