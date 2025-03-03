import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
class BaseLoadingInfoModel extends Equatable {
  final int currentPage;
  final int limit;
  final bool canLoadMore;

  const BaseLoadingInfoModel({
    this.currentPage = 1,
    this.limit = 10,
    this.canLoadMore = true,
  });

  BaseLoadingInfoModel copyWith({
    int? currentPage,
    int? limit,
    bool? canLoadMore,
    int? sizeDate,
  }) {
    int size = limit ?? this.limit;
    return BaseLoadingInfoModel(
      currentPage: currentPage ?? this.currentPage,
      limit: size,
      canLoadMore: sizeDate != null
          ? (sizeDate >= size)
          : (canLoadMore ?? this.canLoadMore),
    );
  }

  int get getNextPage => currentPage + 1;

  @override
  List<Object?> get props => [currentPage, limit, canLoadMore];
}
