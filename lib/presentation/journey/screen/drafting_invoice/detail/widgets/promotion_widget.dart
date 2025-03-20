part of '../drafting_detail_screen.dart';

class PromotionWidget extends StatefulWidget {
  const PromotionWidget({super.key});

  @override
  State<PromotionWidget> createState() => _PromotionWidgetState();
}

class _PromotionWidgetState extends State<PromotionWidget> with DialogHelper {
  final DraftingInvoiceBloc _draftingInvoiceBloc =
      getIt.get<DraftingInvoiceBloc>();

  // chương trình khuyến mãi sẽ hiển thị khi có sản phẩm
  // widget render lại khi state hiện tại là:
  //    - lấy thông tin đơn
  //    - nếu danh sách sản phẩm trước đó trống và state hiện tại là cập nhật sản phầm
  //    - nếu danh sách sản phẩm hiện tại trống và state hiện tại là cập nhật sản phầm
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DraftingInvoiceBloc, DraftingInvoiceState>(
      bloc: _draftingInvoiceBloc,
      buildWhen: (previous, current) =>
          current is GetDraftingInvoiceDetailLoading ||
          current is GetDraftingInvoiceDetailSuccess ||
          (((previous.products.isEmpty) || (current.products.isEmpty)) &&
              current is UpdateProductsSuccess),
      builder: (context, state) {
        if ((state.products.isEmpty) ||
            [CartType.tradeIn, CartType.warranty].contains(state.cartType)) {
          return BoxSpacer.blank;
        }

        return XContainer(
          margin: EdgeInsets.only(top: 16.sp),
          iconTitle: Assets.svg.discount.svg(
            width: 24.sp,
            height: 24.sp,
          ),
          rightIcon: _rightIcon(),
          title: 'Chiết khấu',
          child: _child(),
        );
      },
    );
  }

  ///
  /// WIDGET
  ///

  Widget _rightIcon() {
    return BlocSelector<DraftingInvoiceBloc, DraftingInvoiceState, double?>(
      bloc: _draftingInvoiceBloc,
      selector: (state) => state.discountTotalBill,
      builder: (context, state) {
        if (state == null) {
          return XBaseButton(
            onPressed: onPressedEdit,
            child: Assets.svg.edit.svg(
              width: 24.sp,
              height: 24.sp,
            ),
          );
        }
        return XBaseButton(
          onPressed: clearDiscount,
          child: Assets.svg.remove.svg(
            width: 24.sp,
            height: 24.sp,
          ),
        );
      },
    );
  }

  Widget _child() {
    return BlocSelector<DraftingInvoiceBloc, DraftingInvoiceState, double?>(
      bloc: _draftingInvoiceBloc,
      selector: (state) => state.discountTotalBill,
      builder: (context, state) {
        if (state == null) {
          return BoxSpacer.blank;
        }
        return Container(
          padding: EdgeInsets.symmetric(vertical: 16.sp, horizontal: 16.sp),
          decoration: BoxDecoration(
            color: AppColors.lightGreyColor,
            borderRadius: BorderRadius.circular(16.sp),
          ),
          child: Row(
            children: [
              _contentDiscount(
                  discountAmount: state,
                  couponCode: _draftingInvoiceBloc.state.couponDiscountCode),
              BoxSpacer.s16,
              XBaseButton(
                onPressed: onPressedEdit,
                child: Assets.svg.edit.svg(
                  width: 24.sp,
                  height: 24.sp,
                ),
              )
            ],
          ),
        );
      },
    );
  }

  Widget _contentDiscount(
      {String? couponCode, required double discountAmount}) {
    if (couponCode.isNotNullOrEmpty) {
      return Expanded(
        child: Text.rich(
          TextSpan(
            text: 'Giảm ',
            style: AppFont.t.s(),
            children: [
              TextSpan(
                text: discountAmount.formatCurrency,
                style: AppFont.t.s().w800,
              ),
              const TextSpan(text: ' với mã '),
              TextSpan(
                text: couponCode,
                style: AppFont.t.s().w800,
              ),
            ],
          ),
        ),
      );
    }
    return Expanded(
      child: Text.rich(
        TextSpan(
          text: 'Chiết khấu tay ',
          style: AppFont.t.s(),
          children: [
            TextSpan(
              text: discountAmount.formatCurrency,
              style: AppFont.t.s().w800,
            ),
          ],
        ),
      ),
    );
  }

  ///
  /// METHOD
  ///
  void onPressedEdit() {
    DraftingInvoiceState state = _draftingInvoiceBloc.state;
    showXBottomSheet(
      context,
      isScrollControlled: true,
      padding: EdgeInsets.symmetric(vertical: 32.sp, horizontal: 32.sp),
      margin: EdgeInsets.zero,
      body: DiscountDialog(
        customerId: state.customer?.customerId,
        products: state.products,
        couponCode: state.couponDiscountCode,
        discountAmount: state.discountTotalBill,
        callBack: (String? couponCode, double? discountAmount) {
          _draftingInvoiceBloc.add(SetDiscountTotalBillInfoEvent(
            code: couponCode,
            amount: discountAmount,
          ));
        },
      ),
    );
  }

  void clearDiscount() {
    _draftingInvoiceBloc.add(ClearCouponEvent());
  }
}
