import 'package:c_pos/common/extensions/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/configs/box.dart';
import '../../theme/themes.dart';
import '../widgets.dart';

enum ContainerType { normal, expand }

class XContainer extends StatefulWidget {
  const XContainer({
    super.key,
    required this.child,
    this.iconTitle,
    this.rightIcon,
    this.title,
    this.titleStyle,
    this.padding,
    this.borderRadius,
    this.bgColor,
    this.margin,
    this.containerType = ContainerType.normal,
    this.initiallyExpanded,
  });

  final Widget child;
  final Widget? iconTitle;
  final Widget? rightIcon;
  final String? title;
  final TextStyle? titleStyle;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final double? borderRadius;
  final Color? bgColor;
  final ContainerType containerType;
  final bool? initiallyExpanded; // khởi tạo có mặc định mở hay ko

  @override
  State<XContainer> createState() => _XContainerState();
}

class _XContainerState extends State<XContainer>
    with SingleTickerProviderStateMixin {
  late ValueNotifier<bool> _isExpanded;
  late AnimationController _controller;
  // late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _isExpanded = ValueNotifier(widget.initiallyExpanded ?? true);
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300));
    // _animation = Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
    //   parent: _controller,
    //   curve: Curves.easeInOut,
    // ));
  }

  @override
  void dispose() {
    _isExpanded.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: widget.margin,
      padding: widget.padding ??
          EdgeInsets.symmetric(horizontal: 16.sp, vertical: 16.sp),
      decoration: BoxDecoration(
        borderRadius: widget.borderRadius == null
            ? BorderRadius.all(AppRadius.l)
            : BorderRadius.all(Radius.circular(widget.borderRadius!)),
        color: widget.bgColor ?? AppColors.white,
      ),
      child: Column(
        children: [
          XBaseButton(
            onPressed: _toggle,
            child: Row(
              children: [
                if (widget.iconTitle != null) ...[
                  widget.iconTitle!,
                ],
                if (widget.iconTitle != null &&
                    widget.title.isNotNullOrEmpty) ...[BoxSpacer.s8],
                if (widget.title.isNotNullOrEmpty) ...[
                  Expanded(
                    child: Text(
                      widget.title ?? '',
                      style: widget.titleStyle ?? AppFont.t.s(16).w600,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
                if (widget.rightIcon != null) ...[widget.rightIcon!],
                if (widget.containerType == ContainerType.expand) ...[
                  RotationTransition(
                    turns:
                        Tween<double>(begin: 0, end: 0.5).animate(_controller),
                    child: Icon(
                      Icons.arrow_drop_up_rounded,
                      color: AppColors.iconColor,
                      size: 24.sp,
                    ),
                  ),
                ],
              ],
            ),
          ),
          if (widget.iconTitle != null && widget.title.isNotNullOrEmpty) ...[
            BoxSpacer.s8
          ],
          ValueListenableBuilder(
              valueListenable: _isExpanded,
              builder: (context, value, _) {
                return AnimatedCrossFade(
                  firstChild: BoxSpacer.blank, // Không hiển thị gì khi không mở
                  secondChild: widget.child,
                  crossFadeState: value
                      ? CrossFadeState.showSecond
                      : CrossFadeState.showFirst,
                  duration:
                      const Duration(milliseconds: 300), // Thời gian hiệu ứng
                );
              }),
        ],
      ),
    );
  }

  void _toggle() {
    if (widget.containerType == ContainerType.expand) {
      if (_isExpanded.value) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
      _isExpanded.value = !_isExpanded.value;
    }
  }
}
