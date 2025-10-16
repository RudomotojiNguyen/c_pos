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
  /// Nếu null, button sẽ hoạt động như button thông thường không có overlay
  ///
  /// [closeOverlay] là function để đóng overlay, nên được gọi khi:
  /// - User chọn một action trong secondary widget
  /// - User muốn đóng secondary widget
  /// - Secondary widget bị đóng bằng bất kỳ cách nào khác
  ///
  /// closeOverlay() trả về Future để có thể await
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

    // Lắng nghe sự kiện back button để đóng overlay
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        final route = ModalRoute.of(context);
        if (route != null) {
          // ignore: deprecated_member_use
          route.addScopedWillPopCallback(() async {
            if (_overlayEntry != null) {
              await removeOverlay();
              return false; // Ngăn không cho pop route
            }
            return true;
          });
        }
      }
    });
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
    if (widget.baseButtonType == BaseButtonType.tapOperation &&
        widget.secondaryWidgetBuilder != null) {
      _showOverlay(context);
    }
    if (widget.onPressed != null) {
      widget.onPressed!();
    }
  }

  longPress(BuildContext context) {
    if (widget.baseButtonType == BaseButtonType.longPressOperation &&
        widget.secondaryWidgetBuilder != null) {
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

    try {
      await Future.wait([_controller.reverse(), _zoomController.reverse()]);
      overlayEntry?.remove();
    } catch (e) {
      // Xử lý lỗi nếu có
      overlayEntry?.remove();
    } finally {
      _overlayEntry = null;
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
      double adjustedLeft = left < 16.sp ? 16.sp : left;
      double adjustedRight = adjustedLeft + childWidth;
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
        left: adjustedLeft,
        top: overlayTop,
        right: adjustedRight,
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

    // Kiểm tra và điều chỉnh vị trí left để đảm bảo overlay không bị cắt
    double adjustedLeft = left;

    // Nếu left bị âm hoặc quá gần lề trái (có thể bị cắt), đặt về vị trí an toàn
    if (left < 16.sp) {
      adjustedLeft = 16.sp; // Đặt một khoảng cách an toàn từ lề trái
    }

    // Kiểm tra và điều chỉnh vị trí right
    double adjustedRight = adjustedLeft + childWidth;
    if (adjustedRight > maxOffset - 16.sp) {
      newRight = 16.sp; // Đặt một khoảng cách an toàn từ lề phải
      newLeft = null;
    } else {
      // Nếu button nằm ở giữa màn hình, đặt secondary widget ở giữa
      double centerPosition = adjustedLeft + (childWidth / 2);
      if (centerPosition < maxOffset / 2) {
        newLeft = adjustedLeft;
        newRight = null;
      } else {
        newRight = maxOffset - adjustedRight;
        newLeft = null;
      }
    }

    // Đảm bảo adjustedLeft không bị âm và có khoảng cách an toàn
    adjustedLeft = adjustedLeft < 16.sp ? 16.sp : adjustedLeft;

    // Đảm bảo secondary widget không bị cắt ở lề phải
    if (newLeft != null && newLeft + 200.sp > maxOffset - 16.sp) {
      newLeft = maxOffset - 200.sp - 16.sp;
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
                color: AppColors.neutralColor.withValues(alpha: 0.1),
              ),
            ),
          ),
          Positioned(
            left: adjustedLeft,
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
            // trong secondaryWidget (ví dụ: nền của XGlassMorphinContainer)
            onTap: () async {
              await safeCloseOverlay();
            },
            // Quan trọng: Cho phép các sự kiện chạm truyền qua đến các widget con
            behavior: HitTestBehavior.translucent,
            child: XGlassContainer(
              key: _secondaryWidgetKey,
              bgColor: Colors.white.withValues(alpha: 0.9),
              child: secondaryContent,
            ),
          ),
        ),
      ),
    );
  }
}
