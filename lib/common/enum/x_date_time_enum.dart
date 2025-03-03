enum XDateTimeEnum {
  hourMinutes,
  dayMonthYear,
  secondDayMonthYear,
  fullDateTime,
  defaultDateTime,
  defaultDateTimeBasic,
  yearMonthDay,
  hourMinuteSecond,
  yearMonth,
}

extension XDateTimeEnumExtension on XDateTimeEnum {
  String get getValue {
    switch (this) {
      case XDateTimeEnum.hourMinutes:
        return 'HH:mm';
      case XDateTimeEnum.hourMinuteSecond:
        return 'HH:mm:ss';
      case XDateTimeEnum.fullDateTime:
        return 'HH:mm, dd/MM/yyyy';
      case XDateTimeEnum.defaultDateTime:
        return 'yyyy-MM-ddTHH:mm:ss.sssZ';
      case XDateTimeEnum.defaultDateTimeBasic:
        return 'yyyy-MM-dd HH:mm:ss';
      case XDateTimeEnum.yearMonthDay:
        return 'yyyy-MM-dd';
      case XDateTimeEnum.yearMonth:
        return 'yyyy-MM';
      case XDateTimeEnum.secondDayMonthYear:
        return 'dd-MM-yyyy';
      case XDateTimeEnum.dayMonthYear:
      default:
        return 'dd/MM/yyyy';
    }
  }
}
