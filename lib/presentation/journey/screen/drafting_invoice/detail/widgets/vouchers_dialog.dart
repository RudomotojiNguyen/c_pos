import 'dart:async';

import 'package:c_pos/common/extensions/extension.dart';
import 'package:c_pos/presentation/journey/screen/voucher/bloc/voucher_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../../../../common/constants/app_constants.dart';
import '../../../../../../common/di/injection/injection.dart';
import '../../../../../../data/models/models.dart';
import '../../../../../widgets/voucher/basic_voucher.dart';
import '../../../../../widgets/widgets.dart';

class VouchersDialog extends StatefulWidget {
  const VouchersDialog({
    super.key,
    required this.productId,
    required this.productAmount,
    this.storeId,
    this.customerPhone,
  });

  final String productId;
  final double productAmount;
  final int? storeId;
  final String? customerPhone;

  @override
  State<VouchersDialog> createState() => _VouchersDialogState();
}

class _VouchersDialogState extends State<VouchersDialog> {
  final VoucherBloc _voucherBloc = getIt.get<VoucherBloc>();
  final RefreshController _refreshController = RefreshController(
    initialRefresh: false,
  );
  final TextEditingController _searchController = TextEditingController();
  Timer? _timer;

  final ValueNotifier<List<VoucherModel>> _vouchers = ValueNotifier([]);
  final ValueNotifier<List<VoucherModel>> _vouchersSearch = ValueNotifier([]);

  @override
  void initState() {
    super.initState();
    _voucherBloc.add(GetVoucherEvent(
      productId: widget.productId,
      productAmount: widget.productAmount,
      storeId: widget.storeId,
      customerPhone: widget.customerPhone,
    ));
  }

  @override
  void dispose() {
    _refreshController.dispose();
    _timer?.cancel();
    _vouchers.dispose();
    _vouchersSearch.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const HeaderDialog(title: 'Voucher sản phẩm'),
        Expanded(child: _renderProductList()),
        _renderSearchBox(),
      ],
    );
  }

  ///
  /// WIDGET
  ///
  Widget _renderSearchBox() {
    return SearchBoxWidget(
      onSearch: _onChangeText,
      searchController: _searchController,
      hintStr: 'Tìm kiếm voucher',
    );
  }

  Widget _renderProductList() {
    return BlocConsumer<VoucherBloc, VoucherState>(
      bloc: _voucherBloc,
      buildWhen: (previous, current) =>
          current is GetVoucherLoading ||
          current is UpdateVouchersSuccess ||
          current is UpdateVouchersError,
      listener: (context, state) {
        if (state is UpdateVouchersSuccess) {
          _vouchers.value = state.vouchers;
          _vouchersSearch.value = state.vouchers;
        }
      },
      builder: (context, state) {
        if (state is GetVoucherLoading) {
          return const XLoading();
        }
        if (state is UpdateVouchersError) {
          return EmptyDataWidget(emptyMessage: state.error);
        }

        return ValueListenableBuilder(
            valueListenable: _vouchersSearch,
            builder: (context, vouchers, _) {
              return XGridView(
                type: XGridViewType.aligned,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                crossAxisCount: context.isSmallScreen ? 1 : 2,
                mainAxisSpacing: 16.sp,
                crossAxisSpacing: 16.sp,
                itemCount: vouchers.length,
                itemBuilder: (context, index) {
                  final voucher = vouchers[index];
                  return BasicVoucherCard(
                    voucherName: voucher.getName,
                    voucherCode: voucher.getCode,
                    voucherValue: voucher.getVoucherValue,
                    maxValue: voucher.getMaxValue,
                    usable: voucher.getUsable,
                    onSelectVoucher: () {
                      Navigator.pop(context, voucher);
                    },
                  );
                },
              );
            });
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
      final String textValue = _searchController.text.trim();
      final List<VoucherModel> vouchers = _vouchers.value;

      if (textValue.isNullOrEmpty) {
        _vouchersSearch.value = vouchers;
      } else {
        _vouchersSearch.value = vouchers
            .where((voucher) =>
                voucher.getName
                    .toLowerCase()
                    .contains(textValue.toLowerCase()) ||
                voucher.getCode.toLowerCase().contains(textValue.toLowerCase()))
            .toList();
      }
    });
  }
}
