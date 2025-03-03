import 'package:flutter/material.dart';
import 'package:flutter_popup/flutter_popup.dart';

class CustomizePopUpWidget extends StatefulWidget {
  const CustomizePopUpWidget(
      {super.key, required this.child, required this.content});

  final Widget child;
  final Widget content;

  @override
  State<CustomizePopUpWidget> createState() => _CustomizePopUpWidgetState();
}

class _CustomizePopUpWidgetState extends State<CustomizePopUpWidget> {
  @override
  Widget build(BuildContext context) {
    return CustomPopup(
      backgroundColor: Colors.white,
      content: widget.content,
      child: widget.child,
    );
  }
}
