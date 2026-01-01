part of '../drafting_detail_screen.dart';

class BillNoteWidget extends StatefulWidget {
  const BillNoteWidget({super.key});

  @override
  State<BillNoteWidget> createState() => _BillNoteWidgetState();
}

class _BillNoteWidgetState extends State<BillNoteWidget> with DialogHelper {
  final DraftingInvoiceBloc _draftingInvoiceBloc =
      getIt.get<DraftingInvoiceBloc>();

  // ghi chú sẽ hiển thị khi có sản phẩm
  // widget render lại khi state hiện tại là:
  //    - lấy thông tin đơn
  //    - nếu danh sách sản phẩm trước đó trống và state hiện tại là cập nhật sản phầm
  //    - nếu danh sách sản phẩm hiện tại trống và state hiện tại là cập nhật sản phầm
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DraftingInvoiceBloc, DraftingInvoiceState>(
      bloc: _draftingInvoiceBloc,
      buildWhen: (previous, current) =>
          current is IsGettingDetail ||
          current is GetCurrentDraftDataSuccess ||
          (((previous.products?.isEmpty ?? true) ||
                  (current.products?.isEmpty ?? true)) &&
              current is UpdateProductsSuccess),
      builder: (context, state) {
        if ((state.products?.isEmpty ?? true) ||
            {CartType.tradeIn}.contains(state.cartType)) {
          return BoxSpacer.blank;
        }
        return XContainer(
          margin: EdgeInsets.only(top: 16.sp),
          iconTitle: Icon(Icons.sticky_note_2,
              size: 18.sp, color: AppColors.neutral3Color),
          rightIcon: XBaseButton(
            onPressed: () => onPressedEdit(context),
            child: Icon(Icons.edit, size: 18.sp, color: AppColors.iconColor),
          ),
          title: 'Ghi chú',
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _billNotes(),
              _warrantyNotes(),
              // BoxSpacer.s16,
              // _suggestWarrantyNote(context),
            ],
          ),
        );
      },
    );
  }

  ///
  /// WIDGET
  ///

  Widget _billNotes() {
    return BlocSelector<DraftingInvoiceBloc, DraftingInvoiceState, String?>(
      bloc: _draftingInvoiceBloc,
      selector: (state) => state.saleNote,
      builder: (context, state) {
        if (state.isNullOrEmpty) {
          return BoxSpacer.blank;
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            BoxSpacer.s16,
            _detail(
              title: 'CSKH',
              value: state!,
              onRemove: () {
                _draftingInvoiceBloc.add(
                  UpdateNoteEvent(
                    saleNote: null,
                    warrantyNote: _draftingInvoiceBloc.state.warrantyNote,
                  ),
                );
              },
            ),
          ],
        );
      },
    );
  }

  Widget _warrantyNotes() {
    return BlocSelector<DraftingInvoiceBloc, DraftingInvoiceState, String?>(
      bloc: _draftingInvoiceBloc,
      selector: (state) => state.warrantyNote,
      builder: (context, state) {
        if (state.isNullOrEmpty) {
          return BoxSpacer.blank;
        }
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            BoxSpacer.s16,
            _detail(
              title: 'Bảo hành',
              value: state!,
              onRemove: () {
                _draftingInvoiceBloc.add(
                  UpdateNoteEvent(
                    saleNote: _draftingInvoiceBloc.state.saleNote,
                    warrantyNote: null,
                  ),
                );
              },
            ),
          ],
        );
      },
    );
  }

  Widget _detail({
    required String title,
    required String value,
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
            value.trim(),
            style: AppFont.t.s(),
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
      key: GlobalAppKey.noteDetailDialogKey,
      maxHeight: 0.7.sh,
      body: ModifyNoteDialog(
        saleNote: _draftingInvoiceBloc.state.saleNote,
        warrantyNote: _draftingInvoiceBloc.state.warrantyNote,
        callBackResult: (sale, warranty) {
          Navigator.pop(ctx);
          _draftingInvoiceBloc.add(
            UpdateNoteEvent(
              saleNote: sale.isNotEmpty ? sale : null,
              warrantyNote: warranty.isNotEmpty ? warranty : null,
            ),
          );
        },
      ),
    );
  }
}
