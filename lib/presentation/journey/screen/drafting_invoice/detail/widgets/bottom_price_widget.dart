part of '../drafting_detail_screen.dart';

class BottomPriceWidget extends StatefulWidget {
  const BottomPriceWidget({super.key});

  @override
  State<BottomPriceWidget> createState() => _BottomPriceWidgetState();
}

class _BottomPriceWidgetState extends State<BottomPriceWidget>
    with DialogHelper, LoadingStateMixin {
  final DraftingInvoiceBloc _draftingInvoiceBloc =
      getIt.get<DraftingInvoiceBloc>();

  // nút hoàn thành sẽ hiển thị khi có đầy đủ thông tin hóa đơn, phương thức thanh toán đầy đủ
  // nút sẽ render lại khi:
  //    - danh sách sản phẩm phải có
  //    - phương thức thanh toán đã điền đủ với số tiền khách cần thanh toán
  //    - các thông tin sp con...
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        BoxSpacer.s16,
        _normalView(),
        // _tradeInView(),
      ],
    );
  }

  ///
  /// WIDGET
  ///

  /// phải có sản phẩm mới hiện
  // Widget _tradeInView() {
  //   return BlocBuilder<DraftingInvoiceBloc, DraftingInvoiceState>(
  //     bloc: _draftingInvoiceBloc,
  //     buildWhen: (previous, current) =>
  //         current is UpdateProductTradeInSuccess ||
  //         current is IsGettingDetail ||
  //         current is GetCurrentDraftDataSuccess,
  //     builder: (context, state) {
  //       if ([CartType.tradeIn].contains(state.cartType) &&
  //           state.product != null) {
  //         return XButton(
  //           padding: EdgeInsets.symmetric(vertical: 16.sp, horizontal: 32.sp),
  //           onPressed: _onShowDialogSubmitTradeInForm,
  //           title: 'Hoàn tất',
  //         );
  //       }
  //       return BoxSpacer.blank;
  //     },
  //   );
  // }

  /// phải có sản phẩm mới hiện
  /// điềm đầu đủ thông tin sau thì enable
  /// - imei
  /// - các trường trong thông tin thanh toán
  Widget _normalView() {
    return BlocConsumer<DraftingInvoiceBloc, DraftingInvoiceState>(
      bloc: _draftingInvoiceBloc,
      // buildWhen: (previous, current) =>
      //     current is UpdateProductsSuccess ||
      //     current is IsGettingDetail ||
      //     current is GetCurrentDraftDataSuccess,
      listener: (context, state) {
        //   // lắng nghe các state bên dưới để tắt state loading
        //   if (state is CreateTradeInbillSuccess ||
        //       state is CreateBillSuccess ||
        //       state is CreateOrderSuccess) {
        //     updateLoadingState(false);
        //   }
      },
      builder: (context, state) {
        List<ProductTable> products = state.products;

        if ((products.isNotEmpty) &&
            [
              CartType.retail,
              CartType.updateBill,
              CartType.order,
              CartType.updateOrder
            ].contains(state.cartType)) {
          // nút chỉ có thể nhấn khi isloading là false và còn đủ tồn
          return ValueListenableBuilder<bool>(
              valueListenable: isLoading,
              builder: (context, loading, child) {
                // return XButton(
                //   // disable:
                //   //     products.checkProductNotEnoughInformation && !loading,
                //   padding:
                //       EdgeInsets.symmetric(vertical: 16.sp, horizontal: 32.sp),
                //   // onPressed: () => withLoading(
                //   //   () => _draftDetailBloc.add(SubmitDraftEvent()),
                //   //   warnProcessing: () => XToast.showWarningMessage(
                //   //       message: 'Đang xử lý, vui lòng đợi...'),
                //   // ),
                //   title: 'Hoàn tất',
                // );
                if (products.checkProductNotEnoughInformation && !loading) {
                  return BoxSpacer.blank;
                }
                return XSwipeButton(
                  title: 'Hoàn tất',
                  subTitle: 'Vuốt để hoàn tất',
                  onSwipeDone: (value) {
                    //
                  },
                  backgroundColor: AppColors.disabledActionColor,
                  subBackgroundColor: AppColors.primaryColor,
                  textColor: AppColors.white,
                  subTextColor: AppColors.white,
                );
              });
        }
        return BoxSpacer.blank;
      },
    );
  }

  ///
  /// METHOD
  ///

  _onShowDialogSubmitTradeInForm() {
    // showXBottomSheet(context, body: const TradeInConfirmDialog());
  }
}
