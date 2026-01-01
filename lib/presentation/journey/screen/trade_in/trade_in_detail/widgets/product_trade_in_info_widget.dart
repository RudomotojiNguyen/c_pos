import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../theme/colors.dart';
import '../../../../../widgets/widgets.dart';

class ProductTradeInInfoWidget extends StatelessWidget {
  const ProductTradeInInfoWidget({
    super.key,
    required this.productName,
    required this.productImei,
    required this.productImage,
    required this.productBuyingPrice,
    this.barCode,
  });

  final String productName;
  final String productImei;
  final String productImage;
  final double productBuyingPrice;
  final String? barCode;

  @override
  Widget build(BuildContext context) {
    return XContainer(
      margin: EdgeInsets.only(top: 16.sp),
      iconTitle: Icon(
        Icons.shopping_bag,
        size: 18.sp,
        color: AppColors.neutral3Color,
      ),
      title: 'Thông tin sản phẩm',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ProductItemDetailWidget(
            productName: productName,
            productImei: productImei,
            productImage: productImage,
            sellingPrice: productBuyingPrice,
            discountPrice: 0,
            barCode: barCode,
          ),
        ],
      ),
    );
  }
}
