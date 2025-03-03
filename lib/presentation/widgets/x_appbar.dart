import 'package:flutter/material.dart';

import '../../common/extensions/extension.dart';

class XAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final List<Widget>? actions;
  final Color? backgroundColor;
  final Color? iconColor;
  final Color? titleColor;
  final bool showClose;
  final bool centerTitle;
  final Widget? titleWidget;
  final Function? leftOnPress;

  const XAppBar({
    super.key,
    this.title,
    this.actions,
    this.backgroundColor,
    this.iconColor,
    this.titleColor,
    this.showClose = false,
    this.centerTitle = true,
    this.titleWidget,
    this.leftOnPress,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: centerTitle,
      backgroundColor: backgroundColor,
      leading: (ModalRoute.of(context)?.canPop ?? false)
          ? IconButton(
              onPressed: () {
                if (leftOnPress != null) {
                  leftOnPress!();
                } else {
                  Navigator.of(context).pop();
                }
              },
              icon: Icon(
                showClose ? Icons.close_outlined : Icons.arrow_back_outlined,
                color: iconColor,
              ),
              tooltip: MaterialLocalizations.of(context).backButtonTooltip,
            )
          : null,
      title: titleWidget ??
          Text(
            title ?? '',
            style: AppFont.t.s(16).w600,
          ),
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size(double.infinity, kToolbarHeight);
}
