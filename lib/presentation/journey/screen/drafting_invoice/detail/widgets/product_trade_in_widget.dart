part of '../drafting_detail_screen.dart';

class ProductTradeInWidget extends StatefulWidget {
  const ProductTradeInWidget({super.key});

  @override
  State<ProductTradeInWidget> createState() => _ProductTradeInWidgetState();
}

class _ProductTradeInWidgetState extends State<ProductTradeInWidget>
    with DialogHelper {
  final DraftingInvoiceBloc _draftingInvoiceBloc =
      getIt.get<DraftingInvoiceBloc>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DraftingInvoiceBloc, DraftingInvoiceState>(
      bloc: _draftingInvoiceBloc,
      buildWhen: (previous, current) => current is GetCurrentDraftDataSuccess,
      builder: (context, state) {
        if (!state.checkNullDraft &&
            {CartType.tradeIn}.contains(state.cartType)) {
          return XContainer(
            margin: EdgeInsets.only(top: 16.sp),
            iconTitle: Assets.svg.shopping.svg(
              width: 22.sp,
              height: 22.sp,
            ),
            rightIcon: _renderRightIcon(),
            title: 'Sản phẩm cần định giá',
            child: _onProductTradeIn(),
          );
        }

        return BoxSpacer.blank;
      },
    );
  }

  ///
  /// WIDGET
  ///
  Widget _onProductTradeIn() {
    return BlocSelector<DraftingInvoiceBloc, DraftingInvoiceState,
        ProductTable?>(
      bloc: _draftingInvoiceBloc,
      selector: (state) => state.product,
      builder: (context, state) {
        if (state == null) {
          return BoxSpacer.blank;
        }
        return ProductItemDetailWidget(
          productName: state.getName,
          productImei: state.getImei,
          productImage: state.getImageThumbnail,
          sellingPrice: state.getSellingPrice,
          discountPrice: 0,
          padding: EdgeInsets.all(8.sp),
        );
      },
    );
  }

  Widget _renderRightIcon() {
    return BlocSelector<DraftingInvoiceBloc, DraftingInvoiceState,
            ProductTable?>(
        bloc: _draftingInvoiceBloc,
        selector: (state) => state.product,
        builder: (context, state) {
          if (state == null) {
            return XBaseButton(
              onPressed: () {
                _onDialogProductInfo();
              },
              child: Assets.svg.addToCart.svg(
                width: 24.sp,
                height: 24.sp,
              ),
            );
          }
          return XBaseButton(
            onPressed: () {
              _onDialogProductInfo();
            },
            child: Assets.svg.edit.svg(
              width: 24.sp,
              height: 24.sp,
            ),
          );
        });
  }

  ///
  /// METHOD
  ///
  _onDialogProductInfo() {
    showXBottomSheet(
      context,
      enableDrag: true,
      padding: EdgeInsets.symmetric(horizontal: 20.sp, vertical: 20.sp),
      margin: EdgeInsets.zero.copyWith(top: 60.sp),
      body: FormProductTradeInDialog(
        onResult: (ProductTable product) {
          _draftingInvoiceBloc.add(UpdateProductTradeInEvent(product));
        },
      ),
    );
  }
}
