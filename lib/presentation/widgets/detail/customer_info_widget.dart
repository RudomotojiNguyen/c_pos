import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/configs/box.dart';
import '../../../common/extensions/extension.dart';
import '../../../gen/gen.dart';
import '../widgets.dart';

class CustomerInfoWidget extends StatelessWidget {
  const CustomerInfoWidget({
    super.key,
    required this.customerName,
    required this.customerPhone,
    required this.customerIdCart,
    required this.customerLocation,
    this.customerDOB,
    this.customerTypeName,
  });

  final String customerName;
  final String customerPhone;
  final String customerIdCart;
  final String customerLocation;
  final String? customerDOB;
  final String? customerTypeName;

  @override
  Widget build(BuildContext context) {
    return XContainer(
      margin: EdgeInsets.only(top: 16.sp),
      iconTitle: Assets.svg.customer.svg(
        width: 22.sp,
        height: 22.sp,
      ),
      rightIcon: _rightWidget(),
      title: customerName,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          BoxSpacer.s8,
          Row(
            children: [
              Icon(Icons.phone, size: 18.sp),
              BoxSpacer.s8,
              Text(
                customerPhone,
                style: AppFont.t.s(),
              ),
              BoxSpacer.s8,
              CopyButton(text: customerPhone),
            ],
          ),
          if (customerIdCart.isNotEmpty) ...[
            BoxSpacer.s8,
            Row(
              children: [
                Icon(Icons.person, size: 18.sp),
                BoxSpacer.s8,
                Text(
                  customerIdCart,
                  style: AppFont.t.s(),
                ),
              ],
            ),
          ],
          if (customerLocation.isNotEmpty) ...[
            BoxSpacer.s8,
            Row(
              children: [
                Icon(Icons.location_pin, size: 18.sp),
                BoxSpacer.s8,
                Text(
                  customerLocation,
                  style: AppFont.t.s(),
                ),
              ],
            ),
          ],
          if (customerDOB.isNotNullOrEmpty) ...[
            BoxSpacer.s8,
            Row(
              children: [
                Icon(Icons.calendar_month, size: 18.sp),
                BoxSpacer.s8,
                Text(
                  customerDOB!,
                  style: AppFont.t.s(),
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }

  Widget _rightWidget() {
    if (customerTypeName.isNotNullOrEmpty) {
      return RankInfoWidget(customerRank: customerTypeName!);
    }

    return BoxSpacer.blank;
  }
}
