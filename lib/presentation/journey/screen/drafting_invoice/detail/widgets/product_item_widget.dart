part of '../drafting_detail_screen.dart';

class ProductItemWidget extends StatefulWidget {
  const ProductItemWidget({
    super.key,
    required this.product,
    this.gifts = const [],
    this.attaches = const [],
    this.warranties = const [],
    this.productsCombo = const [],
    required this.callBackChildAction,
    required this.callBackParentAction,
  });

  //state
  final ProductTable product;

  final List<ProductTable> gifts;
  final List<ProductTable> attaches;
  final List<ProductTable> warranties;

  final List<ProductModel> productsCombo;

  //action
  final Function(XProductOperationAction action, ProductTable productItem)
      callBackChildAction;
  final Function({required XProductOperationAction action, int? quantity})
      callBackParentAction;

  @override
  State<ProductItemWidget> createState() => _ProductItemWidgetState();
}

class _ProductItemWidgetState extends State<ProductItemWidget> {
  final GlobalKey<XBaseButtonState> _btnKey = GlobalKey<XBaseButtonState>();

  final ValueNotifier<int> quantityController = ValueNotifier(1);

  @override
  void initState() {
    super.initState();
    quantityController.value = widget.product.getQuantity;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.sp),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          XBaseButton(
            key: _btnKey,
            baseButtonType: BaseButtonType.tapOperation,
            secondaryWidget: _renderOperation(context),
            child: Container(
              padding: EdgeInsets.all(8.sp),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(8.sp),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.shadowColor,
                    blurRadius: 8.sp,
                    offset: const Offset(0, 1), // changes position of shadow
                  ),
                ],
              ),
              child: _parentDetail(),
            ),
          ),
          _giftsDetail(),
          _attachesDetail(),
          _warrantiesDetail(),
        ],
      ),
    );
  }

  Widget _renderOperation(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.sp),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RowFunctionWidget(
            title: XProductOperationAction.detail.getTitle,
            icon: XProductOperationAction.detail.getIcon,
            onPressed: () => onHandleClick(widget.callBackParentAction(
                action: XProductOperationAction.detail)),
          ),
          // RowFunctionWidget(
          //   title: XProductOperationAction.copyData.getTitle,
          //   icon: XProductOperationAction.copyData.getIcon,
          //   onPressed: () => onHandleClick(widget.callBackParentAction(
          //       action: XProductOperationAction.copyData)),
          // ),
          if (widget.product.productType == ProductType.imei) ...[
            BoxSpacer.s8,
            RowFunctionWidget(
              title: XProductOperationAction.addImei.getTitle,
              icon: XProductOperationAction.addImei.getIcon,
              onPressed: () => onHandleClick(widget.callBackParentAction(
                  action: XProductOperationAction.addImei)),
            ),
          ],
          if (widget.product.isBelongToWarrantyImei) ...[
            BoxSpacer.s8,
            RowFunctionWidget(
              title: XProductOperationAction.addAttachImei.getTitle,
              icon: XProductOperationAction.addAttachImei.getIcon,
              onPressed: () => onHandleClick(widget.callBackParentAction(
                  action: XProductOperationAction.addAttachImei)),
            ),
          ],
          // BoxSpacer.s8,
          // RowFunctionWidget(
          //   title: XProductOperationAction.note.getTitle,
          //   icon: XProductOperationAction.note.getIcon,
          //   onPressed: () => onHandleClick(widget.callBackParentAction(
          //       action: XProductOperationAction.note)),
          // ),
          // BoxSpacer.s8,
          // RowFunctionWidget(
          //   title: XProductOperationAction.addGift.getTitle,
          //   icon: XProductOperationAction.addGift.getIcon,
          //   onPressed: () => onHandleClick(widget.callBackParentAction(
          //       action: XProductOperationAction.addGift)),
          // ),
          BoxSpacer.s8,
          RowFunctionWidget(
            title: XProductOperationAction.remove.getTitle,
            icon: XProductOperationAction.remove.getIcon,
            onPressed: () => onHandleClick(widget.callBackParentAction(
                action: XProductOperationAction.remove)),
          ),
          BoxSpacer.s8,
          RowFunctionWidget(
            title: XProductOperationAction.discountByHand.getTitle,
            icon: XProductOperationAction.discountByHand.getIcon,
            onPressed: () => onHandleClick(widget.callBackParentAction(
                action: XProductOperationAction.discountByHand)),
          ),
        ],
      ),
    );
  }

  Widget _parentDetail() {
    double originalPrice =
        widget.product.getSellingPrice * widget.product.getQuantity;
    double productPrice = widget.product.getProductPrice;

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            XImage(
              imagePath: widget.product.getImageThumbnail,
              width: 60.sp,
              height: 60.sp,
            ),
            BoxSpacer.s8,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    widget.product.getName,
                    style: AppFont.t.s(),
                  ),
                  if (widget.product.getProductImei.isNotNullOrEmpty) ...[
                    Text(
                      '(Imei: ${widget.product.getProductImei})',
                      style: AppFont.t.s().neutral2,
                    ),
                  ],
                  Text.rich(
                    TextSpan(
                      text: productPrice.formatCurrency,
                      style: AppFont.t.s().primaryColor.w700,
                    ),
                  ),
                  if (originalPrice > 0 && originalPrice > productPrice) ...[
                    Text.rich(
                      TextSpan(
                        text: originalPrice.formatCurrency,
                        style: AppFont.t.s().neutral3.w700.lineThrough,
                      ),
                    ),
                  ],
                ],
              ),
            ),
            if (widget.product.productType == ProductType.normal) ...[
              Column(
                children: [
                  XBaseButton(
                    onPressed: _addQuantity,
                    child: Container(
                      padding: EdgeInsets.all(1.sp),
                      decoration: BoxDecoration(
                          color: AppColors.neutralColor,
                          borderRadius: BorderRadius.circular(4.sp)),
                      child: Icon(
                        Icons.add,
                        size: 18.sp,
                        color: AppColors.white,
                      ),
                    ),
                  ),
                  BoxSpacer.s4,
                  ValueListenableBuilder(
                      valueListenable: quantityController,
                      builder: (context, value, _) {
                        return Text(
                          value.formatNumber,
                          style: AppFont.t.s(),
                        );
                      }),
                  BoxSpacer.s4,
                  XBaseButton(
                    onPressed: _removeQuantity,
                    child: Container(
                      padding: EdgeInsets.all(1.sp),
                      decoration: BoxDecoration(
                          color: AppColors.neutralColor,
                          borderRadius: BorderRadius.circular(4.sp)),
                      child: Icon(
                        Icons.remove,
                        size: 18.sp,
                        color: AppColors.white,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ],
        ),
        if (widget.productsCombo.isNotEmpty &&
            widget.product.productType == ProductType.combo) ...[
          ListView.separated(
            padding: EdgeInsets.zero,
            itemBuilder: (context, index) {
              final product = widget.productsCombo[index];
              return Text.rich(
                style: AppFont.t.s().neutral3.w500,
                TextSpan(
                  text: '- ',
                  children: [
                    TextSpan(text: product.getName),
                    const TextSpan(text: ' ('),
                    TextSpan(
                      text: product.getSellingPrice.formatCurrency,
                      style: AppFont.t.s().primaryColor.w700,
                    ),
                    const TextSpan(text: ')'),
                  ],
                ),
              );
            },
            separatorBuilder: (context, index) => BoxSpacer.s2,
            itemCount: widget.productsCombo.length,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
          ),
        ],
        if (widget.product.externalImeiNo.isNotNullOrEmpty) ...[
          XImeiInfo(
            imei: widget.product.externalImeiNo!,
            isCopyImei: true,
          ),
        ]
      ],
    );
  }

  Widget _giftsDetail() {
    /// sản phẩm quà tặng
    return GroupProductChildrenWidget(
      title: 'Quà tặng',
      data: widget.gifts,
      icon: ProductType.gift.getIconType(),
      callBackAction: widget.callBackChildAction,
    );
  }

  Widget _attachesDetail() {
    /// sản phẩm bán kèm
    return GroupProductChildrenWidget(
      title: 'Bán kèm',
      data: widget.attaches,
      icon: ProductType.attach.getIconType(),
      callBackAction: widget.callBackChildAction,
    );
  }

  Widget _warrantiesDetail() {
    /// gói bảo hành
    return GroupProductChildrenWidget(
      title: 'Gói bảo hành',
      data: widget.warranties,
      icon: ProductType.warranty.getIconType(),
      callBackAction: widget.callBackChildAction,
    );
  }

  ///
  /// METHOD
  ///
  void _removeQuantity() {
    int quantity = quantityController.value;
    if (quantity == 1) {
      return;
    }
    updateQuantity(quantity - 1);
  }

  void _addQuantity() {
    int quantity = quantityController.value;
    if (quantity == 50) {
      return;
    }
    updateQuantity(quantity + 1);
  }

  updateQuantity(int newQuantity) {
    quantityController.value = newQuantity;

    widget.callBackParentAction(
        action: XProductOperationAction.updateQuantity, quantity: newQuantity);
  }

  void onHandleClick(Function? func) {
    if (func == null) return;
    final XBaseButtonState? btnState = _btnKey.currentState;
    if (btnState != null) {
      btnState.animationCompletedStream.listen(
        (event) {
          if (event) {
            func();
          }
        },
      );
    }
  }
}
