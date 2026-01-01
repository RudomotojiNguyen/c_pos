import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../common/constants/go_router.dart';
import '../../common/extensions/extension.dart';
import '../journey/router.dart';
import '../theme/themes.dart';
import 'widgets.dart';

class InfoIdUpdateWidget extends StatefulWidget {
  const InfoIdUpdateWidget({super.key, required this.orderId});

  final int orderId;

  @override
  State<InfoIdUpdateWidget> createState() => _InfoIdUpdateWidgetState();
}

class _InfoIdUpdateWidgetState extends State<InfoIdUpdateWidget> {
  @override
  Widget build(BuildContext context) {
    return XContainer(
      bgColor: AppColors.pinkLightColor,
      margin: EdgeInsets.only(
        bottom: 16.sp,
      ),
      child: XBaseButton(
        onPressed: _onDetailOrder,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(Icons.shopping_bag,
                    size: 18.sp, color: AppColors.neutral3Color),
                SizedBox(width: 8.sp),
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: 'Từ đơn hàng:',
                        style: AppFont.t.s(),
                        children: [
                          const TextSpan(text: ' '),
                          TextSpan(
                            text: widget.orderId.toString(),
                            style: AppFont.t.s().w700.information,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Icon(Icons.arrow_forward,
                size: 18.sp, color: AppColors.informationColor),
          ],
        ),
      ),
    );
  }

  _onDetailOrder() {
    MainRouter.instance
        .pushNamed(context, routeName: RouteName.orders, queryParameters: {
      'orderId': widget.orderId.toString(),
    });
  }
}
