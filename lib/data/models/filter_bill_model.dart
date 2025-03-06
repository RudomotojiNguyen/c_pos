import '../../common/enum/enum.dart';
import 'store_model.dart';

class FilterBillModel {
  final String searchValue;
  final SearchType searchType;
  final FilterBillAndOrderType type;
  final StoreModel? store;

  const FilterBillModel({
    this.searchType = SearchType.billId,
    this.type = FilterBillAndOrderType.all,
    this.searchValue = '',
    this.store,
  });

  FilterBillModel copyWith({
    String? searchValue,
    SearchType? searchType,
    FilterBillAndOrderType? type,
    StoreModel? store,
  }) {
    return FilterBillModel(
      searchValue: searchValue ?? this.searchValue,
      searchType: searchType ?? this.searchType,
      type: type ?? this.type,
      store: store ?? this.store,
    );
  }

  FilterBillModel updateSearchText({
    String? searchValue,
  }) {
    return FilterBillModel(
      searchValue: searchValue ?? '',
      searchType: searchType,
      type: type,
      store: store,
    );
  }

  FilterBillModel updateSearchType({
    SearchType? searchType,
  }) {
    return FilterBillModel(
      searchValue: searchValue,
      searchType: searchType ?? this.searchType,
      type: type,
      store: store,
    );
  }

  bool get isFilter => type != FilterBillAndOrderType.all || store != null;

  int? get getStoreId => store?.id;

  int? get getSearchType => searchType.getValue;

  int? get getType => type.getValue;

  String get getSearchTypeShortTitle => searchType.getShortTitle;
}
