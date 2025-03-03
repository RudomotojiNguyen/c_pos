part of '../store_repository.dart';

class StoreRepositoryImpl implements StoreRepository {
  final StoreServices storeServices;

  StoreRepositoryImpl({required this.storeServices});

  @override
  Future<List<StoreModel>> getStores() {
    return storeServices.getStores();
  }

  @override
  Future<List<StoreModel>> getApproveStores() {
    return storeServices.getApproveStores();
  }

  @override
  Future<bool> changeStore({required int storeId}) {
    final params = {"storeId": storeId};
    return storeServices.changeStore(params);
  }

  @override
  Future<List<HistoryChangeStoreModel>> getHistoriesChangeStore(
      {required int page, required int pageSize}) {
    return storeServices.getHistoriesChangeStore(
        page: page, pageSize: pageSize);
  }

  @override
  Future<bool> createSwitchStore(
      {required int employeeId,
      required int currentStoreId,
      required int targetStoreId,
      required String description}) {
    var params = {
      "employeeId": employeeId,
      "currentStoreId": currentStoreId,
      "targetStoreId": targetStoreId,
      "description": description,
    };

    return storeServices.createSwitchStore(params);
  }
}
