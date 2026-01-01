import 'package:c_pos/common/extensions/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/configs/box.dart';
import '../../theme/colors.dart';
import '../widgets.dart';
import '../../../data/models/employee_sub_detail_model.dart';

class EmployeeDetailWidget extends StatelessWidget {
  const EmployeeDetailWidget({super.key, required this.employeeSubDetail});

  final EmployeeSubDetailModel employeeSubDetail;

  @override
  Widget build(BuildContext context) {
    return XContainer(
      margin: EdgeInsets.only(top: 16.sp),
      iconTitle: Icon(
        Icons.person,
        size: 18.sp,
        color: AppColors.neutral3Color,
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
          _renderEmployeeInfo(
            context,
            title: 'Nhân viên kỹ thuật',
            value: employeeSubDetail.technical?.fullName ?? '',
          ),
          _renderEmployeeInfo(
            context,
            title: 'Nhân viên CDPK',
            value: employeeSubDetail.cdpk?.fullName ?? '',
          ),
          _renderEmployeeInfo(
            context,
            title: 'Nhân viên thu ngân',
            value: employeeSubDetail.cashier?.fullName ?? '',
          ),
          _renderEmployeeInfo(
            context,
            title: 'Nhân viên quản lý',
            value: employeeSubDetail.manager?.fullName ?? '',
          ),
          _renderEmployeeInfo(
            context,
            title: 'Nhân viên trợ lý',
            value: employeeSubDetail.assistant?.fullName ?? '',
          ),
          _renderEmployeeInfo(
            context,
            title: 'Nhân viên tiếp đón',
            value: employeeSubDetail.receptionist?.fullName ?? '',
          ),
          _renderEmployeeInfo(
            context,
            title: 'Nhân viên giao hàng',
            value: employeeSubDetail.delivery?.fullName ?? '',
          ),
        ],
      ),
    );
  }

  Widget _renderEmployeeInfo(BuildContext context,
      {required String title, required String value}) {
    if (value.isNullOrEmpty) {
      return BoxSpacer.blank;
    }
    return Column(
      children: [
        const XDivider(),
        RowDetail(
          title: title,
          value: value,
        ),
      ],
    );
  }
}
