class PageInfoEntity {
  int? limit;
  int? page;
  int? total;
  int? itemCount;
  int? pageCount;
  bool? hasPreviousPage;
  bool? hasNextPage;

  /// state extension
  bool? canLoadMore;

  PageInfoEntity({
    this.limit,
    this.page,
    this.total,
    this.itemCount,
    this.pageCount,
    this.hasPreviousPage,
    this.hasNextPage,
    this.canLoadMore,
  });

  PageInfoEntity copyWith({
    int? limit,
    int? page,
    int? total,
    int? itemCount,
    int? pageCount,
    bool? hasPreviousPage,
    bool? hasNextPage,
    bool? canLoadMore,
  }) {
    return PageInfoEntity(
      limit: limit ?? this.limit,
      page: page ?? this.page,
      total: total ?? this.total,
      itemCount: itemCount ?? this.itemCount,
      pageCount: pageCount ?? this.pageCount,
      hasPreviousPage: hasPreviousPage ?? this.hasPreviousPage,
      hasNextPage: hasNextPage ?? this.hasNextPage,
      canLoadMore: canLoadMore ?? this.canLoadMore,
    );
  }

  bool get checkHasNextPage => hasNextPage ?? false;

  int get getPage => page ?? 1;

  int get getLimit => limit ?? 10;

  bool get checkCanLoadMore => canLoadMore ?? false;
}
