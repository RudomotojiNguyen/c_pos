import 'dart:io';

import 'package:c_pos/common/di/injection/injection.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../presentation/theme/themes.dart';
import '../configs/configurations.dart';
import '../constants/enum.dart';

extension ContextExtensions on BuildContext {
  bool get isIOS => Platform.isIOS;

  ScreenSize get getSize {
    final deviceWidth = MediaQuery.sizeOf(this).shortestSide;
    if (deviceWidth > 900) return ScreenSize.extraLarge;
    if (deviceWidth > 600) return ScreenSize.large;
    if (deviceWidth > 300) return ScreenSize.normal;
    return ScreenSize.small;
  }

  bool get isSmallScreen =>
      (getSize == ScreenSize.normal || getSize == ScreenSize.small);

  int get getNumberItemGridview {
    if (getSize == ScreenSize.extraLarge) return 8;
    if (getSize == ScreenSize.large) return 5;
    if (getSize == ScreenSize.normal) return 2;
    return 2;
  }

  double get maxWidthDialog => isSmallScreen ? double.infinity : 300;

  bool get hasDynamicIsland {
    Map<String, List<int>> supportedMachineCodes = {
      'iPhone15': [2, 3],
      //iPhone 14 Series, Pro and Pro Max
      'iPhone16': [-1],
      //All iPhone 15 Series
      'iPhone17': [1, 2, 3, 4]
      //iPhone 16 Pro, iPhone 16 Pro Max, iPhone 16, iPhone 16 Plus (the iPhone Air and or iPhone SE may not have dynamic island, so we are explicitly checking for Pro, Pro Max, Plus and Regular)
    };

    if (Platform.isIOS) {
      final IosDeviceInfo iosDeviceInfo =
          getIt.get<Configurations>().iosDeviceInfo!;
      final String machineCode = iosDeviceInfo.utsname.machine;

      final String deviceSeries = machineCode.split(',')[0];
      final int deviceModel = int.tryParse(machineCode.split(',')[1]) ?? -1;

      if (supportedMachineCodes.containsKey(deviceSeries)) {
        // check if the first element of the list is -1, if it is, then all models of the series are supported
        if (supportedMachineCodes[deviceSeries]!.first == -1) {
          return true;
        }

        return supportedMachineCodes[deviceSeries]?.contains(deviceModel) ??
            false;
      }
    }
    return false;
  }

  double get getMaxWidth => isSmallScreen ? double.infinity : 800.sp;

  Orientation get deviceOrientation => MediaQuery.of(this).orientation;

  TargetPlatform get platform => Theme.of(this).platform;

  bool get isDark => Theme.of(this).brightness == Brightness.dark;

  Brightness get platformBrightness => MediaQuery.of(this).platformBrightness;

  void get hideKeyboard => FocusScope.of(this).unfocus();

  Size get device => MediaQuery.of(this).size;

  MediaQueryData get mediaQuery => MediaQuery.of(this);

  ThemeData get theme => Theme.of(this);

  EdgeInsets get viewInsets => mediaQuery.viewInsets;

  EdgeInsets get viewPadding => mediaQuery.viewPadding;

  /// ----------- Screen size ----------- ///

  bool get isMobile => deviceWidth < 768;

  bool get isWeb => deviceWidth >= 768;

  double get deviceWidth => mediaQuery.size.width;

  double get deviceHeight => mediaQuery.size.height;

  double get toastWidth => mediaQuery.size.width * (isMobile ? 0.9 : 0.65);

  /// ----------- color ----------- ///

  Color get notificationBackgroundColor =>
      isDark ? AppColors.white : Colors.white;

  Color get errorColor => AppColors.errorColor;
}
