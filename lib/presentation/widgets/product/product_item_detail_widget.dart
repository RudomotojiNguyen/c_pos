import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/configs/box.dart';
import '../../../common/enum/enum.dart';
import '../../../common/extensions/extension.dart';
import '../../../data/models/product_model.dart';
import '../widgets.dart';

class ProductItemDetailWidget extends StatefulWidget {
  const ProductItemDetailWidget({
    super.key,
    required this.productName,
    required this.productImei,
    required this.productImage,
    this.reason,
    required this.sellingPrice,
    required this.discountPrice,
    this.quantity = 0,
    this.onPressed,
    this.decoration,
    this.padding,
    this.gifts = const [],
    this.attachs = const [],
    this.baseButtonType,
    this.productOperationActions = const [],
    this.decorationChildIsOverlay,
    this.paddingChildIsOverlay,
    this.baseButtonTypeChild = BaseButtonType.basic,
    this.decorationChildIsOverlayChild,
    this.paddingChildIsOverlayChild,
    this.onPressedChild,
    this.provider,
  });

  final String productName;
  final String productImei;
  final String productImage;
  final String? reason;
  final double sellingPrice;
  final double discountPrice;
  final int quantity;
  final Function({XProductOperationAction? action})? onPressed;
  final Decoration? decoration;
  final EdgeInsetsGeometry? padding;

  final List<ProductModel> gifts;
  final List<ProductModel> attachs;

  final BaseButtonType? baseButtonType;
  final List<XProductOperationAction> productOperationActions;
  final Decoration? decorationChildIsOverlay;
  final EdgeInsetsGeometry? paddingChildIsOverlay;
  final String? provider;

  // for child
  final BaseButtonType baseButtonTypeChild;
  final Decoration? decorationChildIsOverlayChild;
  final EdgeInsetsGeometry? paddingChildIsOverlayChild;
  final Function({
    required XProductOperationAction action,
    required ProductModel productChild,
  })? onPressedChild;

  @override
  State<ProductItemDetailWidget> createState() =>
      _ProductItemDetailWidgetState();
}

class _ProductItemDetailWidgetState extends State<ProductItemDetailWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        XBaseButton(
          baseButtonType: widget.baseButtonType ?? BaseButtonType.basic,
          secondaryWidgetBuilder: (closeOverlay) =>
              _secondaryWidget(closeOverlay),
          onPressed: () => widget.onPressed?.call(),
          decorationChildIsOverlay: widget.decorationChildIsOverlay,
          paddingChildIsOverlay: widget.paddingChildIsOverlay,
          child: Container(
            decoration: widget.decoration,
            padding: widget.padding,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  children: [
                    XImage(
                      imagePath: widget.productImage,
                      width: 80.sp,
                      height: 80.sp,
                    ),
                    BoxSpacer.s8,
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.productName,
                            style: AppFont.t.s(),
                          ),
                          if (widget.provider.isNotNullOrEmpty) ...[
                            BoxSpacer.s4,
                            Text(
                              widget.provider!,
                              style: AppFont.t.s(8).neutral2,
                            ),
                          ],
                          if (widget.productImei.isNotNullOrEmpty) ...[
                            BoxSpacer.s4,
                            XImeiInfo(
                              imei: widget.productImei,
                              isCopyImei: true,
                            ),
                          ],
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              if (widget.sellingPrice > 0) ...[
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      widget.sellingPrice.formatCurrency,
                                      style: AppFont.t.s().w700.primaryColor,
                                    ),
                                    if (widget.discountPrice > 0) ...[
                                      BoxSpacer.s4,
                                      Text(
                                        'CK: ${widget.discountPrice.formatCurrency}',
                                        style: AppFont.t.s(10).neutral2,
                                      ),
                                    ],
                                  ],
                                ),
                              ],
                              if (widget.quantity > 0) ...[
                                BoxSpacer.s8,
                                Text(
                                  '(x${widget.quantity.formatNumber})',
                                  style: AppFont.t.s(),
                                ),
                              ],
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                if (widget.reason.isNotNullOrEmpty) ...[
                  BoxSpacer.s4,
                  Text.rich(
                    TextSpan(
                      text: 'Lý do: ',
                      style: AppFont.t.s().copyWith(
                            decoration: TextDecoration.underline,
                          ),
                      children: [
                        TextSpan(
                          text: widget.reason!,
                          style: AppFont.t.s(),
                        ),
                      ],
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
        if (widget.gifts.isNotEmpty || widget.attachs.isNotEmpty) ...[
          BoxSpacer.s8,
        ],
        if (widget.gifts.isNotEmpty) ...[
          _gifts(),
        ],
        if (widget.gifts.isNotEmpty && widget.attachs.isNotEmpty) ...[
          BoxSpacer.s8,
        ],
        if (widget.attachs.isNotEmpty) ...[
          _attachs(),
        ],
      ],
    );
  }

  Widget _secondaryWidget(Future<void> Function() closeOverlay) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: widget.productOperationActions
          .map((e) => RowFunctionWidget(
                title: e.getTitle,
                icon: e.getIcon,
                onPressed: () async {
                  widget.onPressed?.call(action: e);
                  await closeOverlay();
                },
              ))
          .toList(),
    );
  }

  Widget _gifts() {
    // render danh sách quà tặng
    return Column(
      children: widget.gifts.map((e) {
        List<XProductOperationAction> productOperationActions = [
          XProductOperationAction.detail,
          XProductOperationAction.copyData,
        ];

        if (e.getWarrantyInfo.checkWarrantyInfo) {
          productOperationActions.add(XProductOperationAction.warrantyInfo);
        }

        return BasicShortProductItem(
          product: e,
          baseButtonType: widget.baseButtonTypeChild,
          productOperationActions: productOperationActions,
          decorationIsOverlay: widget.decorationChildIsOverlayChild,
          paddingIsOverlay: widget.paddingChildIsOverlayChild,
          onPressed: ({action}) => widget.onPressedChild?.call(
            action: action ?? XProductOperationAction.detail,
            productChild: e,
          ),
        );
      }).toList(),
    );
  }

  Widget _attachs() {
    // render danh sách phụ kiện
    return Column(
      children: widget.attachs.map((e) {
        List<XProductOperationAction> productOperationActions = [
          XProductOperationAction.detail,
          XProductOperationAction.copyData,
        ];

        if (e.getWarrantyInfo.checkWarrantyInfo) {
          productOperationActions.add(XProductOperationAction.warrantyInfo);
        }

        return BasicShortProductItem(
          product: e,
          baseButtonType: widget.baseButtonTypeChild,
          productOperationActions: productOperationActions,
          decorationIsOverlay: widget.decorationChildIsOverlayChild,
          paddingIsOverlay: widget.paddingChildIsOverlayChild,
          onPressed: ({action}) => widget.onPressedChild?.call(
            action: action ?? XProductOperationAction.detail,
            productChild: e,
          ),
        );
      }).toList(),
    );
  }
}
