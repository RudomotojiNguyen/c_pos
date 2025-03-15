import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

enum XGridViewType {
  normal,
  staggered,
  masonry,
  aligned,
}

class XGridView extends StatefulWidget {
  const XGridView({
    super.key,
    this.type = XGridViewType.normal,
    this.itemCount = 0,
    this.crossAxisSpacing,
    this.mainAxisSpacing,
    this.crossAxisCount,
    this.itemBuilder,
    this.padding,
    this.physics,
    this.shrinkWrap = false,
  });

  final XGridViewType type;
  final int itemCount;
  final double? crossAxisSpacing;
  final double? mainAxisSpacing;
  final int? crossAxisCount;
  final Widget Function(BuildContext, int)? itemBuilder;
  final EdgeInsetsGeometry? padding;
  final ScrollPhysics? physics;
  final bool shrinkWrap;

  @override
  State<XGridView> createState() => _XGridViewState();
}

class _XGridViewState extends State<XGridView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    switch (widget.type) {
      case XGridViewType.aligned:
        return _buildNormalGridView();
      case XGridViewType.staggered:
        return Container();
      case XGridViewType.masonry:
        return Container();
      case XGridViewType.normal:
        return _buildNormalGridView();
      default:
        return Container();
    }
  }

  Widget _buildNormalGridView() {
    return AlignedGridView.count(
      crossAxisCount: widget.crossAxisCount ?? 0,
      mainAxisSpacing: widget.mainAxisSpacing ?? 0,
      crossAxisSpacing: widget.crossAxisSpacing ?? 0,
      itemCount: widget.itemCount,
      padding: widget.padding,
      physics: widget.physics,
      shrinkWrap: widget.shrinkWrap,
      itemBuilder: (context, index) {
        return widget.itemBuilder?.call(context, index) ??
            const SizedBox.shrink();
      },
    );
  }
}
