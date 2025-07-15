/// DESC: Gần nhất, ASC: Xa nhất
enum XSortEnum { desc, asc }

extension XSortEnumExtension on XSortEnum {
  String get getValue {
    switch (this) {
      case XSortEnum.asc:
        return 'ASC';
      case XSortEnum.desc:
        return 'DESC';
    }
  }
}
