enum ProductType {
  normal, // sản phẩm phụ kiện
  imei, // sản phẩm theo IMEI
  combo, // sản phẩm combo
  component, // sản phẩm linh kiện
  service, // sản phẩm dịch vụ
}

extension ProductTypeExtension on ProductType {
  static const Map<int, ProductType> map = {
    1: ProductType.normal,
    2: ProductType.imei,
    3: ProductType.combo,
    4: ProductType.service,
    7: ProductType.component,
  };

  int get getValueType => switch (this) {
        ProductType.imei => 2,
        ProductType.combo => 3,
        ProductType.service => 4,
        ProductType.component => 7,
        ProductType.normal => 1,
      };
}
