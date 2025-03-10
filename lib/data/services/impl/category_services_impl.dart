part of '../category_service.dart';

class CategoryServicesImpl implements CategoryServices {
  final CategoryApi categoryApi;

  CategoryServicesImpl({required this.categoryApi});

  @override
  Future<List<CategoryModel>> getAllInternalCategory() async {
    List<CategoryModel> categories = [];
    final res = await categoryApi.getAllInternalCategory();
    (res.data ?? []).forEach((item) {
      categories.add(CategoryModel.fromJson(item));
    });
    return categories;
  }
}
