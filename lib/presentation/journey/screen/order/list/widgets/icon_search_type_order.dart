part of 'search_order_widget.dart';

class IconSearchTypeOrder extends StatelessWidget {
  const IconSearchTypeOrder({super.key, required this.orderBloc});

  final OrderBloc orderBloc;

  @override
  Widget build(BuildContext context) {
    return CustomizePopUpWidget(
      content: _dataSearchType(context),
      child: _contentSearchType(),
    );
  }

  Widget _contentSearchType() {
    return BlocBuilder<OrderBloc, OrderState>(
      bloc: orderBloc,
      buildWhen: (previous, current) => current is UpdateSearchTypeSuccess,
      builder: (context, state) {
        return Text(
          state.orderFilter.searchTypeShortTitle,
          style: AppFont.t.s(),
        );
      },
    );
  }

  Widget _dataSearchType(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _itemDataSearchType(context, title: 'Mã hóa đơn', onPressed: () {
          orderBloc.add(UpdateSearchTypeEvent(SearchType.orderId));
          Navigator.pop(context);
        }),
        _itemDataSearchType(context, title: 'Số điện thoại', onPressed: () {
          orderBloc.add(UpdateSearchTypeEvent(SearchType.orderPhoneNumber));
          Navigator.pop(context);
        }),
      ],
    );
  }

  Widget _itemDataSearchType(
    BuildContext context, {
    required String title,
    required Function() onPressed,
  }) {
    return XBaseButton(
      onPressed: onPressed,
      padding: EdgeInsets.symmetric(vertical: 4.sp),
      child: Text(
        title,
        style: AppFont.t.s(),
      ),
    );
  }
}
