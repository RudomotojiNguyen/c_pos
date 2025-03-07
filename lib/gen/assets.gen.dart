/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart' as _svg;
import 'package:vector_graphics/vector_graphics.dart' as _vg;

class $AssetsConfigurationGen {
  const $AssetsConfigurationGen();

  /// File path: assets/configuration/dev.json
  String get dev => 'assets/configuration/dev.json';

  /// File path: assets/configuration/local.json
  String get local => 'assets/configuration/local.json';

  /// File path: assets/configuration/prod.json
  String get prod => 'assets/configuration/prod.json';

  /// File path: assets/configuration/staging.json
  String get staging => 'assets/configuration/staging.json';

  /// List of all assets
  List<String> get values => [dev, local, prod, staging];
}

class $AssetsLottieGen {
  const $AssetsLottieGen();

  /// File path: assets/lottie/cash-on-delivery.json
  String get cashOnDelivery => 'assets/lottie/cash-on-delivery.json';

  /// File path: assets/lottie/customer-support.json
  String get customerSupport => 'assets/lottie/customer-support.json';

  /// File path: assets/lottie/driver.json
  String get driver => 'assets/lottie/driver.json';

  /// File path: assets/lottie/empty_data.json
  String get emptyData => 'assets/lottie/empty_data.json';

  /// File path: assets/lottie/inventory.json
  String get inventory => 'assets/lottie/inventory.json';

  /// File path: assets/lottie/maintaine.json
  String get maintaine => 'assets/lottie/maintaine.json';

  /// File path: assets/lottie/notconnected.json
  String get notconnected => 'assets/lottie/notconnected.json';

  /// File path: assets/lottie/pickpackage.json
  String get pickpackage => 'assets/lottie/pickpackage.json';

  /// File path: assets/lottie/transfer.json
  String get transfer => 'assets/lottie/transfer.json';

  /// List of all assets
  List<String> get values => [
        cashOnDelivery,
        customerSupport,
        driver,
        emptyData,
        inventory,
        maintaine,
        notconnected,
        pickpackage,
        transfer
      ];
}

class $AssetsSvgGen {
  const $AssetsSvgGen();

  /// File path: assets/svg/add-to-cart.svg
  SvgGenImage get addToCart => const SvgGenImage('assets/svg/add-to-cart.svg');

  /// File path: assets/svg/barcode.svg
  SvgGenImage get barcode => const SvgGenImage('assets/svg/barcode.svg');

  /// File path: assets/svg/bill.svg
  SvgGenImage get bill => const SvgGenImage('assets/svg/bill.svg');

  /// File path: assets/svg/cash.svg
  SvgGenImage get cash => const SvgGenImage('assets/svg/cash.svg');

  /// File path: assets/svg/customer.svg
  SvgGenImage get customer => const SvgGenImage('assets/svg/customer.svg');

  /// File path: assets/svg/home-disable.svg
  SvgGenImage get homeDisable =>
      const SvgGenImage('assets/svg/home-disable.svg');

  /// File path: assets/svg/home-enanle.svg
  SvgGenImage get homeEnanle => const SvgGenImage('assets/svg/home-enanle.svg');

  /// File path: assets/svg/img_logo.svg
  SvgGenImage get imgLogo => const SvgGenImage('assets/svg/img_logo.svg');

  /// File path: assets/svg/inventory.svg
  SvgGenImage get inventory => const SvgGenImage('assets/svg/inventory.svg');

  /// File path: assets/svg/invoice.svg
  SvgGenImage get invoice => const SvgGenImage('assets/svg/invoice.svg');

  /// File path: assets/svg/ios-link.svg
  SvgGenImage get iosLink => const SvgGenImage('assets/svg/ios-link.svg');

  /// File path: assets/svg/logout.svg
  SvgGenImage get logout => const SvgGenImage('assets/svg/logout.svg');

  /// File path: assets/svg/person.svg
  SvgGenImage get person => const SvgGenImage('assets/svg/person.svg');

  /// File path: assets/svg/saving-money.svg
  SvgGenImage get savingMoney =>
      const SvgGenImage('assets/svg/saving-money.svg');

  /// File path: assets/svg/setting-disable.svg
  SvgGenImage get settingDisable =>
      const SvgGenImage('assets/svg/setting-disable.svg');

  /// File path: assets/svg/setting-enable.svg
  SvgGenImage get settingEnable =>
      const SvgGenImage('assets/svg/setting-enable.svg');

  /// File path: assets/svg/shopping.svg
  SvgGenImage get shopping => const SvgGenImage('assets/svg/shopping.svg');

  /// File path: assets/svg/sticky-notes.svg
  SvgGenImage get stickyNotes =>
      const SvgGenImage('assets/svg/sticky-notes.svg');

  /// File path: assets/svg/wallet.svg
  SvgGenImage get wallet => const SvgGenImage('assets/svg/wallet.svg');

  /// List of all assets
  List<SvgGenImage> get values => [
        addToCart,
        barcode,
        bill,
        cash,
        customer,
        homeDisable,
        homeEnanle,
        imgLogo,
        inventory,
        invoice,
        iosLink,
        logout,
        person,
        savingMoney,
        settingDisable,
        settingEnable,
        shopping,
        stickyNotes,
        wallet
      ];
}

class Assets {
  Assets._();

  static const $AssetsConfigurationGen configuration =
      $AssetsConfigurationGen();
  static const $AssetsLottieGen lottie = $AssetsLottieGen();
  static const $AssetsSvgGen svg = $AssetsSvgGen();
}

class SvgGenImage {
  const SvgGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
  }) : _isVecFormat = false;

  const SvgGenImage.vec(
    this._assetName, {
    this.size,
    this.flavors = const {},
  }) : _isVecFormat = true;

  final String _assetName;
  final Size? size;
  final Set<String> flavors;
  final bool _isVecFormat;

  _svg.SvgPicture svg({
    Key? key,
    bool matchTextDirection = false,
    AssetBundle? bundle,
    String? package,
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
    AlignmentGeometry alignment = Alignment.center,
    bool allowDrawingOutsideViewBox = false,
    WidgetBuilder? placeholderBuilder,
    String? semanticsLabel,
    bool excludeFromSemantics = false,
    _svg.SvgTheme? theme,
    ColorFilter? colorFilter,
    Clip clipBehavior = Clip.hardEdge,
    @deprecated Color? color,
    @deprecated BlendMode colorBlendMode = BlendMode.srcIn,
    @deprecated bool cacheColorFilter = false,
  }) {
    final _svg.BytesLoader loader;
    if (_isVecFormat) {
      loader = _vg.AssetBytesLoader(
        _assetName,
        assetBundle: bundle,
        packageName: package,
      );
    } else {
      loader = _svg.SvgAssetLoader(
        _assetName,
        assetBundle: bundle,
        packageName: package,
        theme: theme,
      );
    }
    return _svg.SvgPicture(
      loader,
      key: key,
      matchTextDirection: matchTextDirection,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
      placeholderBuilder: placeholderBuilder,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      colorFilter: colorFilter ??
          (color == null ? null : ColorFilter.mode(color, colorBlendMode)),
      clipBehavior: clipBehavior,
      cacheColorFilter: cacheColorFilter,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
