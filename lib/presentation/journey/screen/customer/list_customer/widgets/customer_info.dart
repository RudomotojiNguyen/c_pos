import 'package:c_pos/common/constants/app_constants.dart';
import 'package:c_pos/common/constants/go_router.dart';
import 'package:c_pos/common/extensions/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../common/configs/box.dart';
import '../../../../../../common/enum/enum.dart';
import 'package:c_pos/data/models/models.dart';
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
  @override
  Widget build(BuildContext context) {
    return XBaseButton(
      baseButtonType: BaseButtonType.tapOperation,
      secondaryWidgetBuilder: (closeOverlay) =>
          _operation(context, closeOverlay),
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
        borderRadius: BorderRadius.all(AppRadius.l),
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(8.sp),
            decoration: BoxDecoration(
              border: Border.all(
                color: AppColors.primaryColor,
                width: 1.sp,
              ),
              borderRadius: BorderRadius.all(AppRadius.xxl),
            ),
            child: Icon(
              Icons.person,
              size: 24.sp,
              color: AppColors.primaryColor,
            ),
          ),
          BoxSpacer.s8,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.customer.getFullName,
                style: AppFont.t.s().w800,
              ),
              BoxSpacer.s4,
              Row(
                children: [
                  Icon(
                    Icons.phone,
                    size: 13.sp,
                    color: AppColors.neutral2Color,
                  ),
                  BoxSpacer.s4,
                  Text(
                    widget.customer.getCustomerPhone,
                    style: AppFont.t.s(12).neutral2,
                  ),
                ],
              ),
              BoxSpacer.s4,
              Text(
                widget.customer.getPoint.formatPoint,
                style: AppFont.t.s(12).neutral2,
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _operation(
      BuildContext context, Future<void> Function() closeOverlay) {
    return Container(
      padding: EdgeInsets.all(8.sp),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// todo: làm thêm các tính năng
          RowFunctionWidget(
            title: XProductOperationAction.update.getTitle,
            icon: XProductOperationAction.update.getIcon,
            onPressed: () async {
              await closeOverlay();
              MainRouter.instance.pushNamed(
                context,
                routeName: RouteName.customerUpdate,
                queryParameters: {'customerId': widget.customer.id?.toString()},
              );
            },
          ),
          RowFunctionWidget(
            title: XProductOperationAction.customerDetail.getTitle,
            icon: XProductOperationAction.customerDetail.getIcon,
            onPressed: () async {
              await closeOverlay();
              MainRouter.instance.pushNamed(
                context,
                routeName: RouteName.customer,
                queryParameters: {'customerId': widget.customer.id?.toString()},
              );
            },
          ),
          RowFunctionWidget(
            title: XProductOperationAction.addMore.getTitle,
            icon: XProductOperationAction.addMore.getIcon,
            onPressed: () async {
              await closeOverlay();
              showXBottomSheet(
                context,
                key: GlobalAppKey.selectBillTypeDialogKey,
                body: const OperationCreateDialog(),
              );
            },
          ),
          BoxSpacer.s8,
        ],
      ),
    );
  }
}
