import '../datasources/remote/api_remote.dart';
import '../models/history_change_store_model.dart';
import '../models/store_model.dart';

part 'impl/store_services_impl.dart';

abstract class StoreServices {
  Future<List<StoreModel>> getStores();

  Future<List<StoreModel>> getApproveStores();

  Future<bool> changeStore({required int storeId});

  Future<List<HistoryChangeStoreModel>> getHistoriesChangeStore(
      {required int page, required int pageSize});

  Future<bool> createSwitchStore(
      {required int employeeId,
      required int currentStoreId,
      required int targetStoreId,
      required String description});

  Future<List<StoreModel>> getStoresByUser();
}
