import 'dart:async';

import 'package:c_pos/common/constants/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../common/enum/enum.dart';
import '../../../../../../common/extensions/extension.dart';
import '../../../../../widgets/widgets.dart';
import '../bloc/bill_bloc.dart';

part 'icon_search_type_bill.dart';

class SearchBillWidget extends StatefulWidget {
  const SearchBillWidget({
    super.key,
    required this.billBloc,
  });

  final BillBloc billBloc;

  @override
  State<SearchBillWidget> createState() => _SearchBillWidgetState();
}

class _SearchBillWidgetState extends State<SearchBillWidget> {
  final TextEditingController _searchBillController = TextEditingController();

  Timer? _timer;

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BillBloc, BillState>(
      bloc: widget.billBloc,
      buildWhen: (previous, current) => current is FilterBillSuccess,
      builder: (context, state) {
        return SearchBoxWidget(
          searchController: _searchBillController,
          onSearch: _onChangeText,
          hintStr: 'Tìm kiếm hoá đơn',
          suffixWidget: IconSearchTypeBill(billBloc: widget.billBloc),
          // isFilter: state.filterInfo.isFilter,
          // filterWidget: BillFilterModal(
          //   onSetDefault: () => widget.billBloc.add(SetFilterDefaultEvent()),
          //   onFilter: (StoreModel? store, FilterBillAndOrderType type) {
          //     widget.billBloc.add(FilterBillEvent(type: type, store: store));
          //   },
          //   type: state.filterInfo.type,
          //   store: state.filterInfo.store,
          // ),
        );
      },
    );
    // return Container(
  }

  ///
  /// METHOD
  ///
  _onChangeText(String? value) {
    if (_timer?.isActive ?? false) _timer?.cancel();
    _timer =
        Timer(const Duration(milliseconds: AppConstants.timeSearchValue), () {
      widget.billBloc
          .add(UpdateSearchTextEvent(searchText: (value ?? '').trim()));
    });
  }
}
