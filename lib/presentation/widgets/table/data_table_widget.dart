import 'package:flutter/material.dart';

import '../../theme/themes.dart';

class DataTableWidget<T> extends StatefulWidget {
  const DataTableWidget({
    super.key,
    required this.data,
    required this.columnTitles,
    required this.rowBuilder,
    required this.columnBuilder,
  });

  // Dữ liệu cho table dạng List<List<T>> với kiểu dữ liệu T cho mỗi ô
  final List<List<T>> data;

  // Tiêu đề cột
  final List<String> columnTitles;

  // Builder để tạo các cell cho hàng
  final Widget Function(BuildContext ctx, T rowData) rowBuilder;

  // Builder để tạo các cột
  final Widget Function(BuildContext ctx, String columnTitle) columnBuilder;

  @override
  State<DataTableWidget> createState() => _DataTableWidgetState<T>();
}

class _DataTableWidgetState<T> extends State<DataTableWidget<T>> {
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: _scrollController, // Gắn ScrollController
      scrollDirection: Axis.horizontal, // Cho phép cuộn ngang
      child: DataTable(
        headingRowColor: WidgetStateProperty.all(AppColors.disabledColor),
        // Màu sắc của header
        border: TableBorder(
          top: BorderSide(color: Colors.grey.shade300),
          bottom: BorderSide(color: Colors.grey.shade300),
          horizontalInside: BorderSide(color: Colors.grey.shade300),
          verticalInside: BorderSide.none, // Loại bỏ thanh dọc
        ),
        columns: [
          for (var title in widget.columnTitles)
            DataColumn(
              label: widget.columnBuilder(context, title),
            ),
        ],
        rows: widget.data.map(
          (row) {
            return DataRow(
              cells: row
                  .map(
                    (cell) => DataCell(widget.rowBuilder(context, cell)),
                  )
                  .toList(),
            );
          },
        ).toList(),
      ),
    );
  }
}
