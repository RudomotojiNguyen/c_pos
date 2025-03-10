import '../models/category_model.dart';
import '../services/category_service.dart';

part 'impl/category_repository_impl.dart';

abstract class CategoryRepository {
  Future<List<CategoryModel>> getAllInternalCategory();
}
