import 'package:c_pos/common/constants/app_constants.dart';
import 'package:c_pos/common/constants/go_router.dart';
import 'package:c_pos/common/extensions/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../common/configs/box.dart';
import '../../../../../../common/enum/enum.dart';
import '../../../../../../data/models/customer_model.dart';
import '../../../../../mixins/mixins.dart';
import '../../../../../theme/themes.dart';
import '../../../../../widgets/dialog/operation_create_dialog.dart';
import '../../../../../widgets/widgets.dart';
import '../../../../router.dart';

class CustomerInfo extends StatefulWidget {
  const CustomerInfo({
    super.key,
    required this.customer,
  });

  final CustomerModel customer;

  @override
  State<CustomerInfo> createState() => _CustomerInfoState();
}

class _CustomerInfoState extends State<CustomerInfo> with DialogHelper {
  final GlobalKey<XBaseButtonState> _btnKey = GlobalKey<XBaseButtonState>();

  @override
  Widget build(BuildContext context) {
    return XBaseButton(
      key: _btnKey,
      baseButtonType: BaseButtonType.tapOperation,
      secondaryWidget: _operation(context),
      child: _content(context),
    );
  }

  ///
  /// WIDGET
  ///
  Widget _content(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.sp, vertical: 16.sp),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16.sp),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(80.sp),
            child: XPlaceHolder(
              width: 80.sp,
              height: 80.sp,
            ),
          ),
          BoxSpacer.s8,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.customer.getFullName,
                style: AppFont.t.s(),
              ),
              BoxSpacer.s8,
              Text(
                widget.customer.getCustomerPhone,
                style: AppFont.t.s(),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _operation(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.sp),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// todo: làm thêm các tính năng
          // RowFunctionWidget(
          //   title: XProductOperationAction.update.getTitle,
          //   icon: XProductOperationAction.update.getIcon,
          //   onPressed: () {
          //     //
          //   },
          // ),
          // RowFunctionWidget(
          //   title: XProductOperationAction.detail.getTitle,
          //   icon: XProductOperationAction.detail.getIcon,
          //   onPressed: () {
          //     MainRouter.instance.pushNamed(
          //       context,
          //       routeName: RouteName.customer,
          //       queryParameters: {'customerId': widget.customer.id?.toString()},
          //     );
          //   },
          // ),
          // RowFunctionWidget(
          //   title: XProductOperationAction.addMore.getTitle,
          //   icon: XProductOperationAction.addMore.getIcon,
          //   onPressed: () {
          //     showXBottomSheet(
          //       context,
          //       key: GlobalAppKey.selectBillTypeDialogKey,
          //       body: const OperationCreateDialog(),
          //     );
          //   },
          // ),
          // BoxSpacer.s8,
        ],
      ),
    );
  }
}
