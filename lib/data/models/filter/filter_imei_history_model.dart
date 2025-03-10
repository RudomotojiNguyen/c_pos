import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../../common/enum/enum.dart';
import '../store_model.dart';

@immutable
class FilterImeiHistoryModel extends Equatable {
  final String? search;
  final ImeiStatus imeiStatus;
  final StoreModel? store;

  const FilterImeiHistoryModel({
    this.search,
    this.store,
    this.imeiStatus = ImeiStatus.all,
  });

  FilterImeiHistoryModel copyWith({
    String? search,
    ImeiStatus? imeiStatus,
    StoreModel? store,
  }) {
    return FilterImeiHistoryModel(
      search: search ?? this.search,
      imeiStatus: imeiStatus ?? this.imeiStatus,
      store: store,
    );
  }

  @override
  List<Object?> get props => [search, imeiStatus, store];

  bool get isFilter {
    return imeiStatus != ImeiStatus.all || store != null;
  }
}
