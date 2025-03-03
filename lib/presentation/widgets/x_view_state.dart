import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../common/configs/box.dart';

class XViewStateWidget extends StatelessWidget {
  const XViewStateWidget({
    super.key,
    this.child,
    this.buttonText,
    this.title,
    this.type = XStateType.empty,
    this.iconPath,
    this.padding,
    this.onTap,
  });

  final Widget? child;
  final String? title;
  final String? buttonText;
  final XStateType type;
  final String? iconPath;
  final EdgeInsetsGeometry? padding;
  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return InkWell(
      onTap: onTap,
      child: child ??
          Center(
            child: Padding(
              padding: padding ?? EdgeInsets.all(16.sp),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // XImage(
                  //   imagePath: iconPath ?? _getDefaultIcon(),
                  //   size: Size(200.sp, 200.sp),
                  // ),
                  Text(
                    title ?? _getDefaultTitle(context),
                    style: theme.textTheme.displayLarge,
                  ),
                  BoxSpacer.s8,
                  Text(
                    buttonText ?? '',
                    style: theme.textTheme.labelLarge,
                  ),
                  BoxSpacer.size(100),
                ],
              ),
            ),
          ),
    );
  }

  String _getDefaultTitle(BuildContext context) {
    switch (type) {
      case XStateType.loading:
        return 'Đang tải dữ liệu';
      case XStateType.empty:
      case XStateType.notFound:
        return 'Không có dữ liệu';
      case XStateType.networkError:
        return 'Kết nối mạng lỗi!';
      case XStateType.login:
        return 'Mời bạn đăng nhập để trãi nghiệm các tính năng của ứng dụng';
      case XStateType.error:
      default:
        return 'Đã có lỗi xảy ra, vui lòng thử lại sau';
    }
  }

// String _getDefaultIcon() {
//   switch (type) {
//     case XStateType.empty:
//       return AnimationConstants.empty;
//     case XStateType.notFound:
//       return AnimationConstants.notFound;
//     case XStateType.error:
//       return AnimationConstants.error;
//     case XStateType.networkError:
//       return AnimationConstants.noInternet;
//     case XStateType.login:
//       return AnimationConstants.empty;
//     default:
//       return IconConstants.icDdvLogo;
//   }
// }
}

enum XStateType { loading, empty, error, notFound, networkError, login }
