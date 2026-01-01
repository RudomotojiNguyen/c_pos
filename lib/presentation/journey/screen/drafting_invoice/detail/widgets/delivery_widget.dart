part of '../drafting_detail_screen.dart';

class DeliveryWidget extends StatefulWidget {
  const DeliveryWidget({super.key});

  @override
  State<DeliveryWidget> createState() => _DeliveryWidgetState();
}

class _DeliveryWidgetState extends State<DeliveryWidget>
    with SingleTickerProviderStateMixin, DialogHelper {
  late AnimationController _controller;
  final DraftingInvoiceBloc _draftingInvoiceBloc =
      getIt.get<DraftingInvoiceBloc>();

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  // sẽ chỉ hiện nếu type là order, updateorder
  // cần phải có thông tin khách hàng
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DraftingInvoiceBloc, DraftingInvoiceState>(
      bloc: _draftingInvoiceBloc,
      buildWhen: (previous, current) =>
          current is GetCurrentDraftDataSuccess ||
          current is IsGettingDetail ||
          current is UpdateCustomerSuccess ||
          current is UpdateProductsSuccess ||
          current is UpdateDeliveryFeeSuccess,
      builder: (context, state) {
        if ({CartType.order, CartType.updateOrder}.contains(state.cartType) &&
            (state.customer != null &&
                state.customer!.getCustomerPhone.isNotEmpty) &&
            (state.products ?? []).isNotEmpty) {
          return XContainer(
            margin: EdgeInsets.only(top: 16.sp),
            iconTitle: Icon(Icons.local_shipping,
                size: 18.sp, color: AppColors.neutral3Color),
            rightIcon: XBaseButton(
              onPressed: () => onPressedEdit(context),
              child: Icon(Icons.edit, size: 18.sp, color: AppColors.iconColor),
            ),
            title: 'Vận chuyển',
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (state.getCustomerFee > 0) ...[
                  _detail(
                    title: 'Phí vận chuyển (thu khách)',
                    value: state.getCustomerFee,
                    onRemove: () {
                      _draftingInvoiceBloc.add(
                        UpdateFeeDeliveryEvent(
                          customerFee: 0,
                          shippingCompanyFee: state.getShippingCompanyFee,
                        ),
                      );
                    },
                  ),
                ],
                if (state.deliveryFee?.useDelivery ?? false) ...[BoxSpacer.s16],
                if (state.getShippingCompanyFee > 0) ...[
                  _detail(
                    title: 'Phí trả đơn vị vận chuyển',
                    value: state.getShippingCompanyFee,
                    onRemove: () {
                      _draftingInvoiceBloc.add(
                        UpdateFeeDeliveryEvent(
                          customerFee: state.getCustomerFee,
                          shippingCompanyFee: 0,
                        ),
                      );
                    },
                  ),
                ],
              ],
            ),
          );
        }
        return BoxSpacer.blank;
      },
    );
  }

  ///
  /// WIDGET
  ///
  Widget _detail({
    required String title,
    required int value,
    Function()? onRemove,
  }) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: [
            Expanded(
              child: Text(title, style: AppFont.t.s()),
            ),
            XBaseButton(
              onPressed: onRemove,
              child: Assets.svg.remove.svg(
                width: 24.sp,
                height: 24.sp,
              ),
            ),
          ],
        ),
        Container(
          padding: EdgeInsets.symmetric(vertical: 16.sp, horizontal: 16.sp),
          decoration: BoxDecoration(
            color: AppColors.lightGreyColor,
            borderRadius: BorderRadius.all(AppRadius.l),
          ),
          child: Text(
            value.formatCurrency,
            style: AppFont.t.s(16),
            textAlign: TextAlign.end,
            maxLines: 5,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }

  ///
  /// METHOD
  ///
  void onPressedEdit(BuildContext ctx) {
    showXBottomSheet(
      ctx,
      body: DeliveryDialog(
        onResult: (int customerFee, int shippingCompanyFee) {
          _draftingInvoiceBloc.add(
            UpdateFeeDeliveryEvent(
              customerFee: customerFee,
              shippingCompanyFee: shippingCompanyFee,
            ),
          );
        },
        shippingCompanyFee: _draftingInvoiceBloc.state.getShippingCompanyFee,
        customerFee: _draftingInvoiceBloc.state.getCustomerFee,
      ),
    );
  }
}
