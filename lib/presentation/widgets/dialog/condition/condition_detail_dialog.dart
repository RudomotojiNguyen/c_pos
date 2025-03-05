import 'package:dynamic_tabbar/dynamic_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../common/configs/box.dart';
import '../../../../common/constants/go_router.dart';
import '../../../../common/extensions/extension.dart';
import '../../../../data/models/commission_detail_model.dart';
import '../../../../gen/gen.dart';
import '../../../journey/router.dart';
import '../../../journey/screen/commission/bloc/affiliate_bloc.dart';
import '../../../theme/themes.dart';
import '../../widgets.dart';

part 'condition_bill_item.dart';
part 'condition_item_data.dart';
part 'condition_list_data.dart';

class ConditionDetailDialog extends StatefulWidget {
  const ConditionDetailDialog({super.key, required this.affiliateBloc});

  final AffiliateBloc affiliateBloc;

  @override
  State<ConditionDetailDialog> createState() => _ConditionDetailDialogState();
}

class _ConditionDetailDialogState extends State<ConditionDetailDialog> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const HeaderDialog(title: 'Chi tiết'),
        BlocBuilder<AffiliateBloc, AffiliateState>(
          bloc: widget.affiliateBloc,
          buildWhen: (previous, current) =>
              current is GetCommissionDetailLoading ||
              current is GetCommissionDetailSuccess,
          builder: (context, state) {
            if (state is GetCommissionDetailLoading) {
              return const XLoading();
            }

            CommissionDetailModel? detail =
                state is GetCommissionDetailSuccess ? state.detail : null;

            // ignore: unnecessary_null_comparison
            if (detail == null) {
              return const EmptyDataWidget(emptyMessage: 'Không có dữ liệu');
            }

            return SizedBox(
              height: context.mediaQuery.size.height - 180.sp,
              child: Column(
                children: [
                  Expanded(
                    child: ConditionListData(
                      bills: detail.bills ?? [],
                      billRefunds: detail.billRefunds ?? [],
                    ),
                  ),
                  BoxSpacer.s16,
                  _totalAmount(detail.getTotalPoints),
                ],
              ),
            );
          },
        ),
      ],
    );
  }

  Widget _totalAmount(double amount) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          'Tổng hoa hồng',
          style: AppFont.t.s(16),
        ),
        Text(
          '≈ ${amount.formatCurrency}',
          style: AppFont.t.s(24).w900.green,
        ),
      ],
    );
  }
}
