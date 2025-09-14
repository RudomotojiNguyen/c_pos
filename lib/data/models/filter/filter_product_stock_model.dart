import 'package:c_pos/common/di/injection/injection.dart';
import 'package:c_pos/presentation/journey/screen/login/bloc/auth_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../common/enum/enum.dart';
import '../category_model.dart';

class FilterProductStockModel extends Equatable {
  final CategoryModel? cateSelected;
  final SearchType? searchType;
  final bool isInStock;
  final String searchValue;
  final int? storeId;

  const FilterProductStockModel({
    this.cateSelected,
    this.searchType,
    this.isInStock = true,
    this.searchValue = '',
    this.storeId,
  });

  FilterProductStockModel copyWith({
    CategoryModel? cateSelected,
    SearchType? searchType,
    bool? isInStock,
    String? searchValue,
    int? storeId,
  }) {
    return FilterProductStockModel(
      cateSelected: cateSelected,
      searchType: searchType,
      isInStock: isInStock ?? this.isInStock,
      searchValue: searchValue ?? this.searchValue,
      storeId: storeId ?? this.storeId,
    );
  }

  int? get getStoreId {
    if (storeId != null) {
      return storeId!;
    }
    final user = getIt.get<AuthBloc>().state.userInfo;
    return user?.getStoreId;
  }

  @override
  List<Object?> get props =>
      [cateSelected, searchType, isInStock, searchValue, storeId];

  int? get getProductTypeValue => searchType?.getValueFilterInventory;

  bool get isFilter {
    return storeId != null ||
        isInStock ||
        searchValue.isNotEmpty ||
        cateSelected != null ||
        searchType != null;
  }
}
