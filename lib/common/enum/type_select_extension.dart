enum TypeSelect { none, single, multiple }

extension TypeSelectExtension on TypeSelect {
  static const Map<int, TypeSelect> mapTypeSelect = {
    1: TypeSelect.single,
    2: TypeSelect.multiple,
  };
}
