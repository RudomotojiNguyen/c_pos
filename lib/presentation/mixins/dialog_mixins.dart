import 'package:c_pos/common/extensions/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

import '../../common/configs/box.dart';
import '../../common/constants/app_constants.dart';
import '../../common/enum/enum.dart';
import '../theme/themes.dart';
import '../widgets/widgets.dart';

mixin DialogHelper {
  static final _allPopups = <Key, BuildContext>{};

  void dismissAllPopups() {
    for (final context in _allPopups.values) {
      Navigator.of(context).pop();
    }
    _allPopups.clear();
  }

  void dismissPopup({required Key key, bool willPop = true}) {
    final aContext = _allPopups[key];
    if (aContext != null) {
      _allPopups.remove(key);
      if (willPop) {
        Navigator.of(aContext).pop();
      }
    }
  }

  Key _keyForPopup() {
    return UniqueKey();
  }

  ///--- dialog ---///

  Future<void> showXDialog(
    BuildContext context, {
    String? title,
    Widget? content,
    Key? key,
    String? closeItemLabel,
    List<Widget>? actions,
    Function()? onDialogClosed,
    double? width,
    double? height,
    Widget? headerWidget,
    Widget? footerWidget,
    bool barrierDismissible = false,
    EdgeInsetsGeometry? padding,
  }) async {
    Key keyDialog = key ?? _keyForPopup();
    if (_allPopups.containsKey(keyDialog)) {
      return;
    }

    _allPopups[keyDialog] = context;
    await showDialog(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(AppRadius.xxm),
          ),
          child: Container(
            padding: padding,
            width: width,
            height: height,
            child: const Column(),
          ),
        );
      },
    ).then((value) {
      if (onDialogClosed != null) {
        onDialogClosed();
      }
      dismissPopup(key: keyDialog, willPop: false);
    });
  }

  Future<void> showWidgetDialog(
    BuildContext context, {
    required Widget content,
    String title = '',
    Key? key,
    String? closeItemLabel,
    List<Widget>? actions,
    Function()? onDialogClosed,
    bool barrierDismissible = false,
    EdgeInsetsGeometry? padding,
    AlignmentGeometry? alignment,
  }) async {
    Key keyDialog = key ?? _keyForPopup();
    if (_allPopups.containsKey(keyDialog)) {
      return;
    }
    _allPopups[keyDialog] = context;

    await showDialog(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (BuildContext context) {
        return PopScope(
          canPop: barrierDismissible,
          child: Dialog(
            alignment: alignment,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(AppRadius.xxl),
            ),
            child: Padding(
              padding: EdgeInsets.all(18.sp),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (title.isNotEmpty) ...[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          title,
                          style: AppFont.t.s(14).primaryColor,
                        ),
                        XBaseButton(
                          onPressed: () => Navigator.pop(context),
                          child: Icon(
                            Icons.close,
                            size: 24.sp,
                            color: AppColors.iconColor,
                          ),
                        )
                      ],
                    ),
                    BoxSpacer.s8,
                  ],
                  content,
                ],
              ),
            ),
          ),
        );
      },
    ).then((value) {
      if (onDialogClosed != null) {
        onDialogClosed();
      }
      dismissPopup(key: keyDialog, willPop: false);
    });
  }

  Future showInternetDisconnect(BuildContext context) async {
    await showWidgetDialog(
      context,
      barrierDismissible: true,
      key: GlobalAppKey.internetDialogKey,
      alignment: Alignment.bottomCenter,
      content: const InternetDialog(),
    );
  }

  ///--- bottom sheet ---///
  Future showXBottomSheet(
    BuildContext context, {
    Key? key,
    bool isScrollControlled = true,
    bool isWrapContent = false,
    bool enableDrag = true,
    bool isDismissible = true,
    required Widget body,
    EdgeInsetsGeometry? padding,
    EdgeInsetsGeometry? margin,
    Color? bgColor,
    double? maxHeight,
  }) async {
    Key keyDialog = key ?? _keyForPopup();
    if (_allPopups.containsKey(keyDialog)) {
      return;
    }

    _allPopups[keyDialog] = context;

    return await showModalBottomSheet(
        context: context,
        enableDrag: enableDrag,
        isScrollControlled: isScrollControlled,
        backgroundColor: Colors.transparent,
        isDismissible: isDismissible,
        builder: (ctx) {
          final screenHeight = MediaQuery.of(ctx).size.height;
          double keyboardHeight = MediaQuery.of(ctx).viewInsets.bottom;
          final availableHeight = screenHeight - keyboardHeight;
          // Tính toán chiều cao tối đa cho modal
          double calculatedMaxHeight;
          if (maxHeight != null) {
            // Nếu có maxHeight được chỉ định, sử dụng giá trị nhỏ hơn
            calculatedMaxHeight =
                maxHeight < availableHeight ? maxHeight : availableHeight;
          } else {
            // Nếu không có maxHeight, sử dụng chiều cao khả dụng
            calculatedMaxHeight = availableHeight;
          }

          // Đảm bảo modal không vượt quá 90% chiều cao màn hình
          calculatedMaxHeight = calculatedMaxHeight > screenHeight * 0.9
              ? screenHeight * 0.9
              : calculatedMaxHeight;

          return SafeArea(
            child: XBaseButton(
              onPressed: () => context.hideKeyboard,
              child: Container(
                constraints: BoxConstraints(
                  maxHeight: calculatedMaxHeight,
                ),
                padding: (padding ??
                    EdgeInsets.symmetric(vertical: 16.sp, horizontal: 16.sp)),
                margin: margin ??
                    EdgeInsets.symmetric(
                      horizontal: 16.sp,
                      vertical: 16.sp,
                    ).copyWith(bottom: keyboardHeight),
                decoration: BoxDecoration(
                  color: bgColor ?? AppColors.white,
                  borderRadius: BorderRadius.all(AppRadius.xxl),
                ),
                child: body,
              ),
            ),
          );
        }).then((value) {
      dismissPopup(key: keyDialog, willPop: false);
      return value;
    });
  }

  Future<void> showConfirmDialog(
    BuildContext context, {
    Key? key,
    bool barrierDismissible = false,
    required String contentWarning,
    required Function() onAccept,
  }) async {
    Key keyDialog = key ?? _keyForPopup();
    if (_allPopups.containsKey(keyDialog)) {
      return;
    }
    _allPopups[keyDialog] = context;

    await showDialog(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(AppRadius.xxl),
          ),
          child: Padding(
              padding: EdgeInsets.all(18.sp),
              child: ConfirmDialog(
                contentWarning: contentWarning,
                onAccept: () {
                  Navigator.pop(context);
                  onAccept();
                },
                onCancel: () {
                  Navigator.pop(context);
                },
              )),
        );
      },
    ).then((value) {
      dismissPopup(key: keyDialog, willPop: false);
    });
  }

  Future showModalSelectImage(
    BuildContext context, {
    required Function(XFile?) callback,
  }) async {
    Key keyDialog = _keyForPopup();
    if (_allPopups.containsKey(keyDialog)) {
      return;
    }

    _allPopups[keyDialog] = context;

    await showModalBottomSheet(
        context: context,
        enableDrag: true,
        isDismissible: true,
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        builder: (_) {
          context.hideKeyboard;
          return SafeArea(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16.sp, vertical: 32.sp),
              margin: EdgeInsets.only(bottom: 16.sp, left: 16.sp, right: 16.sp),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(32.sp),
              ),
              child: SelectImageDialog(callback: callback),
            ),
          );
        }).then((value) {
      dismissPopup(key: keyDialog, willPop: false);
    });
    return null;
  }

  Future showModalCameraScan(
    BuildContext context, {
    required Function({String? code, List<String>? codes}) onResult,
    TypeSelect typeSelect = TypeSelect.single,
  }) async {
    Key keyDialog = _keyForPopup();
    if (_allPopups.containsKey(keyDialog)) {
      return;
    }

    _allPopups[keyDialog] = context;

    await showModalBottomSheet(
        context: context,
        enableDrag: true,
        isDismissible: true,
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        builder: (_) {
          return XBaseButton(
            onPressed: () => context.hideKeyboard,
            child: Container(
              padding: EdgeInsets.zero,
              margin: EdgeInsets.only(top: 120.sp),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.all(AppRadius.xxl),
              ),
              child: ScanCodeDialog(
                typeSelect: typeSelect,
                onResult: onResult,
              ),
            ),
          );
        }).then((value) {
      dismissPopup(key: keyDialog, willPop: false);
    });
    return null;
  }
}
