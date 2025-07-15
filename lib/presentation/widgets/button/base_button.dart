import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../theme/themes.dart';
import '../widgets.dart';

enum BaseButtonType { basic, longPressOperation, tapOperation }

enum ArrowDirection { down, up }

class XBaseButton extends StatefulWidget {
  final GestureTapCallback? onPressed;
  final GestureTapCallback? onLongPress;
  final Widget Function(VoidCallback closeOverlay)? secondaryWidgetBuilder;
  final EdgeInsetsGeometry? padding;
  final double? width;
  final bool disable;
  final Widget? child;
  final BaseButtonType baseButtonType;
  final Decoration? decoration;
  final Decoration? decorationChildIsOverlay;
  final EdgeInsetsGeometry? paddingChildIsOverlay;
  final EdgeInsetsGeometry? margin;
  final BoxConstraints? constraints;

  const XBaseButton({
    super.key,
    this.onPressed,
    this.onLongPress,
    this.child,
    this.padding,
    this.width,
    this.disable = false,
    this.secondaryWidgetBuilder,
    this.baseButtonType = BaseButtonType.basic,
    this.decoration,
    this.decorationChildIsOverlay,
    this.paddingChildIsOverlay,
    this.margin,
    this.constraints,
  });

  @override
  State<XBaseButton> createState() => XBaseButtonState();
}

class XBaseButtonState extends State<XBaseButton>
    with TickerProviderStateMixin {
  OverlayEntry? _overlayEntry;
  late AnimationController _controller;
  late AnimationController _zoomController;
  late Animation<double> _scaleAnimation;
  late Animation<double> _zoomAnimation;

  final Duration duration = const Duration(milliseconds: 300);

  final StreamController<bool> _animationCompletedController =
      StreamController<bool>.broadcast();

  Stream<bool> get animationCompletedStream =>
      _animationCompletedController.stream;

  final GlobalKey _childKey = GlobalKey();
  final GlobalKey _secondaryWidgetKey = GlobalKey();

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(duration: duration, vsync: this);
    _scaleAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    _zoomController = AnimationController(duration: duration, vsync: this);
    _zoomAnimation = Tween<double>(begin: 1.0, end: 1.009).animate(
      CurvedAnimation(parent: _zoomController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    _zoomController.dispose();
    Future.delayed(duration, () {
      _animationCompletedController.close();
    });
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.disable ? null : () => onPress(context),
      onLongPress: widget.disable ? null : () => longPress(context),
      child: Container(
        key: _childKey,
        width: widget.width,
        padding: widget.padding ?? EdgeInsets.zero,
        margin: widget.margin,
        constraints: widget.constraints,
        decoration: widget.decoration ??
            BoxDecoration(borderRadius: BorderRadius.all(AppRadius.xxm)),
        child: widget.child,
      ),
    );
  }

  onPress(BuildContext context) {
    if (widget.baseButtonType == BaseButtonType.tapOperation) {
      _showOverlay(context);
    }
    if (widget.onPressed != null) {
      widget.onPressed!();
    }
  }

  longPress(BuildContext context) {
    if (widget.baseButtonType == BaseButtonType.longPressOperation) {
      _showOverlay(context);
    }
    if (widget.onLongPress != null) {
      widget.onLongPress!();
    }
  }

  // Hàm này vẫn giữ nguyên, là nơi duy nhất để xóa overlay
  Future<void> removeOverlay() async {
    if (_overlayEntry == null || _controller.isDismissed) return;

    await Future.wait([_controller.reverse(), _zoomController.reverse()]);

    _overlayEntry?.remove();
    _overlayEntry = null;

    Future.delayed(duration, () {
      _animationCompletedController.add(true);
    });
  }

  void _showOverlay(BuildContext context) {
    if (_overlayEntry != null) {
      // Ngăn chặn hiển thị overlay nhiều lần
      return;
    }

    final RenderBox renderBox = context.findRenderObject() as RenderBox;
    final offset = renderBox.localToGlobal(Offset.zero);
    final screenSize = MediaQuery.of(context).size;
    Rect? childPaintBounds =
        _childKey.currentContext?.findRenderObject()?.paintBounds;

    double childWidth = (childPaintBounds?.width ?? 0);
    double childHeight = (childPaintBounds?.height ?? 0);

    double left = offset.dx;
    double right = offset.dx + childWidth;
    addOverlay(
      left: left,
      top: offset.dy,
      right: right,
      childHeight: childHeight,
      childWidth: childWidth,
      opacity: 0,
    );

    WidgetsBinding.instance.addPostFrameCallback((_) {
      double overlayTop = offset.dy;
      right = offset.dx + childWidth;
      double secondaryHeight = (_secondaryWidgetKey.currentContext
              ?.findRenderObject()
              ?.paintBounds
              .height ??
          0);

      double spaceBelow = screenSize.height -
          (offset.dy + childHeight); // Khoảng cách từ widget tới đáy màn hình
      double spaceAbove = offset.dy; // Khoảng cách từ widget tới đỉnh màn hình

      bool showSecondaryAbove =
          spaceBelow < secondaryHeight && spaceAbove > secondaryHeight;

      addOverlay(
        left: left,
        top: overlayTop,
        right: right,
        childHeight:
            childHeight + (widget.paddingChildIsOverlay?.vertical ?? 0),
        childWidth:
            childWidth + (widget.paddingChildIsOverlay?.horizontal ?? 0),
        opacity: 1,
        secondaryHeight: secondaryHeight,
        showSecondaryAbove: showSecondaryAbove,
      );

      _controller.forward();
      _zoomController.forward();
    });
  }

  void addOverlay({
    required double left,
    required double right,
    required double top,
    required double childWidth,
    required double childHeight,
    double opacity = 0,
    double secondaryHeight = 0,
    bool showSecondaryAbove = false,
  }) {
    double maxOffset = MediaQuery.of(context).size.width;

    double? newLeft;
    double? newRight;

    if (right > maxOffset) {
      newRight = null;
      newLeft = left + childWidth > maxOffset ? 200.sp : childWidth;
    } else {
      newRight = maxOffset - right;
      newLeft = null;
    }

    _overlayEntry?.remove();
    _overlayEntry = OverlayEntry(
      builder: (context) => Stack(
        clipBehavior: Clip.none,
        children: [
          // Lớp nền mờ, bắt mọi chạm bên ngoài child và secondaryWidget
          Positioned.fill(
            child: GestureDetector(
              onTap: () {
                removeOverlay();
              },
              child: Container(
                color: Colors.white.withValues(alpha: 0.8),
              ),
            ),
          ),
          Positioned(
            left: left,
            top: top,
            child: Opacity(
              opacity: opacity,
              child: Material(
                color: Colors.transparent,
                child: GestureDetector(
                  onTap: () {
                    // Nếu chạm lại vào nút chính, đóng overlay và kích hoạt lại onPressed của nút chính
                    removeOverlay();
                    if (widget.onPressed != null) {
                      widget.onPressed!();
                    }
                  },
                  child: ScaleTransition(
                    scale: _zoomAnimation,
                    child: Container(
                      decoration: widget.decorationChildIsOverlay,
                      padding: widget.paddingChildIsOverlay,
                      width: childWidth,
                      child: widget.child,
                    ),
                  ),
                ),
              ),
            ),
          ),
          if (showSecondaryAbove) ...[
            Positioned(
              top: top - (secondaryHeight + 12.sp),
              left: newLeft,
              right: newRight,
              child: _secondWidget(opacity, direction: ArrowDirection.down),
            ),
          ],
          if (!showSecondaryAbove) ...[
            Positioned(
              top: childHeight + 12.sp + top,
              left: newLeft,
              right: newRight,
              child: _secondWidget(opacity),
            ),
          ],
        ],
      ),
    );
    Overlay.of(context).insert(_overlayEntry!);
  }

  Widget _secondWidget(
    double opacity, {
    ArrowDirection direction = ArrowDirection.up,
  }) {
    // SỬ DỤNG secondaryWidgetBuilder TỪ XBaseButton
    Widget secondaryContent =
        widget.secondaryWidgetBuilder?.call(removeOverlay) ??
            const SizedBox.shrink();

    return Opacity(
      opacity: opacity,
      child: Material(
        color: Colors.transparent,
        child: ScaleTransition(
          scale: _scaleAnimation,
          child: GestureDetector(
            // GestureDetector này để đóng overlay khi chạm vào khoảng trống
            // trong secondaryWidget (ví dụ: nền của XGlassContainer)
            onTap: () {
              if (_overlayEntry != null) {
                removeOverlay();
              }
            },
            // Quan trọng: Cho phép các sự kiện chạm truyền qua đến các widget con
            behavior: HitTestBehavior.translucent,
            child: XGlassContainer(
              key: _secondaryWidgetKey,
              bgColor: Colors.white.withValues(alpha: 0.7),
              child:
                  secondaryContent, // SỬ DỤNG secondaryContent ĐÃ ĐƯỢC XÂY DỰNG
            ),
          ),
        ),
      ),
    );
  }
}

// Giữ nguyên MessageBubblePainter
class MessageBubblePainter extends CustomPainter {
  final Color color;
  final ArrowDirection direction;

  MessageBubblePainter(this.color, {this.direction = ArrowDirection.down});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    final path = Path();

    final radius = 12.sp;
    final minMax = 8.sp;
    final widthArrow = 5.sp;

    path.moveTo(radius, 0);
    path.lineTo(size.width - radius, 0);
    path.quadraticBezierTo(size.width, 0, size.width, radius);
    path.lineTo(size.width, size.height - radius);
    path.quadraticBezierTo(
      size.width,
      size.height,
      size.width - radius,
      size.height,
    );
    path.lineTo(radius, size.height);
    path.quadraticBezierTo(0, size.height, 0, size.height - radius);
    path.lineTo(0, radius);
    path.quadraticBezierTo(0, 0, radius, 0);

    double pointMove = size.width * 3 / 4;
    if (direction == ArrowDirection.down) {
      path.moveTo(pointMove - widthArrow, size.height);
      path.lineTo(pointMove, size.height + minMax);
      path.lineTo(pointMove + widthArrow, size.height);
    } else {
      path.moveTo(pointMove - widthArrow, 0);
      path.lineTo(pointMove, -minMax);
      path.lineTo(pointMove + widthArrow, 0);
    }
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
