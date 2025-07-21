import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/configs/box.dart';
import '../../../common/constants/go_router.dart';
import '../../../common/enum/enum.dart';
import '../../../data/models/product_model.dart';
import '../../../gen/gen.dart';
import '../../journey/router.dart';
import '../../mixins/mixins.dart';
import '../../theme/themes.dart';
import '../../utils/utils.dart';
import '../widgets.dart';

class ProductDetailWidget extends StatefulWidget {
  const ProductDetailWidget({super.key, required this.products});

  final List<ProductModel> products;

  @override
  State<ProductDetailWidget> createState() => _ProductDetailWidgetState();
}

class _ProductDetailWidgetState extends State<ProductDetailWidget>
    with DialogHelper {
  final MainRouter _router = MainRouter.instance;

  @override
  Widget build(BuildContext context) {
    return XContainer(
      margin: EdgeInsets.only(top: 16.sp),
      iconTitle: Assets.svg.shopping.svg(
        width: 24.sp,
        height: 24.sp,
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
                List<XProductOperationAction> productOperationActions = [
                  XProductOperationAction.detail,
                  XProductOperationAction.copyData,
                ];

                if (product.getWarrantyInfo.checkWarrantyInfo) {
                  productOperationActions
                      .add(XProductOperationAction.warrantyInfo);
                }

                return ProductItemDetailWidget(
                  productName: product.getName,
                  productImei: product.imeiNo ?? '',
                  productImage: product.getImageThumbnail,
                  sellingPrice: product.getSellingPrice,
                  discountPrice: product.getDiscountPrice,
                  reason: product.reasonName,
                  quantity: product.quantity ?? 0,
                  attachs: product.attachs ?? [],
                  gifts: product.gifts ?? [],
                  baseButtonType: BaseButtonType.tapOperation,
                  decorationChildIsOverlay: BoxDecoration(
                    borderRadius: BorderRadius.all(AppRadius.l),
                    color: AppColors.white,
                  ),
                  paddingChildIsOverlay:
                      EdgeInsets.symmetric(vertical: 8.sp, horizontal: 8.sp),
                  productOperationActions: productOperationActions,
                  onPressed: ({action}) =>
                      _onHandleParrentAction(action: action, product: product),
                  onPressedChild: ({required action, required productChild}) =>
                      _onHandleChildAction(
                          action: action, productChild: productChild),
                  baseButtonTypeChild: BaseButtonType.tapOperation,
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

  _onHandleChildAction(
      {required XProductOperationAction action,
      required ProductModel productChild}) {
    if (action == XProductOperationAction.detail) {
      _router.pushNamed(
        context,
        routeName: RouteName.productDetail,
        queryParameters: {'productId': productChild.id.toString()},
      );
    }
    if (action == XProductOperationAction.copyData) {
      Utils.copyToClipboard(context, text: productChild.getDataCopy);
    }
  }

  _onHandleParrentAction(
      {XProductOperationAction? action, required ProductModel product}) {
    if (action == XProductOperationAction.detail) {
      _router.pushNamed(
        context,
        routeName: RouteName.productDetail,
        queryParameters: {'productId': product.id.toString()},
      );
    }
    if (action == XProductOperationAction.copyData) {
      Utils.copyToClipboard(context, text: product.getDataCopy);
    }
    if (action == XProductOperationAction.warrantyInfo) {
      showXBottomSheet(context,
          body: WarrantyInfoDialog(warrantyInfo: product.getWarrantyInfo));
    }
  }
}
