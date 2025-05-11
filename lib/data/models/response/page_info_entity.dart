class PageInfoEntity {
  int? limit;
  int? page;
  int? itemCount;
  int? pageCount;
  bool? hasPreviousPage;
  bool? hasNextPage;

  /// state extension
  bool? canLoadMore;

  PageInfoEntity({
    this.limit,
    this.page,
    this.itemCount, // total item
    this.pageCount, // total page
    this.hasPreviousPage,
    this.hasNextPage,
  });

  PageInfoEntity copyWith({
    int? limit,
    int? page,
    int? total,
    int? itemCount,
    int? pageCount,
    bool? hasPreviousPage,
    bool? hasNextPage,
  }) {
    return PageInfoEntity(
      limit: limit ?? this.limit,
      page: page ?? this.page,
      itemCount: itemCount ?? this.itemCount,
      pageCount: pageCount ?? this.pageCount,
      hasPreviousPage: hasPreviousPage ?? this.hasPreviousPage,
      hasNextPage: hasNextPage ?? this.hasNextPage,
    );
  }

  int get getPage => page ?? 1;

  int get getLimit => limit ?? 10;

  bool get checkCanLoadMore => hasNextPage ?? false;

  int get getNextPage => getPage + 1;
}
