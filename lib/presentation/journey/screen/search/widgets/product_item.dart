import 'package:c_pos/common/extensions/extension.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../common/configs/box.dart';
import '../../../../../common/constants/go_router.dart';
import '../../../../../data/models/product_model.dart';
import '../../../../../data/models/stock_model.dart';
import '../../../../mixins/mixins.dart';
import '../../../../theme/themes.dart';
import '../../../../widgets/widgets.dart';
import '../../../router.dart';

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

  List<StockModel> get stocks => widget.product.stocks ?? [];

  // final DraftDetailBloc _draftDetailBloc = getItAppCore.get<DraftDetailBloc>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    bool isOverElement = stocks.length > 3;
    List<StockModel> data = isOverElement ? stocks.sublist(0, 3) : stocks;

    return XBaseButton(
      onPressed: () {
        MainRouter.instance.pushNamed(context,
            routeName: RouteName.productDetail,
            queryParameters: {'productId': widget.product.id});
      },
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(16.sp),
        ),
        padding: EdgeInsets.symmetric(vertical: 16.sp, horizontal: 16.sp),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            renderProductInfo(),
            // todo: xem có cần lấy và hiện thông tin cửa hàng còn tồn không
            // renderListStore(data, isOverElement, widget.product.id!),
          ],
        ),
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
              Text(
                sellingPrice.formatCurrency,
                style: AppFont.t.s().primaryColor,
              ),
              if (listedPrice > sellingPrice) ...[
                BoxSpacer.s4,
                Text(
                  listedPrice.formatCurrency,
                  style: AppFont.t.s(11).w400.neutral2.lineThrough,
                ),
              ],
            ],
          ),
        ),
        // if (widget.product.isExistInStock &&
        //     _draftDetailBloc.state.currentDraftId != null &&
        //     widget.type == ProductItemType.addOn) ...[
        //   XButton(
        //     type: XButtonType.transparent,
        //     padding: EdgeInsets.symmetric(
        //       horizontal: 8.sp,
        //       vertical: 8.sp,
        //     ),
        //     onPressed: _addProduct,
        //     child: Icon(
        //       Icons.add_circle, //Icons.add_circle_outline,
        //       size: 20.sp,
        //       color: AppColors.primaryColor,
        //     ),
        //   )
        // ],
      ],
    );
  }

  Widget renderListStore(
      List<StockModel> stocks, bool isOverElement, String productId) {
    if (stocks.isNotEmpty) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BoxSpacer.s6,
          SizedBox(
            height: 14.sp,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      final StockModel stock = stocks[index];
                      return Text.rich(
                        TextSpan(
                          text: stock.getStoreName,
                          style: AppFont.t.s(10),
                          children: [
                            TextSpan(
                              text: ' (${stock.getInStockQuantity})',
                              style: AppFont.t.s(10).primaryColor,
                            )
                          ],
                        ),
                      );
                    },
                    separatorBuilder: (context, index) => XDivider(
                      dividerType: DividerType.vertical,
                      dividerColor: AppColors.neutralColor,
                      thickness: 0.5.sp,
                    ),
                    itemCount: stocks.length,
                  ),
                  if (isOverElement) ...[
                    BoxSpacer.s8,
                    XBaseButton(
                      onPressed: () {
                        showXBottomSheet(
                          context,
                          margin: EdgeInsets.only(top: 80.sp),
                          body: StockDialog(productId: productId),
                        );
                      },
                      child: Text(
                        'Xem thêm',
                        style: AppFont.t.s(10).information,
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ),
        ],
      );
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        BoxSpacer.s6,
        Text(
          'Không còn cửa hàng nào còn hàng !!!',
          style: AppFont.t.s(10).information,
        )
      ],
    );
  }

  ///
  /// METHOD
  ///

  // _addProduct() async {
  //   /// todo: lấy danh sách quà tặng, chương trình khuyến mãi,
  //   /// kiểm tra nếu có thông tin khách hàng -> check thêm DMem

  //   _draftDetailBloc.add(AddProductEvent(widget.product.convertToTable()));
  //   MainRouter.instance.popUtil(
  //     context,
  //     routeName: CoreRouteName.draftBillDetail,
  //     queryParameters: {
  //       'currentDraftId': _draftDetailBloc.state.currentDraftId.toString()
  //     },
  //   );
  //   // if (currentDraftId != null) {
  //   //   final res = await _searchProductBloc.onAddProduct(
  //   //       product: widget.product, cartId: currentDraftId!);
  //   //   if (res) {
  //   //     XToast.showPositiveSuccess(
  //   //         message: 'Đã thêm sp vào đơn hàng');
  //   //   } else {
  //   //     XToast.showPositiveSuccess(
  //   //         message: 'Thêm sp vào đơn hàng bị lỗi');
  //   //   }
  //   // }
  // }
}
