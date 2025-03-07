import 'dart:async';

import 'package:c_pos/common/constants/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../common/enum/enum.dart';
import '../../../../../../common/extensions/extension.dart';
import '../../../../../../data/models/store_model.dart';
import '../../../../../widgets/widgets.dart';
import '../../bloc/order_bloc.dart';
import 'order_modal_filter.dart';

part 'icon_search_type_order.dart';

class SearchOrderWidget extends StatefulWidget {
  const SearchOrderWidget({super.key, required this.orderBloc});

  final OrderBloc orderBloc;

  @override
  State<SearchOrderWidget> createState() => _SearchOrderWidgetState();
}

class _SearchOrderWidgetState extends State<SearchOrderWidget> {
  final TextEditingController _searchOrderController = TextEditingController();

  Timer? _timer;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrderBloc, OrderState>(
      bloc: widget.orderBloc,
      buildWhen: (previous, current) => current is FilterOrderSuccess,
      builder: (context, state) {
        return SearchBoxWidget(
          onSearch: _onChangeText,
          searchController: _searchOrderController,
          hintStr: 'Nhập thông tin tìm kiếm',
          filterWidget: OrderModalFilter(
            status: state.orderFilter.status,
            time: state.orderFilter.time,
            type: state.orderFilter.type,
            store: state.orderFilter.store,
            onFilter: (StatusEnum? status, FilterBillAndOrderType? type,
                FilterTime? time, StoreModel? store) {
              widget.orderBloc.add(FilterOrderEvent(
                status: status,
                type: type,
                time: time,
                store: store,
              ));
            },
            onDefault: () {
              widget.orderBloc.add(SetDefaultFilterEvent());
            },
          ),
          isFilter: state.orderFilter.isFilter,
          suffixWidget: IconSearchTypeOrder(orderBloc: widget.orderBloc),
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
      widget.orderBloc.add(
          FilterOrderEvent(searchValue: _searchOrderController.text.trim()));
    });
  }
}
