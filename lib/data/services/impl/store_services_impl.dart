part of '../store_services.dart';

class StoreServicesImpl implements StoreServices {
  final StoreApi storeApi;

  StoreServicesImpl({required this.storeApi});

  @override
  Future<List<StoreModel>> getStores() async {
    List<StoreModel> data = [];

    final res = await storeApi.getStores();

    (res.data ?? []).forEach((item) {
      data.add(StoreModel.fromJson(item));
    });

    return data;
  }

  @override
  Future<List<StoreModel>> getApproveStores() async {
    List<StoreModel> data = [];

    final res = await storeApi.getApproveStores();

    (res.data ?? []).forEach((item) {
      data.add(StoreModel.fromJson(item));
    });

    return data;
  }

  @override
  Future<bool> changeStore({required int storeId}) {
    final params = {"storeId": storeId};
    return storeApi.changeStore(params).then((res) {
      return res.checkIsSuccess;
    });
  }

  @override
  Future<bool> createSwitchStore({
    required int employeeId,
    required int currentStoreId,
    required int targetStoreId,
    required String description,
  }) {
    var params = {
      "employeeId": employeeId,
      "currentStoreId": currentStoreId,
      "targetStoreId": targetStoreId,
      "description": description,
    };
    return storeApi.createSwitchStore(params).then((res) {
      return res.checkIsSuccess;
    });
  }

  @override
  Future<List<StoreModel>> getStoresByUser() async {
    List<StoreModel> data = [];

    final res = await storeApi.getStoresByUser();

    final storesData = res.data['stores'] as List;

    for (var item in storesData) {
      data.add(StoreModel.fromJson(item));
    }

    return data;
  }
}
