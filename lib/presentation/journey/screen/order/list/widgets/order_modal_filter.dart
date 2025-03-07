import 'package:c_pos/common/di/injection/injection.dart';
import 'package:c_pos/common/extensions/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

import '../../../../../../common/configs/box.dart';
import '../../../../../../common/enum/enum.dart';
import '../../../../../../data/models/store_model.dart';
import '../../../../../theme/themes.dart';
import '../../../../../widgets/widgets.dart';
import '../../../store/bloc/store_bloc.dart';

class OrderModalFilter extends StatefulWidget {
  const OrderModalFilter(
      {super.key,
      required this.onFilter,
      required this.onDefault,
      required this.status,
      required this.type,
      required this.time,
      this.store});

  final Function(StatusEnum?, FilterBillAndOrderType?, FilterTime?, StoreModel?)
      onFilter;
  final Function() onDefault;

  final StatusEnum status;
  final FilterBillAndOrderType type;
  final FilterTime time;
  final StoreModel? store;

  @override
  State<OrderModalFilter> createState() => _OrderModalFilterState();
}

class _OrderModalFilterState extends State<OrderModalFilter> {
  late ValueNotifier<StatusEnum> status;
  late ValueNotifier<FilterBillAndOrderType> type;
  late ValueNotifier<FilterTime> time;
  late ValueNotifier<StoreModel?> store;

  final TextEditingController _controller = TextEditingController();

  final StoreBloc _storeBloc = getIt.get<StoreBloc>();

  @override
  void initState() {
    super.initState();
    status = ValueNotifier(widget.status);
    type = ValueNotifier(widget.type);
    time = ValueNotifier(widget.time);
    store = ValueNotifier(widget.store);
    if (widget.store != null) {
      _controller.text = widget.store!.getName;
    }
  }

  @override
  void dispose() {
    status.dispose();
    type.dispose();
    time.dispose();
    store.dispose();
    _controller.dispose();
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
          _status(context),
          BoxSpacer.s8,
          _orderType(context),
          BoxSpacer.s8,
          _time(context),
          BoxSpacer.s16,
          _bottom(context)
        ],
      ),
    );
  }

  Widget _store(BuildContext context) {
    return TypeAheadField<StoreModel>(
      controller: _controller,
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
        _controller.text = value.getName;
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
                borderRadius: BorderRadius.circular(16.sp),
                border: Border.all(width: 1.sp, color: AppColors.dividerColor),
              ),
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

  Widget _bottom(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        XButton(
          title: 'Mặc định',
          padding: EdgeInsets.symmetric(vertical: 12.sp, horizontal: 32.sp),
          type: XButtonType.secondary,
          onPressed: () {
            status.value = StatusEnum.all;
            type.value = FilterBillAndOrderType.all;
            time.value = FilterTime.all;
            store.value = null;
            widget.onDefault();
            Navigator.pop(context);
          },
        ),
        BoxSpacer.s8,
        XButton(
          padding: EdgeInsets.symmetric(vertical: 12.sp, horizontal: 32.sp),
          title: 'Lọc',
          onPressed: () {
            widget.onFilter(status.value, type.value, time.value, store.value);
            Navigator.pop(context);
          },
        ),
      ],
    );
  }

  Widget _status(BuildContext context) {
    final List<StatusEnum> statusFilter = [
      StatusEnum.all,
      StatusEnum.confirmed,
      StatusEnum.ready,
      StatusEnum.packing,
      StatusEnum.customerCancel,
      StatusEnum.systemCancel,
    ];
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Trạng thái',
          style: AppFont.t.s(),
        ),
        BoxSpacer.s4,
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              ...statusFilter.map(
                (e) => ValueListenableBuilder(
                    valueListenable: status,
                    builder: (context, value, _) {
                      return _itemFilter(
                        title: e.getTitle,
                        isSelected: value == e,
                        onPressed: () {
                          status.value = e;
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

  Widget _orderType(BuildContext context) {
    final List<FilterBillAndOrderType> filterBillAndOrderType = [
      FilterBillAndOrderType.all,
      FilterBillAndOrderType.preOrder,
      FilterBillAndOrderType.api,
      FilterBillAndOrderType.store,
      FilterBillAndOrderType.delivery,
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

  Widget _time(BuildContext context) {
    final List<FilterTime> filterTime = [
      FilterTime.all,
      FilterTime.today,
      FilterTime.threeDayAgo,
      FilterTime.over3DayAgo,
    ];

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Thời gian',
          style: AppFont.t.s(),
        ),
        BoxSpacer.s4,
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              ...filterTime.map(
                (e) => ValueListenableBuilder(
                    valueListenable: time,
                    builder: (context, value, _) {
                      return _itemFilter(
                        title: e.getTitle,
                        isSelected: value == e,
                        onPressed: () {
                          time.value = e;
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
          borderRadius: BorderRadius.circular(5.sp),
          color: isSelected ? AppColors.primaryColor : AppColors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
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
}
