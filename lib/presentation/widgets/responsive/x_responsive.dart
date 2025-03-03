import 'package:flutter/material.dart';

import '../../../common/constants/enum.dart';
import '../../../common/extensions/extension.dart';

class XResponsive extends StatelessWidget {
  const XResponsive(
      {super.key, this.extraLarge, this.large, this.normal, this.small});

  final Widget? extraLarge;
  final Widget? large;
  final Widget? normal;
  final Widget? small;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (context.getSize == ScreenSize.small) {
          return small ?? const SizedBox.shrink();
        }
        if (context.getSize == ScreenSize.normal) {
          return normal ?? const SizedBox.shrink();
        }
        if (context.getSize == ScreenSize.large) {
          return large ?? const SizedBox.shrink();
        }
        if (context.getSize == ScreenSize.extraLarge) {
          return extraLarge ?? const SizedBox.shrink();
        }

        return const SizedBox.shrink();
      },
    );
  }
}
