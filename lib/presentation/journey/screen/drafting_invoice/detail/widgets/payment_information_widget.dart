part of '../drafting_detail_screen.dart';

class PaymentInformationWidget extends StatefulWidget {
  const PaymentInformationWidget({super.key});

  @override
  State<PaymentInformationWidget> createState() =>
      _PaymentInformationWidgetState();
}

class _PaymentInformationWidgetState extends State<PaymentInformationWidget> {
  final DraftingInvoiceBloc _draftingInvoiceBloc =
      getIt.get<DraftingInvoiceBloc>();

  // thông tin thanh toán hiển thị khi có sản phẩm
  // widget render lại với tất cả state
  // todo: thêm thông tin vận chuyển
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DraftingInvoiceBloc, DraftingInvoiceState>(
      bloc: _draftingInvoiceBloc,
      buildWhen: (previous, current) =>
          current is UpdateCalculatorPriceSuccess ||
          current is GetCurrentDraftDataSuccess ||
          current is IsGettingDetail,
      builder: (context, state) {
        if ((state.products?.isEmpty ?? true) ||
            {CartType.tradeIn}.contains(state.cartType)) {
          return BoxSpacer.blank;
        }

        return XSummeryPaymentInfo(
          totalPriceNoneDiscount: state.totalPriceNoneDiscount,
          totalDiscountPriceOfBillItem: state.totalDiscountPriceOfBillItem,
          discountOfBill: state.discountOfBill,
          discountOfPoint: state.discountOfPoint,
          totalPrePayment: state.totalPrePayment,
          finalPrice: state.finalPrice,
        );
      },
    );
  }
}
