enum XRefType {
  product,
  category,
  brand,
}

extension XRefTypeExtension on XRefType {
  static const Map<XRefType, int> map = {
    XRefType.product: 1,
    XRefType.category: 2,
    XRefType.brand: 3,
  };

  int get getValue => map[this] ?? 1;
}
