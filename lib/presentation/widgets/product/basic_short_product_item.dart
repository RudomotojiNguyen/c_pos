import 'package:c_pos/common/extensions/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/configs/box.dart';
import '../../../common/enum/enum.dart';
import '../../../data/models/product_model.dart';
import '../widgets.dart';

class BasicShortProductItem extends StatelessWidget {
  const BasicShortProductItem({
    super.key,
    required this.product,
    this.onPressed,
    this.baseButtonType = BaseButtonType.basic,
    this.productOperationActions = const [],
    this.decorationIsOverlay,
    this.paddingIsOverlay,
  });

  final ProductModel product;
  final Function({XProductOperationAction? action})? onPressed;
  final BaseButtonType baseButtonType;
  final List<XProductOperationAction> productOperationActions;
  final Decoration? decorationIsOverlay;
  final EdgeInsetsGeometry? paddingIsOverlay;

  @override
  Widget build(BuildContext context) {
    return XBaseButton(
      onPressed: baseButtonType != BaseButtonType.basic
          ? null
          : () => onPressed?.call(action: XProductOperationAction.detail),
      secondaryWidgetBuilder: (closeOverlay) => _secondaryWidget(closeOverlay),
      baseButtonType: baseButtonType,
      paddingChildIsOverlay: paddingIsOverlay,
      decorationChildIsOverlay: decorationIsOverlay,
      child: Row(
        children: [
          BoxSpacer.s16,
          SizedBox(
            width: 220.sp,
            child: Row(
              children: [
                XImage(
                  imagePath: product.getImageThumbnail,
                  size: Size(60.sp, 60.sp),
                ),
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product.getName,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: AppFont.t.s(10),
                      ),
                      Text(
                        product.getSellingPrice.formatCurrency,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: AppFont.t.s(10),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _secondaryWidget(Future<void> Function() closeOverlay) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: productOperationActions
          .map((e) => RowFunctionWidget(
                title: e.getTitle,
                icon: e.getIcon,
                onPressed: () async {
                  onPressed?.call(action: e);
                  await closeOverlay();
                },
              ))
          .toList(),
    );
  }
}
