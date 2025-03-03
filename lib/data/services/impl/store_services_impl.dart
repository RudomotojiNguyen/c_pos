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
  Future<bool> changeStore(Map<String, dynamic> params) {
    return storeApi.changeStore(params).then((res) {
      return res.checkIsSuccess;
    });
  }

  @override
  Future<List<HistoryChangeStoreModel>> getHistoriesChangeStore(
      {required int page, required int pageSize}) {
    return storeApi
        .getHistoriesChangeStore(page: page, pageSize: pageSize)
        .then(
      (response) {
        if (response.checkIsSuccess) {
          if (response.data.containsKey('list_transfer_store_form')) {
            return (response.data['list_transfer_store_form'] as List)
                .map<HistoryChangeStoreModel>((item) {
              return HistoryChangeStoreModel.fromJson(item);
            }).toList();
          } else {
            throw Exception(
                'No list_transfer_store_form found in response data');
          }
        } else {
          throw Exception('Failed to load history change store');
        }
      },
    );
  }

  @override
  Future<bool> createSwitchStore(Map<String, dynamic> params) {
    return storeApi.createSwitchStore(params).then((res) {
      return res.checkIsSuccess;
    });
  }
}
