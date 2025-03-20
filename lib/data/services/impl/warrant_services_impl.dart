part of '../warranty_services.dart';

class WarrantyServicesImpl implements WarrantyServices {
  final WarrantyApi warrantyApi;

  WarrantyServicesImpl({required this.warrantyApi});

  @override
  Future<List<SuggestNoteModel>> getWarrantyInfo(
      {required int page, required int size, String? name}) {
    return warrantyApi.getWarrantyInfo(page: page, size: size, name: name).then(
      (value) {
        List<SuggestNoteModel> data = [];

        for (var item in value.getListData) {
          data.add(SuggestNoteModel.fromJson(item));
        }

        return data;
      },
    );
  }

  @override
  Future<List<WarrantyModel>> getWarrantyList(
      {required int page, required int limit, List<int> storeIds = const []}) {
    return warrantyApi
        .getWarrantyList(page: page, size: limit, storeIds: storeIds)
        .then(
      (value) {
        List<WarrantyModel> data = [];

        for (var item in value.getListData) {
          data.add(WarrantyModel.fromJson(item));
        }

        return data;
      },
    );
  }
}
