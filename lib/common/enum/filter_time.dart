enum FilterTime { all, today, threeDayAgo, over3DayAgo }

extension FilterTimeExtension on FilterTime {
  String get getTitle {
    switch (this) {
      case FilterTime.all:
        return 'Tất cả';
      case FilterTime.today:
        return 'Hôm nay';
      case FilterTime.threeDayAgo:
        return '3 ngày trước';
      case FilterTime.over3DayAgo:
        return 'Hơn 3 ngày trước';
    }
  }

  int? get getValue {
    switch (this) {
      case FilterTime.today:
        return 1;
      case FilterTime.threeDayAgo:
        return 2;
      case FilterTime.over3DayAgo:
        return 3;
      case FilterTime.all:
        return null;
    }
  }
}
