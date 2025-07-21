import 'package:c_pos/common/extensions/extension.dart';

import '../../../common/enum/enum.dart';
import '../employee_model.dart';
import '../store_model.dart';

class OrderFilterModel {
  final String searchValue;
  final SearchType searchType;
  //
  final StatusEnum status;
  final StoreModel? store;
  final EmployeeModel? employee;
  final DateTime? fromDay;
  final DateTime? toDay;

  const OrderFilterModel({
    this.searchType = SearchType.orderPhoneNumber,
    this.searchValue = '',
    this.status = StatusEnum.all,
    this.store,
    this.employee,
    this.fromDay,
    this.toDay,
  });

  OrderFilterModel copyWidth({
    String? searchValue,
    SearchType? searchType,
    StatusEnum? status,
    StoreModel? store,
    EmployeeModel? employee,
    DateTime? fromDay,
    DateTime? toDay,
  }) {
    return OrderFilterModel(
      searchType: searchType ?? this.searchType,
      searchValue: searchValue ?? this.searchValue,
      status: status ?? this.status,
      store: store,
      employee: employee,
      fromDay: fromDay,
      toDay: toDay,
    );
  }

  OrderFilterModel updateSearchValue({String? searchValue}) {
    return OrderFilterModel(
      searchType: searchType,
      searchValue: searchValue ?? this.searchValue,
      status: status,
      store: store,
      employee: employee,
      fromDay: fromDay,
      toDay: toDay,
    );
  }

  OrderFilterModel updateSearchType({required searchType}) {
    return OrderFilterModel(
      searchType: searchType,
      searchValue: searchValue,
      status: status,
      store: store,
      employee: employee,
      fromDay: fromDay,
      toDay: toDay,
    );
  }

  int? get getStatusValue => status.getValue;

  int? get getSearchTypeValue => searchType.getValue;

  List<StoreModel>? get getStores => store == null ? [] : [store!];

  String get searchTypeShortTitle => searchType.getShortTitle;

  String? get getSearchValueByPhone {
    if (searchType == SearchType.orderPhoneNumber) {
      return searchValue;
    }
    return null;
  }

  String? get getSearchValueByOrderId {
    if (searchType == SearchType.orderId) {
      return searchValue;
    }
    return null;
  }

  String? get getSearchFromDay {
    if (fromDay != null) {
      return fromDay!.formatDateTime(format: XDateTimeEnum.yearMonthDay);
    }
    return null;
  }

  String? get getSearchToDay {
    if (toDay != null) {
      return toDay!.formatDateTime(format: XDateTimeEnum.yearMonthDay);
    }
    return null;
  }

  int? get getCreatedBy {
    if (employee != null) {
      return employee!.id;
    }
    return null;
  }

  List<int>? get getStatuses {
    if (status != StatusEnum.all) {
      return [status.getValue!];
    }
    return null;
  }

  bool get isFilter {
    return status != StatusEnum.all ||
        fromDay != null ||
        toDay != null ||
        store != null ||
        employee != null;
  }
}
