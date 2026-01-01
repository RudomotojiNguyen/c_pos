import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../common/configs/box.dart';
import '../../../../../../common/enum/enum.dart';
import '../../../../../../common/extensions/extension.dart';
import 'package:c_pos/data/models/models.dart';
import '../../../../../theme/colors.dart';
import '../../../../../widgets/widgets.dart';

class TradeCheckListWidget extends StatelessWidget {
  const TradeCheckListWidget({super.key, this.listCriteria = const []});

  final List<CriteriaGroupModel> listCriteria;

  @override
  Widget build(BuildContext context) {
    if (this.listCriteria.isEmpty) return BoxSpacer.blank;
    List<CriteriaGroupModel> listCriteria = [...this.listCriteria]
        .where((element) => element.getListCheck.isNotEmpty)
        .toList();

    if (listCriteria.isEmpty) {
      return XContainer(
        margin: EdgeInsets.only(top: 16.sp),
        iconTitle: Icon(
          Icons.checklist,
          size: 18.sp,
          color: AppColors.neutral3Color,
        ),
        title: 'Tình trạng máy',
        child: const EmptyDataWidget(emptyMessage: 'Không chọn tiêu chí nào'),
      );
    }

    return XContainer(
      margin: EdgeInsets.only(top: 16.sp),
      iconTitle: Icon(
        Icons.checklist,
        size: 18.sp,
        color: AppColors.neutral3Color,
      ),
      title: 'Tình trạng máy',
      child: ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          final CriteriaGroupModel criteriaGroup = listCriteria[index];
          List<CriteriaModel> listCheck = criteriaGroup.getListCheck;

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                criteriaGroup.getGroupName,
                style: AppFont.t.s(),
              ),
              BoxSpacer.s8,
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  final CriteriaModel criteria = listCheck[index];
                  return CriteriaItemWidget(
                    criteriaName: criteria.getName,
                    price: criteria.getAmount,
                    operatorType: criteria.getOperatorType,
                  );
                },
                separatorBuilder: (context, index) => BoxSpacer.s4,
                itemCount: listCheck.length,
              ),
            ],
          );
        },
        separatorBuilder: (context, index) => XDivider(
          padding: EdgeInsets.symmetric(vertical: 8.sp),
        ),
        itemCount: listCriteria.length,
      ),
    );
  }
}

class CriteriaItemWidget extends StatelessWidget {
  const CriteriaItemWidget({
    super.key,
    required this.criteriaName,
    required this.price,
    required this.operatorType,
  });

  final String criteriaName;
  final double price;
  final XExpression operatorType;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          flex: 7,
          child: Text(
            '• $criteriaName',
            style: AppFont.t.s(),
          ),
        ),
        Expanded(
          flex: 3,
          child: Text(
            '${operatorType.getExpressionStr} ${price.formatCurrency}',
            style: AppFont.t.s().copyWith(
                  color: operatorType.getExpressionColor,
                ),
            textAlign: TextAlign.end,
          ),
        ),
      ],
    );
  }
}
