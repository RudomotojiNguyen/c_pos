import '../datasources/remote/api_remote.dart';
import '../models/store_model.dart';

part 'impl/store_services_impl.dart';

abstract class StoreServices {
  Future<List<StoreModel>> getStores();

  Future<List<StoreModel>> getApproveStores();

  Future<bool> changeStore({required int storeId});

  Future<bool> createSwitchStore(
      {required int employeeId,
      required int currentStoreId,
      required int targetStoreId,
      required String description});

  Future<List<StoreModel>> getStoresByUser();
}
