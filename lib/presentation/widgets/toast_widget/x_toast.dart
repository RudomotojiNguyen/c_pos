import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toastification/toastification.dart';

import '../../../common/extensions/extension.dart';
import '../../theme/themes.dart';

enum XToastEnum {
  neutral,
  positive,
  negative,
  warning,
}

class XToast {
  static void showPositiveSuccess({required String message, String? title}) {
    _showMessage(message, type: XToastEnum.positive, title: title);
  }

  static void showNegativeMessage({required String message, String? title}) {
    _showMessage(message, type: XToastEnum.negative, title: title);
  }

  static void showNeutralMessage({required String message, String? title}) {
    _showMessage(message, type: XToastEnum.neutral, title: title);
  }

  static void showWarningMessage({required String message, String? title}) {
    _showMessage(message, type: XToastEnum.warning, title: title);
  }

  static void _showMessage(
    String description, {
    String? title,
    required XToastEnum type,
  }) {
    Widget? icon;
    Color? primaryColor;
    ToastificationType? toastificationType;

    switch (type) {
      case XToastEnum.positive:
        icon = const Icon(Icons.check_circle);
        primaryColor = AppColors.successColor;
        toastificationType = ToastificationType.success;
        break;
      case XToastEnum.negative:
        icon = const Icon(Icons.error);
        primaryColor = AppColors.errorColor;
        toastificationType = ToastificationType.error;
        break;
      case XToastEnum.warning:
        icon = const Icon(Icons.warning);
        primaryColor = AppColors.warningColor;
        toastificationType = ToastificationType.warning;
        break;
      default:
        break;
    }

    toastification.show(
      type: toastificationType,
      style: ToastificationStyle.fillColored,
      autoCloseDuration: const Duration(seconds: 3),
      title: title.isNotNullOrEmpty ? Text(title!) : null,
      description: RichText(text: TextSpan(text: description)),
      alignment: Alignment.topRight,
      direction: TextDirection.ltr,
      // animationDuration: const Duration(milliseconds: 300),
      // animationBuilder: (context, animation, alignment, child) {
      //   return FadeTransition(
      //     opacity: animation,
      //     child: child,
      //   );
      // },
      icon: icon,
      showIcon: true,
      primaryColor: primaryColor,
      // backgroundColor: Colors.white,
      // foregroundColor: Colors.black,
      padding: EdgeInsets.symmetric(horizontal: 12.sp, vertical: 16.sp),
      // margin: EdgeInsets.symmetric(horizontal: 12.sp).copyWith(bottom: 8.sp),
      borderRadius: BorderRadius.all(AppRadius.l),
      boxShadow: const [
        BoxShadow(
          color: Color(0x07000000),
          blurRadius: 16,
          offset: Offset(0, 16),
          spreadRadius: 0,
        )
      ],
      // showProgressBar: true,
      closeButtonShowType: CloseButtonShowType.onHover,
      closeOnClick: true,
      pauseOnHover: true,
      dragToClose: true,
      applyBlurEffect: false,
    );
  }

  static loading() {
    BotToast.showLoading();
  }

  static closeAllLoading() {
    BotToast.closeAllLoading();
  }
}
