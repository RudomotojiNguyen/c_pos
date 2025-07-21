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
    T Function(Map<String, dynamic>) fromJsonT, {
    String itemsKey = 'items',
  }) {
    return PaginatedResponse<T>(
      totalItems: json['totalItems'] ?? json['total_row'] ?? 0,
      items: (json[itemsKey] as List<dynamic>)
          .map((item) => fromJsonT(item as Map<String, dynamic>))
          .toList(),
      totalPages:
          json['totalPages'] ?? json['total_page'] ?? json['pages'] ?? 1,
      currentPage: json['currentPage'] ?? json['in_page'] ?? 1,
    );
  }
}
