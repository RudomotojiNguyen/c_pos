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
          const XPlaceHolder(width: 100, height: 12),
          BoxSpacer.s8,
          const XPlaceHolder(width: 160, height: 12),
          BoxSpacer.s8,
          const XPlaceHolder(width: 160, height: 12),
          BoxSpacer.s8,
          const XPlaceHolder(width: 160, height: 12),
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
          const XPlaceHolder(width: 100, height: 12),
          BoxSpacer.s8,
          const XPlaceHolder(width: double.infinity, height: 12),
          BoxSpacer.s8,
          const XPlaceHolder(width: double.infinity, height: 12),
          BoxSpacer.s8,
          const XPlaceHolder(width: double.infinity, height: 12),
          BoxSpacer.s8,
          const XPlaceHolder(width: double.infinity, height: 12),
          BoxSpacer.s8,
          const XPlaceHolder(width: 160, height: 12),
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
          const XPlaceHolder(width: 100, height: 12),
          BoxSpacer.s8,
          const XPlaceHolder(width: double.infinity, height: 12),
          BoxSpacer.s8,
          const XPlaceHolder(width: double.infinity, height: 12),
          BoxSpacer.s8,
          const XPlaceHolder(width: double.infinity, height: 12),
          BoxSpacer.s8,
          const XPlaceHolder(width: double.infinity, height: 12),
          BoxSpacer.s8,
          const XPlaceHolder(width: 160, height: 12),
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
              const XPlaceHolder(
                width: 80,
                height: 80,
              ),
              BoxSpacer.s8,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const XPlaceHolder(width: 160, height: 12),
                  BoxSpacer.s8,
                  const XPlaceHolder(width: 100, height: 12),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
