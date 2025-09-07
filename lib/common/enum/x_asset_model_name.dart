enum XAssetModelName {
  tradeIn,
}

extension XAssetModelNameExtension on XAssetModelName {
  static const Map<XAssetModelName, String> map = {
    XAssetModelName.tradeIn: 'trade-in',
  };

  String get getValue => map[this] ?? '';
}
