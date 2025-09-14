part of 'search_bill_widget.dart';

class IconSearchTypeBill extends StatelessWidget {
  const IconSearchTypeBill({
    super.key,
    required this.billBloc,
  });

  final BillBloc billBloc;

  @override
  Widget build(BuildContext context) {
    return CustomizePopUpWidget(
      content: _dataSearchType(context),
      child: _contentSearchType(),
    );
  }

  Widget _dataSearchType(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _itemDataSearchType(context, title: SearchType.billId.getTitle,
            onPressed: () {
          billBloc.add(UpdateSearchTypeEvent(searchType: SearchType.billId));
          Navigator.pop(context);
        }),
        _itemDataSearchType(context, title: SearchType.orderId.getTitle,
            onPressed: () {
          billBloc.add(UpdateSearchTypeEvent(searchType: SearchType.orderId));
          Navigator.pop(context);
        }),
        _itemDataSearchType(context, title: SearchType.billPhoneNumber.getTitle,
            onPressed: () {
          billBloc.add(
              UpdateSearchTypeEvent(searchType: SearchType.billPhoneNumber));
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

  Widget _contentSearchType() {
    return BlocBuilder<BillBloc, BillState>(
      bloc: billBloc,
      buildWhen: (previous, current) => current is UpdateSearchTypeSuccess,
      builder: (context, state) {
        return Text(
          state.filterInfo.getSearchTypeShortTitle,
          style: AppFont.t.s(),
        );
      },
    );
  }
}
