class PaginatedResponse<T> {
  final int totalItems;
  final List<T> items;
  final int totalPages;
  final int currentPage;

  PaginatedResponse({
    required this.totalItems,
    required this.items,
    required this.totalPages,
    required this.currentPage,
  });

  factory PaginatedResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Map<String, dynamic>) fromJsonT,
  ) {
    return PaginatedResponse<T>(
      totalItems: json['totalItems'] ?? 0,
      items: (json['items'] as List<dynamic>)
          .map((item) => fromJsonT(item as Map<String, dynamic>))
          .toList(),
      totalPages: json['totalPages'] ?? 1,
      currentPage: json['currentPage'] ?? 1,
    );
  }
}
