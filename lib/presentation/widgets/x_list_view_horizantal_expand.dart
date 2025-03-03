import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class XListViewHorizantalExpand<T> extends StatefulWidget {
  const XListViewHorizantalExpand({
    super.key,
    required this.items,
    this.animationCurve = Curves.easeInOutCubic,
    this.animationDuration = const Duration(milliseconds: 100),
    required this.itemBuilder,
    this.initialHeight = 100,
    this.spacing = 10,
  });

  final List<T> items;
  final Widget Function(BuildContext, int) itemBuilder;
  final Curve animationCurve;
  final Duration animationDuration;
  final double initialHeight;
  final double spacing;

  @override
  State<XListViewHorizantalExpand<T>> createState() =>
      _XListViewHorizantalExpandState<T>();
}

class _XListViewHorizantalExpandState<T>
    extends State<XListViewHorizantalExpand<T>> {
  double _maxItemHeight = 100;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      duration: widget.animationDuration,
      curve: widget.animationCurve,
      tween: Tween<double>(begin: widget.initialHeight, end: _maxItemHeight),
      builder: (context, height, child) {
        return SizedBox(
          height: height,
          child: _buildPageView(),
        );
      },
    );
  }

  Widget _buildPageView() {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemCount: widget.items.length,
      separatorBuilder: (context, index) => SizedBox(width: widget.spacing.sp),
      itemBuilder: (context, index) {
        return LayoutBuilder(
          builder: (context, constraints) {
            return MeasureSize(
              onChange: (size) => _updateMaxHeight(size.height),
              child: widget.itemBuilder(context, index),
            );
          },
        );
      },
    );
  }

  void _updateMaxHeight(double newHeight) {
    if (newHeight > _maxItemHeight) {
      setState(() {
        _maxItemHeight = newHeight;
      });
    }
  }
}

class MeasureSize extends StatefulWidget {
  final Widget child;
  final ValueChanged<Size> onChange;

  const MeasureSize({super.key, required this.child, required this.onChange});

  @override
  _MeasureSizeState createState() => _MeasureSizeState();
}

class _MeasureSizeState extends State<MeasureSize> {
  Size? oldSize;

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final size = context.size;
      if (size != null && oldSize != size) {
        oldSize = size;
        widget.onChange(size);
      }
    });
    return widget.child;
  }
}
