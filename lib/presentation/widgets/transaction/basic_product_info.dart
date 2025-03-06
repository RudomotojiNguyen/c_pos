import 'package:c_pos/common/extensions/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/configs/box.dart';
import '../x_image.dart';

class BasicProductInfo extends StatelessWidget {
  const BasicProductInfo({
    super.key,
    required this.productName,
    this.productImei,
    required this.productPrice,
    this.productQuantity = 1,
    this.productImage,
  });

  final String productName;
  final String? productImage;
  final String? productImei;
  final double productPrice;
  final int productQuantity;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (productImage.isNotNullOrEmpty) ...[
          XImage(
            imagePath: productImage!,
            size: Size(60.sp, 60.sp),
          ),
          BoxSpacer.s8,
        ],
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                productName,
                style: AppFont.t.s(),
              ),
              Text.rich(
                TextSpan(
                  text: productPrice.formatCurrency,
                  style: AppFont.t.s().w700.primaryColor,
                  children: [
                    TextSpan(
                      text: '  (x${productQuantity.formatNumber})',
                      style: AppFont.t.s(11),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
