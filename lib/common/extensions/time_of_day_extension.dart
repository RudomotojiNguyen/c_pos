import 'package:flutter/material.dart';

extension TimeOfDayExtensions on TimeOfDay {
  /// Chuyển TimeOfDay sang DateTime
  DateTime convertTimeOfDayToDateTime() {
    final DateTime now = DateTime.now();
    final DateTime dateTime = DateTime(
      now.year,
      now.month,
      now.day,
      hour,
      minute,
    );
    return dateTime;
  }
}
