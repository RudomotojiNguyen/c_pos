enum XOrderInsertType {
  app, // app mobile,
  nhanh, // nhanh
  crm, // crm
  web, // website mkt
}

extension XOrderInsertTypeExtension on XOrderInsertType {
  static const Map<int, XOrderInsertType> map = {
    1: XOrderInsertType.app,
    2: XOrderInsertType.nhanh,
    3: XOrderInsertType.crm,
    4: XOrderInsertType.web,
  };

  int get getValueType =>
      map.entries.firstWhere((element) => element.value == this).key;

  String get getTypeName => switch (this) {
        XOrderInsertType.app => 'APP',
        XOrderInsertType.nhanh => 'NHANH',
        XOrderInsertType.crm => 'CRM',
        XOrderInsertType.web => 'WEBSITE',
      };
}
