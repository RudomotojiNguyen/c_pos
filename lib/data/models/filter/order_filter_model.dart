import '../../../common/enum/enum.dart';
import '../store_model.dart';

class OrderFilterModel {
  final String searchValue;
  final SearchType searchType;
  final StatusEnum status;
  final FilterBillAndOrderType type;
  final FilterTime time;
  final StoreModel? store;

  const OrderFilterModel({
    this.searchType = SearchType.orderId,
    this.searchValue = '',
    this.status = StatusEnum.all,
    this.type = FilterBillAndOrderType.all,
    this.time = FilterTime.all,
    this.store,
  });

  OrderFilterModel copyWidth({
    String? searchValue,
    SearchType? searchType,
    StatusEnum? status,
    FilterBillAndOrderType? type,
    FilterTime? time,
    StoreModel? store,
  }) {
    return OrderFilterModel(
      searchType: searchType ?? this.searchType,
      searchValue: searchValue ?? this.searchValue,
      status: status ?? this.status,
      type: type ?? this.type,
      time: time ?? this.time,
      store: store,
    );
  }

  OrderFilterModel updateSearchValue({String? searchValue}) {
    return OrderFilterModel(
      searchType: searchType,
      searchValue: searchValue ?? this.searchValue,
      status: status,
      type: type,
      time: time,
      store: store,
    );
  }

  OrderFilterModel updateSearchType({required searchType}) {
    return OrderFilterModel(
      searchType: searchType,
      searchValue: searchValue,
      status: status,
      type: type,
      time: time,
      store: store,
    );
  }

  int? get getStatusValue => status.getValue;

  int? get getSearchTypeValue => searchType.getValue;

  int? get getTimeValue => time.getValue;

  int? get getStoreId => store?.id;

  int? get getOrderTypeValue => type.getValue;

  String get searchTypeShortTitle => searchType.getShortTitle;

  bool get isFilter {
    return status != StatusEnum.all ||
        type != FilterBillAndOrderType.all ||
        time != FilterTime.all ||
        store != null;
  }
}
