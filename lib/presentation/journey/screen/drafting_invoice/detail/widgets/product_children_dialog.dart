part of '../drafting_detail_screen.dart';

class ProductChildrenDialog extends StatefulWidget {
  const ProductChildrenDialog({super.key, required this.product});

  final ProductTable product;

  @override
  State<ProductChildrenDialog> createState() => _ProductChildrenDialogState();
}

class _ProductChildrenDialogState extends State<ProductChildrenDialog>
    with DialogHelper {
  final ValueNotifier<List<ProductModel>> _productsCombo = ValueNotifier([]);

  @override
  initState() {
    super.initState();
    _productsCombo.value = widget.product.getProductsCombo;
  }

  @override
  dispose() {
    _productsCombo.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const HeaderDialog(title: 'Sản phẩm con'),
        const XDivider(),
        _listProductChildren(),
        BoxSpacer.s8,
        _submitButton(),
      ],
    );
  }

  Widget _listProductChildren() {
    return Expanded(
      child: ValueListenableBuilder(
          valueListenable: _productsCombo,
          builder: (context, products, _) {
            return ListView.separated(
              itemBuilder: (context, index) {
                final product = products[index];
                if (product.getName.isNotNullOrEmpty) {
                  return ProductItemSearchDialog(
                    productName: product.getName,
                    productCode: product.getBarCode,
                    productImage: product.getImageThumbnail,
                    productPrice: product.getListedPrice,
                    isNeedInStock: false,
                    isExistInStock: (product.inStockQuantity ?? 0) > 0,
                    productType: product.productType,
                    productsCombo: product.productsCombo,
                    onPressed: () =>
                        _onHandleProduct(product: product, index: index),
                  );
                }
                return XBaseButton(
                  onPressed: () =>
                      _onHandleProduct(product: product, index: index),
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.sp, vertical: 12.sp),
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.all(AppRadius.l),
                    border: Border.all(
                        color: AppColors.neutral3Color, width: 0.6.sp),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Chọn sản phẩm con ${index + 1}',
                          style: AppFont.t.s()),
                      Icon(
                        Icons.arrow_forward_ios_outlined,
                        size: 12.sp,
                        color: AppColors.iconColor,
                      ),
                    ],
                  ),
                );
              },
              separatorBuilder: (context, index) => BoxSpacer.s16,
              itemCount: products.length,
              padding: EdgeInsets.zero,
            );
          }),
    );
  }

  Widget _submitButton() {
    return ValueListenableBuilder<List<ProductModel>>(
        valueListenable: _productsCombo,
        builder: (context, products, _) {
          double finalPrice = products.fold(0,
              (sum, product) => sum + product.getTotalPriceComboAfterDiscount);
          double totalBeforeDiscountPrice = products.fold(0,
              (sum, product) => sum + product.getTotalPriceComboBeforeDiscount);

          bool isDisable =
              products.any((product) => !product.isProductEnoughInformation);

          Color color =
              isDisable ? AppColors.disabledActionColor : AppColors.white;

          return XButton(
            disable: isDisable,
            onPressed: () {
              Navigator.pop(context, products);
            },
            padding: EdgeInsets.symmetric(horizontal: 16.sp, vertical: 12.sp),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  totalBeforeDiscountPrice.formatCurrency,
                  style: AppFont.t.s().lineThrough.copyWith(color: color),
                ),
                BoxSpacer.s8,
                Icon(
                  Icons.arrow_forward,
                  size: 12.sp,
                  color: color,
                ),
                BoxSpacer.s8,
                Text(
                  finalPrice.formatCurrency,
                  style: AppFont.t.s(14).w700.copyWith(color: color),
                ),
              ],
            ),
          );
        });
  }

  void _onHandleProduct({
    required ProductModel product,
    required int index,
  }) async {
    final res = await showXBottomSheet(
      context,
      key: GlobalAppKey.selectProductDialogKey,
      margin: EdgeInsets.zero,
      borderRadius:
          BorderRadius.only(topLeft: AppRadius.xxl, topRight: AppRadius.xxl),
      body: SearchProductDialog(
        productType: XItemType.main,
        cartType: CartType.retail,
        referenceId: product.referenceId,
      ),
    );

    if (res != null) {
      List<ProductModel> currentProducts = [..._productsCombo.value];
      ProductModel currentProduct = currentProducts[index];

      /// update product combo
      currentProduct = currentProduct.updateProductCombo(res);

      currentProducts[index] = currentProduct;
      _productsCombo.value = currentProducts;
    }
  }
}
