part of '../manage_stock/search_stock_screen.dart';

class ProductItemInStock extends StatefulWidget {
  const ProductItemInStock({
    super.key,
    required this.product,
  });

  final ProductModel product;

  @override
  State<ProductItemInStock> createState() => _ProductItemInStockState();
}

class _ProductItemInStockState extends State<ProductItemInStock>
    with DialogHelper {
  double get discountPrice => widget.product.getDiscountPrice;

  double get sellingPrice => widget.product.getSellingPrice;

  double get listedPrice => widget.product.getListedPrice;

  bool get hasStock =>
      widget.product.inStockQuantity != null &&
      widget.product.inStockQuantity! > 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.all(AppRadius.l),
      ),
      padding: EdgeInsets.symmetric(vertical: 16.sp, horizontal: 16.sp),
      child: renderProductInfo(),
    );
  }

  Widget renderProductInfo() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        XImage(
          imagePath: widget.product.getImageThumbnail,
          size: Size(80.sp, 80.sp),
        ),
        BoxSpacer.s8,
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.product.getName,
                style: AppFont.t.s(13).w600,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              BoxSpacer.s4,
              XRowInfo(
                title: sellingPrice.formatCurrency,
                style: AppFont.t.s(12).w600.primaryColor,
                icon: Icon(
                  Icons.monetization_on,
                  size: 12.sp,
                  color: AppColors.primaryColor,
                ),
              ),
              if (listedPrice > sellingPrice) ...[
                BoxSpacer.s4,
                Text(
                  listedPrice.formatCurrency,
                  style: AppFont.t.s(11).w400.neutral2.lineThrough,
                ),
              ],
              if (hasStock) ...[
                BoxSpacer.s4,
                XBaseButton(
                  onPressed: _onShowStockDialog,
                  child: XRowInfo(
                    title: '${widget.product.inStockQuantity} sản phẩm',
                    style: AppFont.t.s(10).information,
                    icon: Icon(
                      Icons.store,
                      size: 12.sp,
                      color: AppColors.informationColor,
                    ),
                  ),
                ),
              ] else ...[
                BoxSpacer.s4,
                Text(
                  'Hết hàng',
                  style: AppFont.t.s(10).neutral3,
                ),
              ],
            ],
          ),
        ),
      ],
    );
  }

  ///
  /// METHOD
  ///

  _onShowStockDialog() {
    showXBottomSheet(
      context,
      body: StockDialog(productId: widget.product.id!),
    );
  }
}

class XRowInfo extends StatelessWidget {
  const XRowInfo({
    super.key,
    required this.title,
    required this.icon,
    this.style,
  });

  final String title;
  final Widget icon;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        icon,
        BoxSpacer.s4,
        Expanded(
          child: Text(
            title,
            style: style,
          ),
        ),
      ],
    );
  }
}
