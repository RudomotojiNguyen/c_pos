import '../datasources/remote/api_remote.dart';
import '../models/category_model.dart';

part 'impl/category_services_impl.dart';

abstract class CategoryServices {
  Future<List<CategoryModel>> getAllInternalCategory();
}
