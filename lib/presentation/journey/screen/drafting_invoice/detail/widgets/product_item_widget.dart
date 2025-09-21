part of '../drafting_detail_screen.dart';

class ProductCartItemWidget extends StatefulWidget {
  const ProductCartItemWidget({
    super.key,
    required this.product,
    this.gifts = const [],
    this.attaches = const [],
    this.productsCombo = const [],
    required this.callBackChildAction,
    required this.callBackParentAction,
  });

  //state
  final ProductTable product;

  final List<ProductTable> gifts;
  final List<ProductTable> attaches;

  final List<ProductModel> productsCombo;

  //action
  final Function(XProductOperationAction action, ProductTable productItem)
      callBackChildAction;
  final Function({required XProductOperationAction action, int? quantity})
      callBackParentAction;

  @override
  State<ProductCartItemWidget> createState() => _ProductCartItemWidgetState();
}

class _ProductCartItemWidgetState extends State<ProductCartItemWidget> {
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
            baseButtonType: BaseButtonType.tapOperation,
            secondaryWidgetBuilder: (closeOverlay) =>
                _renderOperation(context, closeOverlay),
            child: Container(
              padding: EdgeInsets.all(8.sp),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.all(AppRadius.xxm),
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
        ],
      ),
    );
  }

  Widget _renderOperation(
      BuildContext context, Future<void> Function() closeOverlay) {
    List<XProductOperationAction> productOperationActions = [
      XProductOperationAction.addGift,
      XProductOperationAction.addAttach,
      XProductOperationAction.note,
      XProductOperationAction.remove,
      XProductOperationAction.discountByHand,
    ];
    if (widget.product.productType == ProductType.imei) {
      /// thêm imei
      productOperationActions.add(XProductOperationAction.addImei);
    }

    /// kiểm tra nếu chưa có voucher thì thêm voucher
    if (widget.product.voucher == null) {
      productOperationActions.add(XProductOperationAction.voucher);
    }
    return Container(
      padding: EdgeInsets.all(8.sp),
      width: 240.sp,
      child: ListView.separated(
        separatorBuilder: (context, index) => BoxSpacer.s2,
        padding: EdgeInsets.zero,
        itemCount: productOperationActions.length,
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (context, index) {
          final action = productOperationActions[index];
          return RowFunctionWidget(
            title: action.getTitle,
            icon: action.getIcon,
            onPressed: () async {
              await closeOverlay();
              widget.callBackParentAction(action: action);
            },
          );
        },
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
                      'IMEI: ${widget.product.getProductImei}',
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
                          borderRadius: BorderRadius.all(AppRadius.xs)),
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
                          borderRadius: BorderRadius.all(AppRadius.xs)),
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
        if (widget.product.voucher != null) ...[
          XStatus(
              statusStr: widget.product.voucher!.getName,
              bgColor: AppColors.primaryColor,
              onClose: () {
                widget.callBackParentAction(
                    action: XProductOperationAction.removeVoucher);
              }),
        ],
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
      ],
    );
  }

  Widget _giftsDetail() {
    /// sản phẩm quà tặng
    return GroupProductChildrenWidget(
      title: 'Quà tặng',
      data: widget.gifts,
      icon: XItemType.gift.getIconType(),
      callBackAction: widget.callBackChildAction,
    );
  }

  Widget _attachesDetail() {
    /// sản phẩm bán kèm
    return GroupProductChildrenWidget(
      title: 'Bán kèm',
      data: widget.attaches,
      icon: XItemType.attach.getIconType(),
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
}
