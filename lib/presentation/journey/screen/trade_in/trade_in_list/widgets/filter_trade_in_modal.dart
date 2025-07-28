import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../common/configs/box.dart';
import '../../../../../widgets/widgets.dart';

class FilterTradeInModal extends StatefulWidget {
  const FilterTradeInModal({
    super.key,
    required this.onSetDefaultFilter,
    required this.onFilter,
    this.data = const [],
  });

  final Function() onSetDefaultFilter;
  final Function(List<DateTime?> data) onFilter;
  final List<DateTime?> data;

  @override
  State<FilterTradeInModal> createState() => _FilterTradeInModalState();
}

class _FilterTradeInModalState extends State<FilterTradeInModal> {
  late ValueNotifier<List<DateTime?>> datesSelected;

  @override
  void initState() {
    super.initState();
    datesSelected = ValueNotifier(widget.data);
  }

  @override
  void dispose() {
    datesSelected.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300.sp,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          XCalenderSelectWidget(
            values: datesSelected.value,
            lastDate: DateTime.now(),
            calendarType: CalendarDatePicker2Type.range,
            onValueChanged: (dates) {
              datesSelected.value = dates;
            },
          ),
          _bottom(context),
        ],
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
            widget.onSetDefaultFilter();
            Navigator.pop(context);
          },
        ),
        BoxSpacer.s8,
        XButton(
          padding: EdgeInsets.symmetric(vertical: 12.sp, horizontal: 32.sp),
          title: 'Lọc',
          onPressed: () {
            List<DateTime?> dates = datesSelected.value;
            widget.onFilter(dates);
            Navigator.pop(context);
          },
        ),
      ],
    );
  }
}
