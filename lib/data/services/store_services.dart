import '../datasources/remote/store_api.dart';
import '../models/history_change_store_model.dart';
import '../models/store_model.dart';

part 'impl/store_services_impl.dart';

abstract class StoreServices {
  Future<List<StoreModel>> getStores();

  Future<List<StoreModel>> getApproveStores();

  Future<bool> changeStore(Map<String, dynamic> params);

  Future<List<HistoryChangeStoreModel>> getHistoriesChangeStore(
      {required int page, required int pageSize});

  Future<bool> createSwitchStore(Map<String, dynamic> params);
}
