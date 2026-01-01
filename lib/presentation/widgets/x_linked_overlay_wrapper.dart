import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theme/colors.dart';

typedef LinkedOverlayBuilder = Widget Function(
  BuildContext context,
  bool showAbove,
  double maxOverlayHeight,
);

class XLinkedOverlayWrapper extends StatefulWidget {
  const XLinkedOverlayWrapper({
    super.key,
    required this.child,
    required this.overlayContentBuilder,
    required this.controller,
    this.matchChildWidth = true,
    this.scrimColor = AppColors.transparent,
  });

  final Widget child;
  final LinkedOverlayBuilder overlayContentBuilder;
  final LinkedOverlayController controller;
  final bool matchChildWidth;
  final Color? scrimColor;

  @override
  // ignore: library_private_types_in_public_api
  _XLinkedOverlayWrapperState createState() => _XLinkedOverlayWrapperState();
}

class _XLinkedOverlayWrapperState extends State<XLinkedOverlayWrapper> {
  final LayerLink _layerLink = LayerLink();
  OverlayEntry? _overlayEntry;

  @override
  void initState() {
    super.initState();
    widget.controller._showOverlay = _showOverlay;
    widget.controller._hideOverlay = _hideOverlay;
  }

  @override
  void dispose() {
    widget.controller.hide();
    super.dispose();
  }

  void _showOverlay() {
    if (_overlayEntry != null) return;

    RenderBox renderBox = context.findRenderObject() as RenderBox;
    var size = renderBox.size;
    var textFieldPosition = renderBox.localToGlobal(Offset.zero);

    _overlayEntry = OverlayEntry(
      builder: (context) {
        final mediaQuery = MediaQuery.of(context);
        final screenHeight = mediaQuery.size.height;
        final keyboardHeight = mediaQuery.viewInsets.bottom;
        final statusBarHeight = mediaQuery.padding.top;

        // Tính không gian có sẵn BÊN DƯỚI text field
        final spaceBelow = screenHeight -
            (textFieldPosition.dy + size.height) -
            keyboardHeight;

        // Tính không gian có sẵn BÊN TRÊN text field
        final spaceAbove = textFieldPosition.dy - statusBarHeight;

        // Quyết định xem có nên hiển thị overlay ở trên hay không
        // Điều kiện: Nếu không gian bên dưới quá nhỏ VÀ không gian bên trên lớn hơn, thì hiển thị bên trên.
        final bool showAbove =
            (spaceBelow < 100.sp) && (spaceAbove > spaceBelow);

        // Xác định chiều cao tối đa cho overlay tùy thuộc vào vị trí hiển thị
        final maxOverlayHeight = max(0.0, showAbove ? spaceAbove : spaceBelow) -
            16; // -16 để có padding

        return Stack(
          children: [
            Positioned.fill(
              child: GestureDetector(
                onTap: () => widget.controller.hide(),
                behavior: HitTestBehavior.opaque,
                child: Container(color: widget.scrimColor),
              ),
            ),
            Positioned(
              width: widget.matchChildWidth ? size.width : null,
              child: CompositedTransformFollower(
                link: _layerLink,
                showWhenUnlinked: false,
                followerAnchor:
                    showAbove ? Alignment.bottomRight : Alignment.topRight,
                targetAnchor:
                    showAbove ? Alignment.topRight : Alignment.bottomRight,
                offset: Offset(0.0, showAbove ? -8.0 : 8.0),
                child: ConstrainedBox(
                  constraints: BoxConstraints(maxHeight: maxOverlayHeight),
                  child: widget.overlayContentBuilder(
                    context,
                    showAbove,
                    maxOverlayHeight,
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );

    Overlay.of(context).insert(_overlayEntry!);
  }

  void _hideOverlay() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(link: _layerLink, child: widget.child);
  }
}

class LinkedOverlayController {
  VoidCallback? _showOverlay;
  VoidCallback? _hideOverlay;
  bool _isOpen = false;

  bool get isOpen => _isOpen;

  void show() {
    _showOverlay?.call();
    _isOpen = true;
  }

  void hide() {
    _hideOverlay?.call();
    _isOpen = false;
  }

  void toggle() {
    if (_isOpen) {
      hide();
    } else {
      show();
    }
  }

  void dispose() {
    _showOverlay = null;
    _hideOverlay = null;
  }
}
