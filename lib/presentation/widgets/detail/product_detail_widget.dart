import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/configs/box.dart';
import 'package:c_pos/data/models/models.dart';
import '../../mixins/mixins.dart';
import '../../theme/themes.dart';
import '../widgets.dart';

class ProductDetailWidget extends StatefulWidget {
  const ProductDetailWidget({super.key, required this.products});

  final List<ProductModel> products;

  @override
  State<ProductDetailWidget> createState() => _ProductDetailWidgetState();
}

class _ProductDetailWidgetState extends State<ProductDetailWidget>
    with DialogHelper {
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
          if (widget.products.isEmpty) ...[
            const EmptyDataWidget(
              emptyMessage: 'Không có sản phẩm',
            )
          ] else ...[
            ListView.separated(
              padding: EdgeInsets.zero,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                final ProductModel product = widget.products[index];

                return ProductItemDetailWidget(
                  productName: product.getName,
                  productImei: product.imeiNo ?? '',
                  productImage: product.getImageThumbnail,
                  sellingPrice: product.sellingPrice ?? 0,
                  discountPrice: product.getDiscountPrice,
                  reason: product.reasonName,
                  quantity: product.quantity ?? 0,
                  attachs: product.attachs ?? [],
                  gifts: product.gifts ?? [],
                  productsCombo: product.productsCombo ?? [],
                  baseButtonType: BaseButtonType.basic,
                  decorationChildIsOverlay: BoxDecoration(
                    borderRadius: BorderRadius.all(AppRadius.l),
                    color: AppColors.white,
                  ),
                  paddingChildIsOverlay:
                      EdgeInsets.symmetric(vertical: 8.sp, horizontal: 8.sp),
                  decorationChildIsOverlayChild: BoxDecoration(
                    borderRadius: BorderRadius.all(AppRadius.l),
                    color: AppColors.white,
                  ),
                  paddingChildIsOverlayChild:
                      EdgeInsets.symmetric(vertical: 8.sp, horizontal: 8.sp),
                );
              },
              separatorBuilder: (context, index) => BoxSpacer.s16,
              itemCount: widget.products.length,
            )
          ],
        ],
      ),
    );
  }
}
