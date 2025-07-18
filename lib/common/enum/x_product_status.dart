enum XProductStatus {
  none,
  selling, // đang bán
  stopSelling, // ngừng bán
}

extension XProductStatusExtension on XProductStatus {
  static const Map<int, XProductStatus> map = {
    1: XProductStatus.selling,
    2: XProductStatus.stopSelling,
  };

  int get getValueNum => switch (this) {
        XProductStatus.selling => 1,
        XProductStatus.stopSelling => 2,
        _ => 0,
      };
}
