import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../common/configs/box.dart';
import 'widgets.dart';

typedef NumberOfRowsCallBack = int Function(int section);
typedef SectionWidgetCallBack = Widget Function(int section);
typedef RowsWidgetCallBack = Widget Function(int section, int row);

class SectionListWidget<S, R> extends StatefulWidget {
  const SectionListWidget({
    super.key,
    required this.numberOfSection,
    required this.numberOfRowsInSection,
    this.sectionWidget,
    required this.rowWidget,
    this.sectionRowNotifier,
    this.sectionSeparatorBuilder,
    this.rowSeparatorBuilder,
    this.padding,
    required this.refreshController,
    this.onRefresh,
    this.onLoading,
    this.enablePullDown = false,
    this.enablePullUp = false,
  });

  /// Tổng số lượng sections
  final int numberOfSection;

  /// Callback lấy dữ liệu số lượng row trong từng section
  final NumberOfRowsCallBack numberOfRowsInSection;

  /// Callback để render widget của section
  final SectionWidgetCallBack? sectionWidget;

  /// Callback để render widget của row
  final RowsWidgetCallBack rowWidget;

  /// Notifier theo dõi thay đổi dữ liệu bên trong section
  final ValueNotifier<void>? sectionRowNotifier;

  final Widget Function(BuildContext, int)? sectionSeparatorBuilder;

  final Widget Function(BuildContext, int)? rowSeparatorBuilder;

  final EdgeInsetsGeometry? padding;

  final RefreshController refreshController;

  final VoidCallback? onRefresh;

  final VoidCallback? onLoading;

  final bool enablePullDown;

  final bool enablePullUp;

  @override
  State<SectionListWidget<S, R>> createState() =>
      _SectionListWidgetState<S, R>();
}

class _SectionListWidgetState<S, R> extends State<SectionListWidget<S, R>> {
  @override
  void initState() {
    super.initState();

    /// Lắng nghe thay đổi dữ liệu của section cuối cùng
    widget.sectionRowNotifier?.addListener(() {
      debugPrint('value change => ');
      setState(() {
        // Rebuild the widget when the data changes
      });
    });
  }

  @override
  void dispose() {
    widget.sectionRowNotifier?.removeListener(_onSectionRowChanged);
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant SectionListWidget<S, R> oldWidget) {
    super.didUpdateWidget(oldWidget);

    /// Khi widget khác đi, đăng ký lại listener nếu cần
    if (oldWidget.sectionRowNotifier != widget.sectionRowNotifier) {
      oldWidget.sectionRowNotifier?.removeListener(_onSectionRowChanged);
      widget.sectionRowNotifier?.addListener(_onSectionRowChanged);
    }
  }

  void _onSectionRowChanged() {
    setState(() {
      // Rebuild when the section data changes
    });
  }

  @override
  Widget build(BuildContext context) {
    return SmartRefresher(
      controller: widget.refreshController,
      enablePullDown: widget.enablePullDown,
      enablePullUp: widget.enablePullUp,
      header: const RefreshWidget(),
      footer: const BottomLoadWidget(),
      onRefresh: widget.onRefresh,
      onLoading: widget.onLoading,
      child: ListView.separated(
        padding: widget.padding ?? EdgeInsets.zero,
        itemCount: widget.numberOfSection,
        separatorBuilder:
            widget.sectionSeparatorBuilder ?? (ctx, index) => BoxSpacer.blank,
        itemBuilder: (context, sectionIndex) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (sectionIndex != 0) ...[
                BoxSpacer.s16,
              ],
              // Section header
              widget.sectionWidget != null
                  ? widget.sectionWidget!(sectionIndex)
                  : BoxSpacer.blank,
              BoxSpacer.s8,
              // Nested ListView for rows in each section
              ListView.separated(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                separatorBuilder: widget.rowSeparatorBuilder ??
                    (ctx, index) => BoxSpacer.blank,
                itemCount: widget.numberOfRowsInSection(sectionIndex),
                itemBuilder: (context, rowIndex) {
                  return widget.rowWidget(sectionIndex, rowIndex);
                },
              ),
            ],
          );
        },
      ),
    );
  }
}

class IndexPath {
  const IndexPath({required this.section, required this.row});

  final int section;
  final int row; // -1 khi là header của section
}
