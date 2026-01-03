enum XGenderType { male, female, other, none }

extension GenderExtension on XGenderType {
  static const Map<int, XGenderType> map = {
    1: XGenderType.male,
    2: XGenderType.female,
    3: XGenderType.other,
  };

  String get getTitle {
    switch (this) {
      case XGenderType.male:
        return 'Nam';
      case XGenderType.female:
        return 'Nữ';
      default:
        return 'Chưa rõ';
    }
  }

  String get getAppellation {
    switch (this) {
      case XGenderType.male:
        return 'Anh';
      case XGenderType.female:
        return 'Chị';
      default:
        return 'Chưa rõ';
    }
  }

  int? get getValue {
    switch (this) {
      case XGenderType.male:
        return 1;
      case XGenderType.female:
        return 0;
      default:
        return null;
    }
  }
}
