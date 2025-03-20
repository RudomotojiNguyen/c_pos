part of '../warranty_repositories.dart';

class WarrantyRepositoriesImpl implements WarrantyRepositories {
  final WarrantyServices warrantyServices;

  WarrantyRepositoriesImpl({required this.warrantyServices});

  @override
  Future<List<SuggestNoteModel>> getWarrantyInfo(
      {required int page, required int size, String? name}) {
    return warrantyServices.getWarrantyInfo(page: page, size: size, name: name);
  }

  @override
  Future<List<WarrantyModel>> getWarrantyList(
      {required int page, required int limit, List<int> storeIds = const []}) {
    return warrantyServices.getWarrantyList(
        page: page, limit: limit, storeIds: storeIds);
  }
}
