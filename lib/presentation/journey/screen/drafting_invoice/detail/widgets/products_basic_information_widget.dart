part of '../drafting_detail_screen.dart';

class ProductsBasicInformationWidget extends StatefulWidget {
  const ProductsBasicInformationWidget({super.key});

  @override
  State<ProductsBasicInformationWidget> createState() =>
      _ProductsBasicInformationWidgetState();
}

class _ProductsBasicInformationWidgetState
    extends State<ProductsBasicInformationWidget> with DialogHelper {
  final DraftingInvoiceBloc _draftingInvoiceBloc =
      getIt.get<DraftingInvoiceBloc>();

  final mainRouter = MainRouter.instance;

  // danh sách sản phẩm sẽ hiển thị khi thông tin khách hàng, nhân viên đầy đủ
  // widget render lại khi state hiện tại là:
  //    - lấy thông tin đơn
  //    - thông tin khách hàng trước đó null và state hiện tại là cập nhật thông tin khách hàng
  //    - thông tin nhân viên bán hàng trước đó null và state hiện tại là cập nhật thông tin nhân viên
  //    - thông tin nhân viên hỗ trợ trước đó null và state hiện tại là cập nhật thông tin nhân viên
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DraftingInvoiceBloc, DraftingInvoiceState>(
      bloc: _draftingInvoiceBloc,
      buildWhen: (previous, current) {
        if (current is GetDraftingInvoiceDetailSuccess ||
            current is GetDraftingInvoiceDetailLoading) {
          return true;
        }
        if (current is UpdateCustomerSuccess &&
            (previous.customer?.getCustomerPhone.isNullOrEmpty ?? true)) {
          return true;
        }
        if (current is UpdateSaleInfoSuccess && previous.saleInfo == null) {
          return true;
        }
        if (current is UpdateTechInfoSuccess &&
            previous.technicalInfo == null) {
          return true;
        }
        return false;
      },
      builder: (context, state) {
        if ((state.customer?.getCustomerPhoneNumber?.isNullOrEmpty ?? true) ||
            state.saleInfo == null ||
            state.technicalInfo == null ||
            [CartType.tradeIn, CartType.warranty].contains(state.cartType)) {
          return BoxSpacer.blank;
        }
        return XContainer(
          margin: EdgeInsets.only(top: 16.sp),
          iconTitle: Assets.svg.shopping.svg(
            width: 24.sp,
            height: 24.sp,
          ),
          title: 'Sản phẩm',
          rightIcon: XBaseButton(
            onPressed: _onHandleAddMoreProduct,
            child: Icon(
              Icons.add_circle_rounded,
              color: AppColors.primaryColor,
              size: 24.sp,
            ),
          ),
          child: BlocSelector<DraftingInvoiceBloc, DraftingInvoiceState,
                  List<ProductTable>?>(
              bloc: _draftingInvoiceBloc,
              selector: (state) => state.products,
              builder: (context, state) {
                if (state?.isEmpty ?? true) {
                  return Container(
                    margin: EdgeInsets.only(top: 16.sp),
                    child: Text(
                      'Hãy thêm sản phẩm để tiếp tục',
                      style: AppFont.t.s(),
                    ),
                  );
                }

                return XGridView(
                  type: XGridViewType.masonry,
                  itemCount: state!.length,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  padding: EdgeInsets.symmetric(horizontal: 8.sp),
                  crossAxisCount: context.isSmallScreen ? 1 : 2,
                  crossAxisSpacing: 16.sp,
                  mainAxisSpacing: 16.sp,
                  itemBuilder: (context, index) {
                    final ProductTable product = state[index];
                    // return ProductItemWidget(
                    //   product: product,
                    //   gifts: product.getGifts,
                    //   attaches: product.getAttaches,
                    //   warranties: product.getWarranties,
                    //   productsCombo: product.productChildCombo ?? [],
                    //   callBackChildAction: _onHandleChildAction,
                    //   callBackParentAction: ({required action, quantity}) =>
                    //       _onHandleParentAction(
                    //           action: action,
                    //           product: product,
                    //           quantity: quantity),
                    // );
                    return Container();
                  },
                );
              }),
        );
      },
    );
  }

  ///
  /// METHOD
  ///
  _onDetail(ProductTable product) {
    mainRouter.pushNamed(
      context,
      routeName: RouteName.productDetail,
      queryParameters: {'productId': product.productId.toString()},
      extra: product,
    );
  }

  ///
  /// handle delete product
  ///
  _onDelete(int productId) {
    // chờ 1 giây để animation xóa sản phẩm hoàn tất
    Future.delayed(const Duration(milliseconds: 300), () {
      // _draftingInvoiceBloc.add(RemoveProductOnCartEvent(productId: productId));
    });
  }

  ///
  /// handle update product quantity
  ///
  _onUpdateProductQuantity({
    required int quantity,
    required ProductTable product,
  }) {
    // _draftingInvoiceBloc
    //     .add(UpdateProductQuantityEvent(quantity: quantity, product: product));
  }

  ///
  /// handle discount by hand
  ///
  _onDiscountByHand(ProductTable product) {
    // showXBottomSheet(
    //   context,
    //   key: GlobalAppKey.productNoteDialogKey,
    //   isScrollControlled: true,
    //   padding: EdgeInsets.symmetric(vertical: 32.sp, horizontal: 32.sp),
    //   margin: EdgeInsets.zero,
    //   body: DiscountByHandDialog(
    //     maxAmountDiscount: product.calculatorTotalSellingPrice,
    //     initValue: product.discountByHand?.amount ?? 0,
    //     type: product.discountByHand?.getDiscountType ?? XDiscountType.amount,
    //     onResult: (amount, type) {
    //       _draftDetailBloc.add(UpdateProductDiscountByHandEvent(
    //           amount: amount, type: type, productId: product.id));
    //     },
    //   ),
    // );
    // return;
  }

  ///
  /// handle update imei
  ///
  _onPressedUpdateImei(ProductTable product) {
    // showXBottomSheet(
    //   context,
    //   key: GlobalAppKey.addImeiDialogKey,
    //   enableDrag: true,
    //   padding: EdgeInsets.symmetric(vertical: 20.sp),
    //   margin: EdgeInsets.zero.copyWith(top: 60.sp),
    //   body: ImeiOfProductDialog(
    //     productId: product.productId!,
    //     callback: (ProductImeiModel result) {
    //       _draftingInvoiceBloc.add(
    //           UpdateImeiOfProductEvent(productId: product.id, imei: result));
    //     },
    //   ),
    // );
  }

  _onAddGift(ProductTable product) {
    // todo: xử lý thêm quà tặng
    return;
  }

  ///
  /// handle add product note
  ///
  _onAddProductNote({String? productNote, required int productId}) {
    // showXBottomSheet(
    //   context,
    //   key: GlobalAppKey.productNoteDialogKey,
    //   isScrollControlled: true,
    //   padding: EdgeInsets.symmetric(vertical: 32.sp, horizontal: 32.sp),
    //   margin: EdgeInsets.zero,
    //   body: NoteDialog(
    //     initValue: productNote ?? '',
    //     onResult: (value) {
    //       _draftingInvoiceBloc.add(UpdateProductNoteEvent(
    //         productNote: value,
    //         productId: productId,
    //       ));
    //     },
    //   ),
    // );
  }

  ///
  /// handle edit repurchase price
  ///
  _onHandleEditRepurchasePrice(ProductTable product) {
    // showXBottomSheet(
    //   context,
    //   key: GlobalAppKey.productNoteDialogKey,
    //   isScrollControlled: true,
    //   padding: EdgeInsets.symmetric(vertical: 32.sp, horizontal: 32.sp),
    //   margin: EdgeInsets.zero,
    //   body: RepurchasePriceDialog(
    //     initValue: product.repurchasePrice ?? 0,
    //     onResult: (value) {
    //       _draftingInvoiceBloc.add(UpdateRepurchasePriceProductEvent(
    //           productId: product.id,
    //           repurchasePrice: value,
    //           productType: product.productChildType));
    //     },
    //   ),
    // );
  }

  ///
  /// handle check repurchase price
  ///
  _onHandleCheckRepurchasePrice(ProductTable product) {
    // _draftingInvoiceBloc.add(UpdateCheckRepurchaseProductEvent(
    //     productId: product.id,
    //     isCheck: !product.isCheckRepurchasePrice,
    //     productType: product.productChildType));
  }

  ///
  /// handle attach imei
  ///
  _onHandleAttachImei(ProductTable product) {
    // showXBottomSheet(
    //   context,
    //   key: GlobalAppKey.imeiAttachDialogKey,
    //   body: ImeiAttachDialog(
    //     imeiStr: product.externalImeiNo,
    //     onPressedAttach: (imeiStr) {
    //       _draftingInvoiceBloc.add(
    //           UpdateAttachImeiEvent(imeiStr: imeiStr, productId: product.id));
    //     },
    //   ),
    // );
  }

  // xử lý action của sản phẩm cha
  _onHandleParentAction(
      {required XProductOperationAction action,
      int? quantity,
      required ProductTable product}) {
    switch (action) {
      case XProductOperationAction.detail:
        _onDetail(product);
        break;
      case XProductOperationAction.updateQuantity:
        _onUpdateProductQuantity(quantity: quantity ?? 1, product: product);
        break;
      case XProductOperationAction.remove:
        _onDelete(product.id);
        break;
      case XProductOperationAction.discountByHand:
        _onDiscountByHand(product);
        break;
      case XProductOperationAction.addImei:
        _onPressedUpdateImei(product);
        break;
      case XProductOperationAction.addGift:
        _onAddGift(product);
        break;
      case XProductOperationAction.note:
        // _onAddProductNote(productNote: product.note, productId: product.id);
        break;
      case XProductOperationAction.addAttachImei:
        _onHandleAttachImei(product);
        break;
      case XProductOperationAction.copyData:
        _onCopyData(product);
        break;
      default:
        break;
    }
  }

  _onCopyData(ProductTable product) {
    // Utils.copyToClipboard(context, text: product.getDataCopy);
  }

  // xử lý action của các thằng con
  _onHandleChildAction(
      XProductOperationAction action, ProductTable productItem) {
    switch (action) {
      case XProductOperationAction.detail:
        mainRouter.pushNamed(
          context,
          routeName: RouteName.productDetail,
          queryParameters: {'productId': productItem.productId.toString()},
          extra: productItem,
        );
        break;
      case XProductOperationAction.remove:
        _onDelete(productItem.id);
        break;
      case XProductOperationAction.copyData:
        _onCopyData(productItem);
        break;
      case XProductOperationAction.editRepurchasePrice:
        _onHandleEditRepurchasePrice(productItem);
        break;
      case XProductOperationAction.checkRepurchasePrice:
        _onHandleCheckRepurchasePrice(productItem);
        break;
      case XProductOperationAction.addImei:
        _onPressedUpdateImei(productItem);
        break;
      case XProductOperationAction.addWarrantyImei:
        break;
      case XProductOperationAction.addAttachImei:
        _onHandleAttachImei(productItem);
        break;
      default:
        break;
    }
  }

  void _onHandleAddMoreProduct() {
    mainRouter.pushNamed(context, routeName: RouteName.search);
  }
}
