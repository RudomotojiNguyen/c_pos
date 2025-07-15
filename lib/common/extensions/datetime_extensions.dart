import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../enum/enum.dart';

extension DatetimeExtensions on DateTime {
  String formatDateTime({XDateTimeEnum format = XDateTimeEnum.yearMonthDay}) {
    return DateFormat(format.getValue).format(this);
  }

  bool isExpired() {
    return isBefore(DateTime.now());
  }

  bool isToday() {
    DateTime now = DateTime.now();
    return year == now.year && month == now.month && day == now.day;
  }

  /// Lấy số ngày trong tháng hiện tại
  int daysInMonth() {
    final nextMonth = month == 12 ? 1 : month + 1;
    final nextYear = month == 12 ? year + 1 : year;
    return DateTime(nextYear, nextMonth, 0).day; // Ngày cuối của tháng
  }

  /// Lấy ngày đầu tiên của tháng (thứ 2 -> CN: 0 -> 6)
  int firstDayOfMonth() {
    final firstDay = DateTime(year, month, 1).weekday;
    return firstDay == DateTime.sunday
        ? 6
        : firstDay - 1; // Điều chỉnh cho T2 -> CN
  }

  /// lấy buổi sáng/tối
  XMomentTimeEnum get checkMomentTime {
    final hour = this.hour;

    // Buổi sáng (6h - 18h)
    if (hour >= 6 && hour < 18) {
      return XMomentTimeEnum.morning;
    } else {
      return XMomentTimeEnum.evening;
    }
  }

  TimeOfDay convertDateTimeToTimeOfDay() {
    return TimeOfDay(hour: hour, minute: minute);
  }
}
