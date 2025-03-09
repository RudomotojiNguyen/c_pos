import 'package:flutter/material.dart';

class AppConstants {
  static const screenWidth = 1170.0;
  static const screenHeight = 2532.0;
  static const voucherWidth = 307;
  static const voucherHeight = 112;
  static const voucherGraphicSize = 92;
  static const avatarSize = 512.0;
  static const imageQuality = 30;
  static const dsnSentry =
      'https://028c7c6038364e13a5d7f0f606c7affe@sentry.ddverp.com/7';
  static const prevDeepLink = 'https://ddvloyalty.page.link';

  ///key
  static const updateDialogKey = ValueKey('updateDialogKey');
  static const internetDialogKey = ValueKey('internetDialogKey');

  //
  static const timeSearchValue = 400;

  static const noImage = 'https://didongviet.vn/NoImage.png';

  static const defaultNullValue = '--';

  /// key
  static const selectBillTypeDialogKey = ValueKey('selectBillTypeDialogKey');
}

enum XSearchType { all, ddv, sisMobifone }

enum XVoucherType { all, redeem, promotion }

enum XRatingType { ugly, bad, normal, good, excellent }

enum XNotificationType { all, me, promotion }

class CacheKeys {
  static const token = 'ddv_token';
  static const refreshToken = 'refresh_token';
}

class DdvConfig {
  static int otpExpiredTime = 5 * 60;

  // static String customerSupportPhoneNumber = '18006018';
  // static String guaranteeConditions =
  //     'https://didongviet.vn/chinh-sach/chinh-sach-bao-hanh';
  // static String termAndConditions = 'https://didongviet.vn/chinh-sach/chinh-sach-su-dung';
  //
  // static String refundProduct = 'https://didongviet.vn/chinh-sach/chinh-sach-doi-tra';
  // static String customerSupportEmail = 'lienhe@didongviet.vn';

  // static String checkUpdate = 'https://didongviet.page.link/checkUpdate';
  static String checkUpdate = 'https://flutter.dev';
}

class DdvGlobalKey {
  static final rootScaffoldKey = GlobalKey<ScaffoldMessengerState>();
}

enum TextStyleEnum {
  displayLarge,
  displayMedium,
  displaySmall,
  headlineLarge,
  headlineMedium,
  headlineSmall,
  titleLarge,
  titleMedium,
  titleSmall,
  bodyLarge,
  bodyMedium,
  bodySmall,
  labelLarge,
  labelMedium,
  labelSmall,
}
