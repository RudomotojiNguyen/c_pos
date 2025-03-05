import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../common/configs/box.dart';
import '../../../../../common/di/injection/injection.dart';
import '../../../../../common/extensions/extension.dart';
import '../../../../../data/models/reward_report_model.dart';
import '../../../../mixins/mixins.dart';
import '../../../../theme/themes.dart';
import '../../../../widgets/widgets.dart';
import '../bloc/affiliate_bloc.dart';
import 'condition_info_widget.dart';

class CommissionItemDetail extends StatefulWidget {
  const CommissionItemDetail({
    super.key,
    required this.commission,
    required this.fromDate,
    required this.toDate,
    required this.jobTitleId,
  });

  final List<ListDetailCommission> commission;
  final DateTime fromDate;
  final DateTime toDate;
  final int jobTitleId;

  @override
  State<CommissionItemDetail> createState() => _CommissionItemDetailState();
}

class _CommissionItemDetailState extends State<CommissionItemDetail>
    with AutomaticKeepAliveClientMixin, DialogHelper {
  final AffiliateBloc _affiliateBloc = getIt.get<AffiliateBloc>();

  @override
  Widget build(BuildContext context) {
    super.build(context);

    if (widget.commission.isEmpty) {
      return const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          EmptyDataWidget(
            emptyMessage: 'Chưa có thông tin',
          )
        ],
      );
    }

    return ListView.separated(
      padding: EdgeInsets.symmetric(horizontal: 16.sp, vertical: 16.sp),
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) {
        final ListDetailCommission detail = widget.commission[index];
        final List<ConditionModel> conditions = detail.getConditions;

        return Container(
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(8.sp),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: EdgeInsets.all(12.sp).copyWith(bottom: 0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.info_outline,
                      size: 16.sp,
                      color: AppColors.primaryColor,
                    ),
                    BoxSpacer.s4,
                    Expanded(
                      child: Text(
                        detail.name ?? '',
                        style: AppFont.t.s().primaryColor,
                      ),
                    ),
                  ],
                ),
              ),
              const XDivider(),
              ConditionInfoWidget(
                conditions: conditions,
                onPressDetail: ({required ids}) {
                  _onPressDetail(
                    ids: ids,
                    roleId: widget.jobTitleId,
                  );
                },
              ),
              BoxSpacer.s8,
            ],
          ),
        );
      },
      separatorBuilder: (context, index) => BoxSpacer.s10,
      itemCount: widget.commission.length,
    );
  }

  _onPressDetail({
    required int roleId,
    required List<int> ids,
  }) {
    _affiliateBloc.add(GetCommissionDetailEvent(
      ids: ids,
      roleId: roleId,
      toDate: widget.toDate,
      fromDate: widget.fromDate,
    ));

    showXBottomSheet(
      context,
      body: ConditionDetailDialog(affiliateBloc: _affiliateBloc),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
