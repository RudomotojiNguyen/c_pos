import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../common/extensions/extension.dart';
import 'package:c_pos/data/models/models.dart';
import '../../../../widgets/widgets.dart';

class ConditionInfoWidget extends StatelessWidget {
  const ConditionInfoWidget({
    super.key,
    required this.conditions,
    required this.onPressDetail,
  });

  final List<ConditionModel> conditions;
  final Function({required List<int> ids}) onPressDetail;

  @override
  Widget build(BuildContext context) {
    // return ListView.separated(
    //   physics: const NeverScrollableScrollPhysics(),
    //   shrinkWrap: true,
    //   itemBuilder: (context, index) {
    //     return Container();
    //   },
    //   separatorBuilder: (context, index) => BoxSpacer.s10,
    //   itemCount: conditions.length,
    // );
    return Table(
      border: TableBorder.symmetric(
          inside: BorderSide(width: 0.2.sp, style: BorderStyle.solid)),
      columnWidths: const {
        0: FlexColumnWidth(3),
        1: FlexColumnWidth(2),
        2: FlexColumnWidth(2),
        3: FlexColumnWidth(3),
      },
      children: [
        headerWidget(context),
        ...tableContent(context),
      ],
    );
  }

  List<TableRow> tableContent(BuildContext ctx) {
    return List.generate(
      conditions.length,
      (index) {
        final ConditionModel condition = conditions[index];
        return TableRow(children: [
          XBaseButton(
            /// TODO: chỉ để để hiện thị
            // onPressed: () => onPressDetail(ids: condition.getIds),
            padding: EdgeInsets.symmetric(vertical: 6.sp),
            child: Text(
              condition.getName,
              textAlign: TextAlign.center,
              style: AppFont.t.s(11).information,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 6.sp),
            child: Text(
              condition.getBonusPoint.formatNumber,
              textAlign: TextAlign.center,
              style: AppFont.t.s(11),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 6.sp),
            child: Text(
              condition.getMinusPoint.formatNumber,
              textAlign: TextAlign.center,
              style: AppFont.t.s(11),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 6.sp),
            child: Text(
              condition.getPoint.formatCurrency,
              textAlign: TextAlign.center,
              style: AppFont.t.s(11),
            ),
          ),
        ]);
      },
    );
  }

  TableRow headerWidget(BuildContext ctx) {
    return TableRow(children: [
      Padding(
        padding: EdgeInsets.symmetric(vertical: 4.sp),
        child: Text(
          "",
          textAlign: TextAlign.center,
          style: AppFont.t.s(11),
        ),
      ),
      Padding(
        padding: EdgeInsets.symmetric(vertical: 4.sp),
        child: Text(
          "Bán",
          textAlign: TextAlign.center,
          style: AppFont.t.s(11),
        ),
      ),
      Padding(
        padding: EdgeInsets.symmetric(vertical: 4.sp),
        child: Text(
          "Trả",
          textAlign: TextAlign.center,
          style: AppFont.t.s(11),
        ),
      ),
      Padding(
        padding: EdgeInsets.symmetric(vertical: 4.sp),
        child: Text(
          "Hoa hồng",
          textAlign: TextAlign.center,
          style: AppFont.t.s(11),
        ),
      ),
    ]);
  }
}
