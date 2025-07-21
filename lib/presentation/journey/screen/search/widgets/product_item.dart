import 'package:c_pos/common/extensions/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../common/configs/box.dart';
import '../../../../../common/constants/go_router.dart';
import '../../../../../common/di/injection/injection.dart';
import '../../../../../data/models/product_model.dart';
import '../../../../mixins/mixins.dart';
import '../../../../theme/themes.dart';
import '../../../../widgets/widgets.dart';
import '../../../router.dart';
import '../../drafting_invoice/detail/bloc/drafting_invoice_bloc.dart';

enum ProductItemType { view, addOn }

class ProductItemInCart extends StatefulWidget {
  const ProductItemInCart({
    super.key,
    required this.product,
    this.type = ProductItemType.view,
  });

  final ProductModel product;
  final ProductItemType type;

  @override
  State<ProductItemInCart> createState() => _ProductItemInCartState();
}

class _ProductItemInCartState extends State<ProductItemInCart>
    with DialogHelper {
  double get discountPrice => widget.product.getDiscountPrice;

  double get sellingPrice => widget.product.getSellingPrice;

  double get listedPrice => widget.product.getListedPrice;

  // List<StockModel> get stocks => widget.product.stocks ?? [];

  final DraftingInvoiceBloc _draftingInvoiceBloc =
      getIt.get<DraftingInvoiceBloc>();

  bool get hasStock => widget.product.getStockQuantity > 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // bool isOverElement = stocks.length > 3;
    // List<StockModel> data = isOverElement ? stocks.sublist(0, 3) : stocks;

    return XBaseButton(
      onPressed: () {
        MainRouter.instance.pushNamed(context,
            routeName: RouteName.productDetail,
            queryParameters: {'productId': widget.product.id});
      },
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.all(AppRadius.l),
        ),
        padding: EdgeInsets.symmetric(vertical: 16.sp, horizontal: 16.sp),
        child: renderProductInfo(),
      ),
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
                    title: '${widget.product.getStockQuantity} sản phẩm',
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
        if (widget.type == ProductItemType.addOn) ...[
          XButton(
            type: XButtonType.transparent,
            padding: EdgeInsets.symmetric(
              horizontal: 8.sp,
              vertical: 8.sp,
            ),
            onPressed: _addProduct,
            child: Icon(
              Icons.add_circle, //Icons.add_circle_outline,
              size: 20.sp,
              color: AppColors.primaryColor,
            ),
          )
        ],
      ],
    );
  }

  ///
  /// METHOD
  ///

  _onShowStockDialog() {
    showXBottomSheet(
      context,
      margin: EdgeInsets.only(top: 80.sp),
      body: StockDialog(productId: widget.product.id!),
    );
  }

  _addProduct() async {
    // _draftingInvoiceBloc.add(AddProductEvent(
    //   widget.product.convertToTable(itemType: XItemType.main),
    // ));
    _draftingInvoiceBloc.add(AddProductFromSearchToCartEvent(widget.product));
    MainRouter.instance.popUtil(
      context,
      routeName: RouteName.drafts,
      queryParameters: {
        'draftId': '',
        'currentDraftId': _draftingInvoiceBloc.state.currentDraftId.toString()
      },
    );
    // if (currentDraftId != null) {
    //   final res = await _searchProductBloc.onAddProduct(
    //       product: widget.product, cartId: currentDraftId!);
    //   if (res) {
    //     XToast.showPositiveSuccess(message: 'Đã thêm sp vào đơn hàng');
    //   } else {
    //     XToast.showPositiveSuccess(message: 'Thêm sp vào đơn hàng bị lỗi');
    //   }
    // }
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
