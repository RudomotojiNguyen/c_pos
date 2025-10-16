import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/configs/box.dart';
import '../../../gen/gen.dart';
import '../widgets.dart';
import '../../../data/models/employee_sub_detail_model.dart';

class EmployeeDetailWidget extends StatelessWidget {
  const EmployeeDetailWidget({super.key, required this.employeeSubDetail});

  final EmployeeSubDetailModel employeeSubDetail;

  @override
  Widget build(BuildContext context) {
    return XContainer(
      margin: EdgeInsets.only(top: 16.sp),
      iconTitle: Assets.svg.person.svg(
        width: 22.sp,
        height: 22.sp,
      ),
      containerType: ContainerType.expand,
      initiallyExpanded: false,
      title: 'Thông tin nhân viên',
      child: Column(
        children: [
          BoxSpacer.s8,
          RowDetail(
            title: 'Nhân viên bán hàng',
            value: employeeSubDetail.employee?.fullName ?? '',
          ),
          const XDivider(),
          RowDetail(
            title: 'Nhân viên kỹ thuật',
            value: employeeSubDetail.technical?.fullName ?? '',
          ),
          const XDivider(),
          RowDetail(
            title: 'Nhân viên CDPK',
            value: employeeSubDetail.cdpk?.fullName ?? '',
          ),
          const XDivider(),
          RowDetail(
            title: 'Nhân viên thu ngân',
            value: employeeSubDetail.cashier?.fullName ?? '',
          ),
          const XDivider(),
          RowDetail(
            title: 'Nhân viên quản lý',
            value: employeeSubDetail.manager?.fullName ?? '',
          ),
          const XDivider(),
          RowDetail(
            title: 'Nhân viên trợ lý',
            value: employeeSubDetail.assistant?.fullName ?? '',
          ),
          const XDivider(),
          RowDetail(
            title: 'Nhân viên tiếp đón',
            value: employeeSubDetail.receptionist?.fullName ?? '',
          ),
          const XDivider(),
          RowDetail(
            title: 'Nhân viên giao hàng',
            value: employeeSubDetail.delivery?.fullName ?? '',
          ),
          const XDivider(),
        ],
      ),
    );
  }
}
