import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/configs/box.dart';
import '../widgets.dart';

class LoadingDetailWidget extends StatelessWidget {
  const LoadingDetailWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 16.sp),
      child: Column(
        children: [
          BoxSpacer.s16,
          _storeCreate(),
          BoxSpacer.s16,
          _customerInfo(),
          BoxSpacer.s16,
          _productInfo(),
          BoxSpacer.s16,
          _noteInfo(),
          BoxSpacer.s16,
          _paymentInfo(),
        ],
      ),
    );
  }

  Widget _storeCreate() {
    return XContainerLoading(childContent: BoxSpacer.blank);
  }

  Widget _customerInfo() {
    return XContainerLoading(
      childContent: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BoxSpacer.s8,
          XPlaceHolder(width: 100.sp, height: 12.sp),
          BoxSpacer.s8,
          XPlaceHolder(width: 160.sp, height: 12.sp),
          BoxSpacer.s8,
          XPlaceHolder(width: 160.sp, height: 12.sp),
          BoxSpacer.s8,
          XPlaceHolder(width: 160.sp, height: 12.sp),
        ],
      ),
    );
  }

  Widget _noteInfo() {
    return XContainerLoading(
      childContent: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BoxSpacer.s8,
          XPlaceHolder(width: 100.sp, height: 12.sp),
          BoxSpacer.s8,
          XPlaceHolder(width: double.infinity, height: 12.sp),
          BoxSpacer.s8,
          XPlaceHolder(width: double.infinity, height: 12.sp),
          BoxSpacer.s8,
          XPlaceHolder(width: double.infinity, height: 12.sp),
          BoxSpacer.s8,
          XPlaceHolder(width: double.infinity, height: 12.sp),
          BoxSpacer.s8,
          XPlaceHolder(width: 160.sp, height: 12.sp),
        ],
      ),
    );
  }

  Widget _paymentInfo() {
    return XContainerLoading(
      childContent: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BoxSpacer.s8,
          XPlaceHolder(width: 100.sp, height: 12.sp),
          BoxSpacer.s8,
          XPlaceHolder(width: double.infinity, height: 12.sp),
          BoxSpacer.s8,
          XPlaceHolder(width: double.infinity, height: 12.sp),
          BoxSpacer.s8,
          XPlaceHolder(width: double.infinity, height: 12.sp),
          BoxSpacer.s8,
          XPlaceHolder(width: double.infinity, height: 12.sp),
          BoxSpacer.s8,
          XPlaceHolder(width: 160.sp, height: 12.sp),
        ],
      ),
    );
  }

  Widget _productInfo() {
    return XContainerLoading(
      childContent: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BoxSpacer.s8,
          Row(
            children: [
              XPlaceHolder(
                width: 80.sp,
                height: 80.sp,
              ),
              BoxSpacer.s8,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  XPlaceHolder(width: 160.sp, height: 12.sp),
                  BoxSpacer.s8,
                  XPlaceHolder(width: 100.sp, height: 12.sp),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
