import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';

import 'month_item_widget.dart';
import 'year_item_widget.dart';

class XCalenderSelectWidget extends StatelessWidget {
  const XCalenderSelectWidget({
    super.key,
    required this.values,
    this.weekdayLabels = const ['CN', 'T2', 'T3', 'T4', 'T5', 'T6', 'T7'],
    this.lastDate,
    this.calendarType,
    this.onValueChanged,
  });

  final List<DateTime?> values;
  final List<String> weekdayLabels;
  final DateTime? lastDate;
  final CalendarDatePicker2Type? calendarType;
  final Function(List<DateTime>)? onValueChanged;

  @override
  Widget build(BuildContext context) {
    return CalendarDatePicker2(
      config: CalendarDatePicker2Config(
        calendarType: calendarType,
        lastDate: lastDate,
        firstDayOfWeek: 1,
        weekdayLabels: weekdayLabels,
        monthBuilder: (
                {decoration,
                isCurrentMonth,
                isDisabled,
                isSelected,
                required month,
                textStyle}) =>
            MonthItemWidget(
          month: month,
          decoration: decoration,
          isCurrentMonth: isCurrentMonth,
          isDisabled: isDisabled,
          isSelected: isSelected,
          textStyle: textStyle,
        ),
        yearBuilder: (
                {decoration,
                isCurrentYear,
                isDisabled,
                isSelected,
                textStyle,
                required year}) =>
            YearItemWidget(
          year: year,
          isCurrentYear: isCurrentYear,
          decoration: decoration,
          isDisabled: isDisabled,
          isSelected: isSelected,
          textStyle: textStyle,
        ),
      ),
      value: values,
      onValueChanged: onValueChanged,
    );
  }
}
