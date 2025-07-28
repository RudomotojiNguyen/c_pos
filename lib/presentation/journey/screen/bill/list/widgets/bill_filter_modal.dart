import 'package:c_pos/common/extensions/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

import '../../../../../../common/configs/box.dart';
import '../../../../../../common/di/injection/injection.dart';
import '../../../../../../common/enum/enum.dart';
import 'package:c_pos/data/models/models.dart';
import '../../../../../theme/themes.dart';
import '../../../../../widgets/widgets.dart';
import '../../../store/bloc/store_bloc.dart';

class BillFilterModal extends StatefulWidget {
  const BillFilterModal(
      {super.key,
      required this.onSetDefault,
      required this.onFilter,
      this.store,
      required this.type});

  final Function() onSetDefault;
  final Function(
    StoreModel? store,
    FilterBillAndOrderType type,
  ) onFilter;

  final StoreModel? store;
  final FilterBillAndOrderType type;

  @override
  State<BillFilterModal> createState() => _BillFilterModalState();
}

class _BillFilterModalState extends State<BillFilterModal> {
  late ValueNotifier<StoreModel?> store;
  late ValueNotifier<FilterBillAndOrderType> type;
  final TextEditingController textEditingController = TextEditingController();
  final StoreBloc _storeBloc = getIt.get<StoreBloc>();

  @override
  void initState() {
    super.initState();
    store = ValueNotifier(widget.store);
    type = ValueNotifier(widget.type);
    if (widget.store != null) {
      textEditingController.text = widget.store!.getName;
    }
  }

  @override
  void dispose() {
    store.dispose();
    type.dispose();
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300.sp,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _store(context),
          BoxSpacer.s8,
          _type(context),
          BoxSpacer.s8,
          _bottom(context)
        ],
      ),
    );
  }

  Widget _store(BuildContext context) {
    return TypeAheadField<StoreModel>(
      controller: textEditingController,
      itemBuilder: (context, store) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.sp, vertical: 4.sp),
          child: Text(
            store.name ?? '',
            style: AppFont.t.s(),
          ),
        );
      },
      onSelected: (value) {
        store.value = value;
        textEditingController.text = value.getName;
      },
      suggestionsCallback: (search) => _storeBloc.suggestionsCallback(search),
      constraints: BoxConstraints(maxHeight: 180.sp),
      emptyBuilder: (context) {
        return const EmptyDataWidget(
          emptyMessage: 'Không có cửa hàng trùng khớp',
        );
      },
      builder: (context, controller, focusNode) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Cửa hàng',
              style: AppFont.t.s(),
            ),
            BoxSpacer.s4,
            Container(
              decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.all(AppRadius.l),
                  border:
                      Border.all(width: 1.sp, color: AppColors.dividerColor)),
              child: XTextField(
                controller: controller,
                focusNode: focusNode,
                hintText: 'Chọn cửa hàng',
                autoFocus: false,
                decorationStyle: DecorationStyle.search,
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _type(BuildContext context) {
    final List<FilterBillAndOrderType> filterBillAndOrderType = [
      FilterBillAndOrderType.all,
      FilterBillAndOrderType.retail,
      FilterBillAndOrderType.wholesaleInvoice,
      FilterBillAndOrderType.refundInvoice,
      FilterBillAndOrderType.guarantee,
    ];

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Loại',
          style: AppFont.t.s(),
        ),
        BoxSpacer.s4,
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              ...filterBillAndOrderType.map(
                (e) => ValueListenableBuilder(
                    valueListenable: type,
                    builder: (context, value, _) {
                      return _itemFilter(
                        title: e.getTitle,
                        isSelected: value == e,
                        onPressed: () {
                          type.value = e;
                        },
                      );
                    }),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _itemFilter(
      {required String title, Function()? onPressed, bool isSelected = false}) {
    return XBaseButton(
      padding: EdgeInsets.symmetric(horizontal: 4.sp, vertical: 4.sp),
      onPressed: onPressed,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(AppRadius.s),
          color: isSelected ? AppColors.primaryColor : AppColors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.1),
              offset: const Offset(-1, 1), // changes position of shadow
            ),
          ],
        ),
        padding: EdgeInsets.symmetric(horizontal: 8.sp, vertical: 4.sp),
        child: Text(
          title,
          style: AppFont.t.s().copyWith(
                color: !isSelected ? AppColors.neutralColor : AppColors.white,
              ),
        ),
      ),
    );
  }

  Widget _bottom(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        XButton(
          title: 'Mặc định',
          padding: EdgeInsets.symmetric(vertical: 12.sp, horizontal: 32.sp),
          type: XButtonType.secondary,
          onPressed: () {
            widget.onSetDefault();
            Navigator.pop(context);
          },
        ),
        BoxSpacer.s8,
        XButton(
          padding: EdgeInsets.symmetric(vertical: 12.sp, horizontal: 32.sp),
          title: 'Lọc',
          onPressed: () {
            widget.onFilter(
              store.value,
              type.value,
            );
            Navigator.pop(context);
          },
        ),
      ],
    );
  }
}
