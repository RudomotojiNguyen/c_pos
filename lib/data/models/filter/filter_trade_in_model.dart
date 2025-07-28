import 'package:c_pos/common/extensions/extension.dart';

import '../../../common/enum/enum.dart';

class FilterTradeInModel {
  final DateTime? fromDate;
  final DateTime? toDate;
  final String? searchValue;
  final SearchType searchType;

  const FilterTradeInModel({
    this.fromDate,
    this.toDate,
    this.searchValue,
    this.searchType = SearchType.phoneNumber,
  });

  FilterTradeInModel copyWith({
    DateTime? fromDate,
    DateTime? toDate,
    String? searchValue,
    SearchType? searchType,
  }) {
    return FilterTradeInModel(
      searchValue: searchValue ?? this.searchValue,
      searchType: searchType ?? this.searchType,
      fromDate: fromDate,
      toDate: toDate,
    );
  }

  FilterTradeInModel updateSearchText({
    String? searchValue,
    SearchType? searchType,
  }) {
    return FilterTradeInModel(
      searchValue: searchValue ?? this.searchValue,
      searchType: searchType ?? this.searchType,
      fromDate: fromDate,
      toDate: toDate,
    );
  }

  bool get isFilter => fromDate != null || toDate != null;

  String? get getFromDateValue => fromDate?.formatDateTime();

  String? get getToDateValue => toDate?.formatDateTime();

  int? get getSearchType => searchType.getValue;

  String? get getSearchProduct =>
      searchType == SearchType.imei ? searchValue : null;

  String? get getSearchCustomer =>
      searchType == SearchType.phoneNumber ? searchValue : null;

  String get searchTypeShortTitle => searchType.getShortTitle;

  List<DateTime?> get getDates => [fromDate, toDate];
}
