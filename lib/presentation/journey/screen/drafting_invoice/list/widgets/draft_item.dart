part of '../drafts_screen.dart';

class DraftItem extends StatefulWidget {
  const DraftItem({
    super.key,
    required this.cartDetail,
    required this.index,
  });

  final DraftingInvoiceTable cartDetail;
  final int index;

  @override
  State<DraftItem> createState() => _DraftItemState();
}

class _DraftItemState extends State<DraftItem> {
  final DraftingStorage _draftingStorage = getIt.get<DraftingStorage>();
  final DraftingInvoiceBloc _draftingInvoiceBloc =
      getIt.get<DraftingInvoiceBloc>();
  StreamSubscription<void>? _cartSubscription;

  int get getDraftId => widget.cartDetail.id;
  final GlobalKey<XBaseButtonState> _btnKey = GlobalKey<XBaseButtonState>();

  @override
  void initState() {
    super.initState();
    _cartSubscription = _draftingStorage.listenCart(getDraftId).listen(
      (event) {
        // lắng nghe sự thay đổi của cart ở lần đầu tiên khởi tạo,
        // Khi có sự kiện (thay đổi) xảy ra, tải lại đối tượng CartTable
        // và cập nhật lại state của widget

        if (mounted) {
          _draftingStorage.getDraftingInvoice(draftId: getDraftId).then(
            (cart) {
              if (cart != null) {
                _draftingInvoiceBloc.add(
                    UpdateDraftEvent(cartDetail: cart, index: widget.index));
              }
            },
          );
        }
      },
    );
  }

  @override
  void dispose() {
    // Hủy bỏ StreamSubscription để tránh rò rỉ bộ nhớ
    _cartSubscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return XBaseButton(
      key: _btnKey,
      baseButtonType: BaseButtonType.longPressOperation,
      onPressed: onPress,
      secondaryWidget: _secondaryWidget(context),
      child: _widget(),
    );
  }

  ///
  /// WIDGET
  ///

  Widget _widget() {
    return Container(
      padding: EdgeInsets.all(16.sp),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16.sp),
      ),
      child: Column(
        children: [
          DraftTypeWidget(
            cartType: widget.cartDetail.typeCart,
          ),
          XDivider(
            padding: EdgeInsets.symmetric(vertical: 8.sp),
          ),
          CustomerBasicInfo(
            customerName: widget.cartDetail.getCustomerName,
            customerPhone: widget.cartDetail.getCustomerPhone,
            customerId: widget.cartDetail.getCustomerId,
            customerRank: widget.cartDetail.getCustomerRank,
          ),
          if (widget.cartDetail.getProducts.isNotEmpty) ...[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                XDivider(
                  padding: EdgeInsets.symmetric(vertical: 8.sp),
                ),
                DraftProducts(
                  products: widget.cartDetail.products.toList(),
                ),
                XDivider(
                  padding: EdgeInsets.symmetric(vertical: 8.sp),
                ),
                //       DraftTotalPriceWidget(
                //         totalPrice: widget.cartDetail.calculatorFinalPrice,
                //       ),
              ],
            )
          ],
        ],
      ),
    );
  }

  Widget _secondaryWidget(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.sp),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          XRowButton(
            title: 'Xóa phiếu bán hàng',
            icon: Icon(
              Icons.close_outlined,
              color: AppColors.primaryColor,
              size: 20.sp,
            ),
            onPressed: () {
              final XBaseButtonState? btnState = _btnKey.currentState;
              if (btnState != null) {
                btnState.animationCompletedStream.listen(
                  (event) {
                    if (event) {
                      _draftingInvoiceBloc.add(
                        RemoveDraftingInvoiceEvent(id: widget.cartDetail.id),
                      );
                    }
                  },
                );
              }
            },
          ),
          BoxSpacer.s8,
          XRowButton(
            title: 'Tạo phiếu KPVĐ',
            icon: Icon(
              Icons.add_comment_outlined,
              color: AppColors.primaryColor,
              size: 18.sp,
            ),
            onPressed: () {
              final XBaseButtonState? btnState = _btnKey.currentState;
              if (btnState != null) {
                btnState.animationCompletedStream.listen(
                  (event) {
                    if (event) {
                      // TODO: tạo phiếu kpvđ
                    }
                  },
                );
              }
            },
          ),
        ],
      ),
    );
  }

  ///
  /// method
  ///

  void onPress() {
    MainRouter.instance.pushNamed(
      context,
      routeName: RouteName.drafts,
      queryParameters: {'draftId': getDraftId.toString()},
    );
  }
}
