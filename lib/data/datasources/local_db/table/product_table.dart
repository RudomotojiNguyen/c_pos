import 'package:isar/isar.dart';

part 'product_table.g.dart';

part 'extensions/product_table_extension.dart';

@Collection()
class ProductTable {
  Id id = Isar.autoIncrement;

  /// id sản phẩm
  int? productId;

  /// tên sản phẩm
  String? productName;
}
