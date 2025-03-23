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
      'https://178c08c15a654258607b889c5aee3c39@o440638.ingest.us.sentry.io/4508979448250368';

  //
  static const timeSearchValue = 400;

  static const noImage = 'https://didongviet.vn/NoImage.png';

  static const defaultNullValue = '--';

  static const defaultTimeCountDown = 120; // tính theo giây
}

class CacheKeys {
  static const token = 'app_token';
  static const refreshToken = 'refresh_token';
}

class GlobalAppKey {
  static final rootScaffoldKey = GlobalKey<ScaffoldMessengerState>();

  static const updateDialogKey = ValueKey('updateDialogKey');
  static const internetDialogKey = ValueKey('internetDialogKey');
  static const selectBillTypeDialogKey = ValueKey('selectBillTypeDialogKey');
  static const methodDialogKey = ValueKey('methodDialogKey');
  static const addImeiDialogKey = ValueKey('addImeiDialogKey');
  static const productNoteDialogKey = ValueKey('productNoteDialogKey');
  static const imeiAttachDialogKey = ValueKey('imeiAttachDialogKey');
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
