import 'package:c_pos/common/extensions/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/configs/box.dart';
import '../../../gen/gen.dart';
import '../widgets.dart';

class NormalDetailWidget extends StatelessWidget {
  const NormalDetailWidget({
    super.key,
    required this.storeName,
    required this.createDate,
    this.employeeName,
    this.userAssignee,
    this.id,
    this.statusName,
    this.statusColor,
    this.point,
    this.cashierName,
    this.techName,
    this.typeName,
    this.orderSource,
    this.orderType,
    this.checkDate,
    this.checkTime,
  });

  final String storeName;
  final String createDate;
  final String? employeeName;
  final String? userAssignee;
  final String? cashierName;
  final String? techName;
  final String? id;
  final num? point;
  final String? typeName;

  final String? statusName;
  final Color? statusColor;
  final String? orderSource;
  final String? orderType;
  final String? checkDate;
  final String? checkTime;

  @override
  Widget build(BuildContext context) {
    return XContainer(
      title: id?.toString() ?? 'Thông tin chung',
      iconTitle: Assets.svg.invoice.svg(
        width: 24.sp,
        height: 24.sp,
      ),
      child: Column(
        children: [
          if (typeName.isNotNullOrEmpty) ...[
            _rowInfoStatus(context, title: 'Loại', value: typeName),
            BoxSpacer.s8,
          ],
          if (createDate.isNotEmpty) ...[
            _rowInfo(context, title: 'Tạo lúc', value: createDate),
          ],
          if (storeName.isNotEmpty) ...[
            BoxSpacer.s8,
            _rowInfo(context, title: 'Cửa hàng', value: storeName),
          ],
          if (statusName.isNotNullOrEmpty) ...[
            BoxSpacer.s8,
            _rowInfoStatus(context, title: 'Trạng thái', value: statusName),
          ],
          if (orderSource.isNotNullOrEmpty) ...[
            BoxSpacer.s8,
            _rowInfo(
              context,
              title: 'Nguồn đơn hàng',
              value: orderSource,
            ),
          ],
          if (orderType.isNotNullOrEmpty) ...[
            BoxSpacer.s4,
            _rowInfo(
              context,
              title: 'Loại đơn',
              value: orderType,
            ),
          ],
          if (checkDate.isNotNullOrEmpty) ...[
            BoxSpacer.s4,
            _rowInfo(
              context,
              title: 'Ngày đến cửa hàng',
              value: checkDate,
            ),
          ],
          if (checkTime.isNotNullOrEmpty) ...[
            BoxSpacer.s4,
            _rowInfo(
              context,
              title: 'Giờ đến cửa hàng',
              value: checkTime,
            ),
          ],
          if (employeeName.isNotNullOrEmpty) ...[
            BoxSpacer.s8,
            _rowInfo(context, title: 'Nhân viên', value: employeeName),
          ],
          if (userAssignee.isNotNullOrEmpty) ...[
            BoxSpacer.s8,
            _rowInfo(context, title: 'Người duyệt', value: userAssignee),
          ],
          if (cashierName.isNotNullOrEmpty) ...[
            BoxSpacer.s8,
            _rowInfo(context, title: 'Thu ngân', value: cashierName),
          ],
          if (techName.isNotNullOrEmpty) ...[
            BoxSpacer.s8,
            _rowInfo(context, title: 'Kỹ thuật', value: techName),
          ],
          if (point != null && point! > 0) ...[
            BoxSpacer.s8,
            _rowInfo(context, title: 'Điểm thưởng', value: point!.formatNumber),
          ],
        ],
      ),
    );
  }

  Widget _rowInfo(BuildContext context,
      {required String title, String? value}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          flex: 1,
          child: Text(
            title,
            style: AppFont.t.s(),
          ),
        ),
        if (value.isNotNullOrEmpty) ...[
          Expanded(
            flex: 1,
            child: Text(
              value!,
              style: AppFont.t.s(),
              textAlign: TextAlign.right,
            ),
          ),
        ],
      ],
    );
  }

  Widget _rowInfoStatus(BuildContext context,
      {required String title, String? value}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          flex: 1,
          child: Text(
            title,
            style: AppFont.t.s(),
          ),
        ),
        if (value.isNotNullOrEmpty) ...[
          XStatus(
            statusStr: value!,
            bgColor: statusColor,
          ),
        ],
      ],
    );
  }
}
