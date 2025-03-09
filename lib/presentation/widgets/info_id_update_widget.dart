import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../common/constants/go_router.dart';
import '../../common/extensions/extension.dart';
import '../../gen/gen.dart';
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Assets.svg.shopping.svg(
                width: 24.sp,
                height: 24.sp,
              ),
              SizedBox(width: 8.sp),
              Text(
                'Từ đơn hàng:',
                style: AppFont.t.s(),
              ),
            ],
          ),
          XBaseButton(
            onPressed: () {
              MainRouter.instance.pushNamed(context,
                  routeName: RouteName.orders,
                  queryParameters: {
                    'orderId': widget.orderId.toString(),
                  });
            },
            child: Text(
              widget.orderId.toString(),
              style: AppFont.t.s().information,
              textAlign: TextAlign.right,
            ),
          )
        ],
      ),
    );
  }
}
