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

  /// Callback để tạo secondary widget (dialog, menu, etc.)
  /// [closeOverlay] là function để đóng overlay, nên được gọi khi:
  /// - User chọn một action trong secondary widget
  /// - User muốn đóng secondary widget
  /// - Secondary widget bị đóng bằng bất kỳ cách nào khác
  ///
  /// closeOverlay() trả về Future<void> để có thể await
  final Widget Function(Future<void> Function() closeOverlay)?
      secondaryWidgetBuilder;
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
    // Đóng overlay trước khi dispose
    if (_overlayEntry != null) {
      _overlayEntry?.remove();
      _overlayEntry = null;
    }

    _controller.dispose();
    _zoomController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: _overlayEntry == null,
      onPopInvokedWithResult: (didPop, result) {
        if (!didPop && _overlayEntry != null) {
          removeOverlay();
        }
      },
      child: GestureDetector(
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

    // Đánh dấu rằng overlay đang được đóng để tránh gọi nhiều lần
    final overlayEntry = _overlayEntry;
    _overlayEntry = null;

    try {
      await Future.wait([_controller.reverse(), _zoomController.reverse()]);
      overlayEntry?.remove();
    } catch (e) {
      // Xử lý lỗi nếu có
      overlayEntry?.remove();
    }
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
    // Tạo một callback wrapper để đảm bảo closeOverlay được gọi đúng cách
    safeCloseOverlay() async {
      if (_overlayEntry != null && !_controller.isDismissed) {
        await removeOverlay();
      }
    }

    // SỬ DỤNG secondaryWidgetBuilder TỪ XBaseButton với safeCloseOverlay
    Widget secondaryContent =
        widget.secondaryWidgetBuilder?.call(safeCloseOverlay) ??
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
            onTap: () async {
              await safeCloseOverlay();
            },
            // Quan trọng: Cho phép các sự kiện chạm truyền qua đến các widget con
            behavior: HitTestBehavior.translucent,
            child: XGlassContainer(
              key: _secondaryWidgetKey,
              bgColor: Colors.white.withValues(alpha: 0.7),
              child: secondaryContent,
            ),
          ),
        ),
      ),
    );
  }
}
