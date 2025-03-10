import 'package:equatable/equatable.dart';

import '../../../common/enum/enum.dart';
import '../category_model.dart';

class FilterProductStockModel extends Equatable {
  final CategoryModel? cateSelected;
  final SearchType? searchType;
  final bool isInStock;
  final String searchValue;

  const FilterProductStockModel({
    this.cateSelected,
    this.searchType,
    this.isInStock = false,
    this.searchValue = '',
  });

  FilterProductStockModel copyWith({
    CategoryModel? cateSelected,
    SearchType? searchType,
    bool? isInStock,
    String? searchValue,
  }) {
    return FilterProductStockModel(
      cateSelected: cateSelected,
      searchType: searchType,
      isInStock: isInStock ?? this.isInStock,
      searchValue: searchValue ?? this.searchValue,
    );
  }

  @override
  List<Object?> get props => [cateSelected, searchType, isInStock, searchValue];

  int? get getProductTypeValue => searchType?.getValueFilterInventory;

  bool get isFilter {
    return false;
  }
}
