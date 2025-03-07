import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/configs/box.dart';
import '../../../common/extensions/extension.dart';
import '../../theme/themes.dart';
import '../widgets.dart';

class ShortProductItemWidget extends StatelessWidget {
  final String image;
  final String name;
  final int stockQuantity;
  final double listedPrice;
  final double discountPrice;

  const ShortProductItemWidget({
    super.key,
    required this.image,
    required this.name,
    this.stockQuantity = 0,
    this.listedPrice = 0,
    this.discountPrice = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16.sp),
      ),
      padding: EdgeInsets.symmetric(horizontal: 16.sp, vertical: 16.sp),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: XImage(
              imagePath: image,
              size: Size(100.sp, 100.sp),
            ),
          ),
          BoxSpacer.s16,
          Text.rich(
            TextSpan(
              text: 'Sẵn hàng: ',
              style: AppFont.t.s(11).w600.green,
              children: [
                TextSpan(
                  text: stockQuantity.toString(),
                ),
              ],
            ),
          ),
          BoxSpacer.s4,
          Text(
            name,
            style: AppFont.t.s(13).w600,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
          ),
          BoxSpacer.s4,
          Text(
            (discountPrice < listedPrice ? discountPrice : listedPrice)
                .formatCurrency,
            style: AppFont.t.s().primaryColor,
          ),
          if (discountPrice < listedPrice) ...[
            BoxSpacer.s4,
            Text(
              listedPrice.formatCurrency,
              style: AppFont.t.s(11).w400.neutral2.copyWith(
                    decoration: TextDecoration.lineThrough,
                  ),
            ),
          ],
        ],
      ),
    );
  }
}
