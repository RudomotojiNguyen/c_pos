part of '../category_repository.dart';

class CategoryRepositoryImpl implements CategoryRepository {
  final CategoryServices categoryServices;

  CategoryRepositoryImpl({required this.categoryServices});

  @override
  Future<List<CategoryModel>> getAllInternalCategory() async {
    return categoryServices.getAllInternalCategory();
  }
}
