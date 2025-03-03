import 'package:flutter/material.dart';

class XRowDetailWidget extends StatelessWidget {
  const XRowDetailWidget({
    super.key,
    required this.firstChild,
    required this.secondChild,
    this.isLoading = false,
  });

  final Widget firstChild;
  final Widget secondChild;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
            child: !isLoading
                ? firstChild
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [firstChild])),
        Expanded(
            child: !isLoading
                ? secondChild
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [secondChild])),
      ],
    );
  }
}
